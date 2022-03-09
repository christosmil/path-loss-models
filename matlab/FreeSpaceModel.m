function [PLdB] = FreeSpaceModel(d,f)
% user input:
% distance in meters
% frequency in MHz
d = d/1000; % convert distance in km
PLdB = 32.45 + 20*log10(f) + 20*log10(d);
end