function [PLdB] = KeenanMotleyModel(d, kw1, kw2, kw3, kf1)
% distance in meters
% kw1 = # of brick walls (Loss = 2.5dB)
% kw2 = # of plasterboard walls (Loss = 1.3dB)
% kw3 = # of concrete walls (Loss = 10.8dB)
% kf1 = # of floors (Loss = 23.62dB)
%
% Note: In the formula PLdB = PL(d0) + 10*n*log10(d) + symsum(kfi*Lfi, i, 1, I) + symsum(kwj*Lwj, j, 1, J)
%       we assume PL(d0) = 37dB and n = 2.
PLdB = 37 + 20*log10(d) + kw1*2.5 + kw2*1.3 + kw3*10.8 + kf1*23.62;
end