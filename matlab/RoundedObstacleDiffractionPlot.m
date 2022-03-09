function RoundedObstacleDiffractionPlot()
X = 0:0.01:4;
TdB05 = zeros(1, length(X));
TdB1 = zeros(1, length(X));
TdB2 = zeros(1, length(X));
TdB5 = zeros(1, length(X));
TdB10 = zeros(1, length(X));
TdB20 = zeros(1, length(X));
TdB100 = zeros(1, length(X));
for i=1:length(X)
    [TdB05(1, i)] = RoundedObstacleDiffraction(X(i), 0.5);
    [TdB1(1, i)] = RoundedObstacleDiffraction(X(i), 1);
    [TdB2(1, i)] = RoundedObstacleDiffraction(X(i), 2);
    [TdB5(1, i)] = RoundedObstacleDiffraction(X(i), 5);
    [TdB10(1, i)] = RoundedObstacleDiffraction(X(i), 10);
    [TdB20(1, i)] = RoundedObstacleDiffraction(X(i), 20);
    [TdB100(1, i)] = RoundedObstacleDiffraction(X(i), 100);
end
figure;
plot(X,TdB05, X,TdB1, X,TdB2, X,TdB5, X,TdB10, X,TdB20, X,TdB100);
grid on;
title("T(m,n) values - Rounded Obstacle Diffraction");
xlabel("m");
ylabel("T(m,n) (dB)");
legend("n=0.5", "n=1", "n=2", "n=5", "n=10", "n=20", "n=100");
end