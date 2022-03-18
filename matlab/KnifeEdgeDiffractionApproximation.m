function [L_dB] = KnifeEdgeDiffractionApproximation(u)
if (u < -0.7)
    L_dB = 0;
else
    L_dB = 6.9 + 20*log10(sqrt(((u-0.1)^2)+1)+u-0.1);
end
end