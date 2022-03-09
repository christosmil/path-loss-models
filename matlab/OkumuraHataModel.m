function[LdB] = OkumuraHataModel(fc, hBS, hMS, d, environmentChoice, citySize)
% for input arguments:
%   -fc in MHz with range [150, 1500]
%   -hBS in m with range [30, 200]
%   -hMS in m with range [1, 10]
%   -d in km with range [1, 20]
%   -environment can be Urban (=0), Suburban (=1), Rural (=2)
%   -citySize can be big (=0) or small/medium (any number other value) 

% check frequency carrier validity
if (fc < 150) || (fc > 1500)
    disp("Invalid frequency carrier input!");
    LdB = 0;
    return;
end

% check Base Staion height validity
if (hBS < 30) || (hBS > 200)
    disp("Invalid Base Station height input!");
    LdB = 0;
    return;
end

% check Mobile Station height validity
if (hMS < 1) || (hMS > 10)
    disp("Invalid Mobile Station height input!");
    LdB = 0;
    return;
end

% check distance validity
if (d < 1) || (d > 20)
    disp("Invalid distance Tx-Rx input!");
    LdB = 0;
    return;
end

% check environment validity
if (environmentChoice ~= 0) && (environmentChoice ~= 1) && (environmentChoice ~= 2)
    disp("Invalid environment input!");
    LdB = 0;
    return;
end

% calculate a(hMS) in most cases, i.e.: small and medium size cities
ahMS = (1.1*log10(fc) - 0.7)*hMS - (1.56*log10(fc) - 0.8);

% default values C, D
C = 0;
D = 0;

% calculate L[URBAN] - necessary for all environments
% ---------------------------------------------------
% check whether ahMS needs modification
if (citySize == 0) && (fc <= 200)
    ahMS = 8.29*(log10(1.54*hMS))^2 - 1.1;
elseif (citySize == 0) && (fc >= 400)
    ahMS = 3.2*(log10(11.75*hMS))^2 - 4.97;
end
LdB = 69.55 + 26.16*log10(fc) - 13.82*log10(hBS) - ahMS + (44.9 - 6.55*log10(hBS))*log10(d);

if (environmentChoice == 0)
    % URBAN environment
    return;
elseif (environmentChoice == 1)
    % SUBURBAN environment
    LdB = LdB - (2*(log10(fc/28))^2 + 5.4);
    return;
elseif (environmentChoice == 1)
    % SUBURBAN environment
    LdB = LdB - (4.78*(log10(fc))^2 + 18.33*log10(fc) - 40.94);
    return;
end
end