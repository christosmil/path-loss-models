function COST231HataModelPlot()
X = 1:0.1:20;
CH1500 = zeros(1, length(X));
CH1850 = zeros(1, length(X));
CH2000 = zeros(1, length(X));
Y=1500:1:2000;
CH1KM = zeros(1,length(Y));
CH5KM = zeros(1,length(Y));
CH10KM = zeros(1,length(Y));
CH20KM = zeros(1,length(Y));
for i=1:length(X)
    [CH1500(1, i)] = COST231HataModel(1500, 30, 1.8, X(i), 0);
    [CH1850(1, i)] = COST231HataModel(1850, 30, 1.8, X(i), 0);
    [CH2000(1, i)] = COST231HataModel(2000, 30, 1.8, X(i), 0);
end
for j=1:length(Y)
    [CH1KM(1, j)] = COST231HataModel(Y(j), 30, 1.8, 1, 0);
    [CH5KM(1, j)] = COST231HataModel(Y(j), 30, 1.8, 5, 0);
    [CH10KM(1, j)] = COST231HataModel(Y(j), 30, 1.8, 10, 0);
    [CH20KM(1, j)] = COST231HataModel(Y(j), 30, 1.8, 20, 0);
end
figure;
plot(X,CH1500, X,CH1850, X,CH2000);
grid on;
title("COST231-Hata Model Path Loss (h(BS)=30m, h(MS)=1.8m, small/medium size cities)");
xlabel("distance (km)");
ylabel("Path Loss (dB)");
legend("1500MHz", "1850MHz", "2000MHz");
figure;
semilogx(X,CH1500, X,CH1850, X,CH2000);
grid on;
title("COST231-Hata Model Path Loss (h(BS)=30m, h(MS)=1.8m, small/medium size cities)");
xlabel("distance (km)");
ylabel("Path Loss (dB)");
legend("1500MHz", "1850MHz", "2000MHz");
figure;
plot(Y,CH1KM, Y,CH5KM, Y,CH10KM, Y,CH20KM);
grid on;
title("COST231-Hata Model Path Loss (h(BS)=30m, h(MS)=1.8m, small/medium size cities)");
xlabel("frequency (MHz)");
ylabel("Path Loss (dB)");
legend("Tx-Rx: 1km", "Tx-Rx: 5km", "Tx-Rx: 10km", "Tx-Rx: 20km");