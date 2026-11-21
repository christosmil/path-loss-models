function [llog, llinear] = oh2023(fc, hbs, hms, d, env)
% oh2023(fc, hbs, hms, d, env) calculates 50% losses based on the
% Okumura-Hata model.
%
% The function receives the following input arguments.
%   fc      frequency carrier [150, 1500]MHz
%   hbs     base station antenna height [30, 200]m
%   hms     mobile station antenna height [1, 10]m
%   d       distance [1, 20]km
%   env     link environment {'urban', 'suburban', 'rural'}
%
% The function returns the following values.
%   llog    losses in logarithmic scale
%   llinear losses in linear scale

% Validate input parameter.
arguments
    fc (1, 1) double {mustBeInRange(fc, 150, 1500)}
    hbs (1, 1) double {mustBeInRange(hbs, 30, 200)}
    hms (1, 1) double {mustBeInRange(hms, 1, 10)}
    d (1, 1) double {mustBeInRange(d, 1, 20)}
    env (1, 1) string {mustBeMember(env, {'urban', 'suburban', 'rural'})}
end

% Calculate ahms.
if fc <= 200
    ahms = 8.29*((log10(1.54*hms))^2) - 1.1;
elseif fc >= 400
    ahms = 3.2*((log10(11.75*hms))^2) - 4.97;
else
    ahms = (1.1*log10(fc) - 0.7)*hms - (1.56*log10(fc) - 0.8);
end

% Calculate losses in log scale.
llog = 69.55 + 26.16*log10(fc) - 13.82*log10(hbs) - ahms + ...
    (44.9 - 6.55*log10(hbs))*log10(d);
switch env
    case 'suburban'
        llog = llog - 2*((log10(fc/28))^2) - 5.4;
    case 'rural'
        llog = llog - 4.78*((log10(fc))^2) + 18.33*log10(fc) - 40.94;
end

% Calculate losses in linear scale.
llinear = 10^(llog/10);

end
