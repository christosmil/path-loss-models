function [TdB] = RoundedObstacleDiffraction(m, n)
TdB = (8.2 + 12*n)*(m^(0.73 + 0.27*(1 - exp(-1.43*n))));
end