function [PLdB] = ITURP1238Model(d, f)
% for input arguments:
%   -d in m
%   -f in MHz
%   -we consider only "Office" propagation environment which is the most
%    most complete in terms of parameters "n" and "Lf" values.
%    If needed, we can add a paramenter "environmentChoice" and extend the
%    MATLAB function to be applicable in "Residential", "Commercial",
%    "Factory", "Corridor" and "Data Centre" environments.
%   -we consider only one-floor Offices for simplicity
%   -we consider frequencies of 900MHz, 1.8GHz-2GHz, 2.4GHz, 3.5GHz, 5.2GHz
%    and 5.8GHz
if (f == 900)
    n = 33;
    Lf = 9;
elseif (f >= 1800) && (f <= 200)
    n = 30;
    Lf = 15;
elseif (f == 2400)
    n = 30;
    Lf = 14;
elseif (f == 3500)
    n = 27;
    Lf = 18;
elseif (f == 5200)
    n = 31;
    Lf = 16;
elseif (f == 5800)
    n = 24;
    Lf = 22;
else
    disp("Please select one of the above frequencies:");
    disp("900MHz, 1.8GHz-2GHz, 2.4GHz, 3.5GHz, 5.2GHz or 5.8GHz")
    PLdB = 0;
    return;
end
PLdB = 20*log10(f) + n*log10(d) + Lf - 28;
end