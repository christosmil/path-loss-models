function OkumuraHataModelPlot()
X = 1:0.1:20;
OH150 = zeros(1, length(X));
OH450 = zeros(1, length(X));
OH900 = zeros(1, length(X));
Y=150:1:1500;
OH1KM = zeros(1,length(Y));
OH5KM = zeros(1,length(Y));
OH10KM = zeros(1,length(Y));
OH20KM = zeros(1,length(Y));
% input arguments:
%   hBS = 30m
%   hMS = 1.8m
%   environment = 0 (urban), citySize = 1 (small/medium cities) 
for i=1:length(X)
    [OH150(1, i)] = OkumuraHataModel(150, 30, 1.8, X(i), 0, 1);
    [OH450(1, i)] = OkumuraHataModel(450, 30, 1.8, X(i), 0, 1);
    [OH900(1, i)] = OkumuraHataModel(900, 30, 1.8, X(i), 0, 1);
end
for j=1:length(Y)
    [OH1KM(1, j)] = OkumuraHataModel(Y(j), 30, 1.8, 1, 0, 1);
    [OH5KM(1, j)] = OkumuraHataModel(Y(j), 30, 1.8, 5, 0, 1);
    [OH10KM(1, j)] = OkumuraHataModel(Y(j), 30, 1.8, 10, 0, 1);
    [OH20KM(1, j)] = OkumuraHataModel(Y(j), 30, 1.8, 20, 0, 1);
end
figure;
plot(X,OH150, X,OH450, X,OH900);
grid on;
title("Okumura-Hata Model Path Loss (h(BS)=30m, h(MS)=1.8m, small/medium size cities)");
xlabel("distance (km)");
ylabel("Path Loss (dB)");
legend("150MHz", "450MHz", "900MHz");
figure;
semilogx(X,OH150, X,OH450, X,OH900);
grid on;
title("Okumura-Hata Model Path Loss (h(BS)=30m, h(MS)=1.8m, small/medium size cities)");
xlabel("distance (km)");
ylabel("Path Loss (dB)");
legend("150MHz", "450MHz", "900MHz");
figure;
plot(Y,OH1KM, Y,OH5KM, Y,OH10KM, Y,OH20KM);
grid on;
title("Okumura-Hata Model Path Loss (h(BS)=30m, h(MS)=1.8m, small/medium size cities)");
xlabel("frequency (MHz)");
ylabel("Path Loss (dB)");
legend("Tx-Rx: 1km", "Tx-Rx: 5km", "Tx-Rx: 10km", "Tx-Rx: 20km");