function SimpleLinearModelPlot()
X=1:1:100;
SL1900 = zeros(1, length(X));
SL2400 = zeros(1, length(X));
SL3800 = zeros(1, length(X));
for i=1:length(X)
    [SL1900(1, i)] = SimpleLinearModel(X(i), 1900);
    [SL2400(1, i)] = SimpleLinearModel(X(i), 2400);
    [SL3800(1, i)] = SimpleLinearModel(X(i), 3800);
end
figure;
plot(X,SL1900, X,SL2400, X,SL3800);
grid on;
title("Simple Linear Model Path Loss (shopping mall)");
xlabel("distance (m)");
ylabel("Path Loss (dB)");
legend("1.9 GHz", "2.4 GHz", "3.8 GHz");
figure;
semilogx(X,SL1900, X,SL2400, X,SL3800);
grid on;
title("Simple Linear Model Path Loss (shopping mall)");
xlabel("distance (m)");
ylabel("Path Loss (dB)");
legend("1.9 GHz", "2.4 GHz", "3.8 GHz");
end