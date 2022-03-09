function COST231MWMModelPlot()
X = 1:1:100;
COST231MWM2KW1 = zeros(1, length(X));
COST231MWM1KW2 = zeros(1, length(X));
COST231MWM1KF = zeros(1, length(X));
for i=1:length(X)
    [COST231MWM2KW1(1,i)] = COST231MWMModel(X(i), 2400, 2, 0, 0);
    [COST231MWM1KW2(1,i)] = COST231MWMModel(X(i), 2400, 0, 1, 0);
    [COST231MWM1KF(1,i)] = COST231MWMModel(X(i), 2400, 0, 0, 1);
end
figure;
plot(X,COST231MWM2KW1, X,COST231MWM1KW2, X,COST231MWM1KF);
grid on;
title("COST231-MWM Path Loss (f = 2.4GHz)");
xlabel("distance (m)");
ylabel("Path Loss (dB)");
legend("2 walls of type 1", "1 walls of type 2", "1 floor");
figure;
semilogx(X,COST231MWM2KW1, X,COST231MWM1KW2, X,COST231MWM1KF);
grid on;
title("COST231-MWM Path Loss (f = 2.4GHz)");
xlabel("distance (m)");
ylabel("Path Loss (dB)");
legend("2 walls of type 1", "1 wall of type 2", "1 floor");
end