function [PLdB] = SimpleLinearModel(d, f)
% for input arguments:
%   -d in m
%   -f in MHz
%   -for parameter a:
%    we consider wireless links in the range [900MHz, 4GHz]
%    and the distance is up to 100m (indoor shopping mall environment)
if (d < 1) || (d > 100)
    disp("Invalid distance input!");
    PLdB = 0;
    return;
end
if (f < 900) || (f > 4000)
    disp("Invalid frequency input!");
    PLdB = 0;
    return;
end
if (f <= 1520)
    a = 0.2;
elseif (f <= 2140)
    a = 0.3;
elseif (f <= 2760)
    a = 0.4;
elseif (f <= 3380)
    a = 0.5;
else
    a = 0.6;
end
FreeSpace = 32.45 + 20*log10(f) + 20*log10(d/1000); % distance in km for compatibility with the equation
PLdB = FreeSpace + a*d;
end