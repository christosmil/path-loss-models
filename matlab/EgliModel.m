function [LdB] = EgliModel(d,f,hBS,hMS)
% Frequency in MHz, distance/heights in meters
if (f>=90 && f<=1000)
    LdB=20*log10(hBS*hMS)-40*log10(d)+20*log10(40/f);
else
    disp('Invalid Input!');
    LdB=-1;
end
end