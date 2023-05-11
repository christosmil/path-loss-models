function [llog, llinear] = sui(d, htx, hrx, f, env)
% sui(d, htx, hrx, f, env) calculates the path loss based on the Stanford
% University Interim (SUI) model.
%
% The function receives the following input arguments.
%   d       distance between receiver and transmitter [0.1, 8]km
%   htx     transmitter antenna height [10, 80]m
%   hrx     receiver antenna height [2, 10]m
%   f       frequency [1900, 3500]MHz
%   env     link environment {'urban', 'suburban', 'rural'}
%
% The function returns the following output values.
%   llog    losses in logaritmic scale
%   llinear losses in linaer scale
%
% References:
%   S. Petrov, 'Propagation Models for WiMAX at 3.5 GHz', ELEKTRO, 2012
%   A. I. Sulyman et al., 'Radio Propagation Path Loss Models for 5G
%       Cellular Networks in the 28 GHz and 38 GHz Millimeter-Wave Bands',
%       IEEE Communications Magazine, 2014

% Validate arguments.
arguments
    d (1, 1) double {mustBeInRange(d, 0.1, 8)}
    htx (1, 1) double {mustBeInRange(htx, 10, 80)}
    hrx (1, 1) double {mustBeInRange(hrx, 2, 10)}
    f (1, 1) double {mustBeInRange(f, 1900, 3500)}
    env (1, 1) string {mustBeMember(env, {'urban', 'suburban', 'rural'})}
end

% Calculate lambda from frequency.
f_hz = f*1000000;
c = 299792458;
lambda = c/f_hz;

% Calculate reference losses for the loss formula.
d_zero = 0.1;
ref_losses = 20*log10(4*pi*d_zero/lambda);

% Set parameters a, b, c for the path loss exponent.
switch env
    case 'urban'
        a = 4.6;
        b = 0.0075;
        c = 12.6;
    case 'suburban'
        a = 4.0;
        b = 0.0065;
        c = 17.1;
    otherwise
        a = 3.6;
        b = 0.005;
        c = 20;
end

% Calculate the path loss exponent.
path_loss_exp = a - b*htx + c/htx;

% Calculate corrections for high frequencies (x_f), receiveing antenna
% height (x_h) and shadowing (x_s).
x_f = 6*log10(f/2000);
switch env
    case 'rural'
        x_h = -20*log10(hrx/2000);
    otherwise
        x_h = -10.8*log10(hrx/2000);
end
switch env
    case 'urban'
        x_s = 10.6;
    otherwise
        x_s = 8.2;
end

% Calculate the losses in logarithmic scale.
llog = ref_losses + 10*path_loss_exp*log10(d/0.1) + x_f + x_h + x_s;

% Calculate the losses in linear scale.
llinear = 10^(llog/10);

end