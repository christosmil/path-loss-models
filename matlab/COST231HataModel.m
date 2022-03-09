function [LdB] = COST231HataModel(fc, hBS, hMS, d, citySize)
% for input arguments:
%   -fc in MHz with range [1500, 2000]
%   -hBS in m with range [30, 200]
%   -hMS in m with range [1, 10]
%   -d in km with range [1, 20]
%   -citySize can be small/medium (=0) or big (any number other value)

% check frequency carrier validity
if (fc < 1500) || (fc > 2000)
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

% calculate A, B, C, a(hMS)
ahMS = (1.1*log10(fc) - 0.7)*hMS - (1.56*log10(fc) - 0.8);
A = 46.3 + 33.9*log10(fc) - 13.82*log10(hBS) - ahMS;
B = 44.9 - 6.55*log10(hBS);
C = 0;
if (citySize ~= 0)
    C = 3;
end

% calculate L[dB]
LdB = A + B*log10(d) + C;
end