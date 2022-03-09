function WINNERIIModelPlot()
X = 10:1:5000;
Y = 10:1:10000;
W = 3:1:150;
Z = 10:1:150;
XYZW = 3:1:10000;
WUMiLOS = zeros(1, length(X));
WUMaLOS = zeros(1, length(X));
WRMaLOS = zeros(1, length(Y));
WIHLOS = zeros(1, length(W));
WIHNLOS = zeros(1, length(Z));
for i=1:length(X)
    [WUMiLOS(1, i)] = WINNERIIModel(X(i), 2.4, 0);
    [WUMaLOS(1, i)] = WINNERIIModel(X(i), 2.4, 1);
end
for i=1:length(Y)
    [WRMaLOS(1, i)] = WINNERIIModel(Y(i), 2.4, 2);
end
for i=1:length(W)
    [WIHLOS(1, i)] = WINNERIIModel(W(i), 2.4, 3);
end
for i=1:length(Z)
    [WIHNLOS(1, i)] = WINNERIIModel(Z(i), 2.4, 4);
end
h1 = figure;
semilogx(X,WUMiLOS);
figure(h1);
grid on;
title("WINNER II Path Loss (fc = 2.4MHz)");
xlabel("distnace (m)");
ylabel("Path Loss (dB)");
hold on;
semilogx(Y,WRMaLOS);
hold on;
semilogx(W,WIHLOS);
hold on;
semilogx(Z,WIHNLOS);
legend(sprintf("Urban Microcells (UMi) LOS\nUrban Macrocells (UMa) LOS"), "Rural Macrocells (RMa) LOS", "Indoor Hotspot (InH) LOS", "Indoor Hotspot (InH) NLOS");
end