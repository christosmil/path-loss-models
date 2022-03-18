function [L_dB] = KnifeEdgeDiffractionExact(u)
syms t;
f(t) = exp(-1j*((pi*t^2)/2));
L = ((1+1j)/2)*int(f(t), t, u, Inf);
L_dB = 20*log10(L);
L_dB = -L_dB;
end