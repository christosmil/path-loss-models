function [PLdB] = PlaneEarthModel(d, Gt, Gr, ht, hr)
% for input parameters:
%   distance in meters
%   Gt = transmitter's antenna gain
%   Gr = receiver's antenna gain
%   ht = transmitter's antenna height in meters
%   hr = receiver's antenna height in meters
PLdB = 40*log10(d) - 10*log10(Gt) - 10*log10(Gr) - 20*log10(ht) - 20*log10(hr);
end