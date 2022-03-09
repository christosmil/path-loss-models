function [PLdB] = COST231MWMModel(d, f, kw1, kw2, kf)
% for input arguments:
%   -d in m
%   -f in MHz
%   -kw1 is the number of walls type 1 (light type wall) between Tx-Rx
%   -kw1 is the number of walls type 1 (heavy type wall) between Tx-Rx
%   -kf is the number of floors between Tx-Rx
%   -we consider Lc = 0
FreeSpace = 32.45 + 20*log10(f) + 20*log10(d/1000); % distance in km for compatibility with the equation
PLW1 = kw1*3.4;
PLW2 = kw2*36.9;
PLkf = (kf^(((kf + 2)/(kf + 1)) - 0.46))*18.3;
PLdB = FreeSpace + PLW1 + PLW2 + PLkf;
end