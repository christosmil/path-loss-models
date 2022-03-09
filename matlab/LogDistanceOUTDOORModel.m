function [PLdB] = LogDistanceOUTDOORModel (d, f, n, cellSize)
% for input arguments:
%   -d in m (or km???)
%   -f in MHz
%   -n depends on cell size:
%       -macrocells: n from 2 to 4
%       -microcells: n from 1.6 to 8
%   cellSize can be macrocells (=0) or microcells (any other value)
if (cellSize == 0) && ((n < 2) || (n > 4))
     disp("Invalid n input for macrocells!");
     PLdB = 0;
     return;
end
if (n < 1.6) || (n > 8)
    disp("Invalid n input for microcells!");
    PLdB = 0;
    return;
end
if (cellSize == 0)
    d0 = 1; % macrocells d0: distance = 1000m = 1km
else
    d0 = 0.1; % microcells d0: distance = 100m = 0.1km
end
FreeSpaced0 = 32.45 + 20*log10(f) + 20*log10(d0);
% d0 = d0*1000; % convert d0 to m for validity
PLdB = 40 + 10*n*log10(d/d0);
end