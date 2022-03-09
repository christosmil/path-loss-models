function COST231WalfischIkegamiModelPlot()
X = 0.02:0.01:5;
COST231WILOS = zeros(1, length(X));
COST231WINLOSSmallCity = zeros(1, length(X));
COST231WINLOSMetropolitanCenter = zeros(1, length(X));
for i=1:length(X)
    [COST231WILOS(1, i)] = COST231WalfischIkegamiModel(1800, 25, 1.8, X(i), 0, 0, 0);
    [COST231WINLOSSmallCity(1, i)] = COST231WalfischIkegamiModel(1800, 25, 1.8, X(i), 0, 18, 0);
    [COST231WINLOSMetropolitanCenter(1, i)] = COST231WalfischIkegamiModel(1800, 25, 1.8, X(i), 0, 18, 1);
end
figure;
plot(X,COST231WILOS, X,COST231WINLOSSmallCity, X,COST231WINLOSMetropolitanCenter);
grid on;
title("COST231 - Walfisch-Ikegami Model Losses (fc = 1800MHz, hBS = 25m, hMS = 1.8m)");
xlabel("Distance (km)");
ylabel("Losses (dB)");
legend("LOS link", "NLOS, hroof=18m, b=80, \phi=45deg, small city", "NLOS, hroof=18m, b=80, \phi=45deg, metropolitan center");
figure;
semilogx(X,COST231WILOS, X,COST231WINLOSSmallCity, X,COST231WINLOSMetropolitanCenter);
grid on;
title("COST231 - Walfisch-Ikegami Model Losses (fc = 1800MHz, hBS = 25m, hMS = 1.8m)");
xlabel("Distance (km)");
ylabel("Losses (dB)");
legend("LOS link", "NLOS, hroof=18m, b=80, \phi=45deg, small city", "NLOS, hroof=18m, b=80, \phi=45deg, metropolitan center");
end