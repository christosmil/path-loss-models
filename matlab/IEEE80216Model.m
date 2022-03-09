function [PLdB] = IEEE80216Model(d, f, hBS, hMS, terrain)
% for input arguments:
%   -f in MHz with range [450, 11200]
%   -hBS in m with range [10, 80]
%   -hMS in m with range [2, 10]
%   -d in km with range [0.1, 8]
%   -terrain can be type A (=0), type B (=1) or type C (any other number)

% check frequency carrier validity
if (f < 450) || (f > 11200)
    disp("Invalid frequency carrier input!");
    PLdB = 0;
    return;
end

% check Base Staion height validity
if (hBS < 10) || (hBS > 80)
    disp("Invalid Base Station height input!");
    PLdB = 0;
    return;
end

% check Mobile Station height validity
if (hMS < 2) || (hMS > 10)
    disp("Invalid Mobile Station height input!");
    PLdB = 0;
    return;
end

% check distance validity
if (d < 0.1) || (d > 8)
    disp("Invalid distance Tx-Rx input!");
    PLdB = 0;
    return;
end
% convert distance to meters for PL expression validity
d = d*1000;

% calculate free space losses
FreeSpaced0 = 32.45 + 20*log10(f) + 20*log10(0.1); % distance = 100m = 0.1km

% calculate gamma expression
if (terrain == 0)
    a = 4.6;
    b = 0.0075;
    c = 12.6;
elseif (terrain == 1)
    a = 4;
    b = 0.0065;
    c = 17.1;
else
    a = 3.6;
    b = 0.005;
    c = 20;
end
gamma = a - b*hBS + c/hBS;

% calculate kf, kh
kf = 6*log10(f/2000);
if (terrain == 0) || (terrain == 1)
    kh = -10.8*log10(hMS/2);
elseif (terrain == 2) && (hMS <= 3)
    kh = -10*log10(hMS/3);
else
    kh = -20*log10(hMS/3);
end

% calculate PLdB
PLdB = FreeSpaced0 + 10*gamma*log10(d/100) + kf + kh;
end