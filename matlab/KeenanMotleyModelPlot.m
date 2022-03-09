function KeenanMotleyModelPlot()
X=1:1:100; % distance in meters
KM0WALLS0FLOORS = zeros(1,length(X));
KM1kf11kf21kf30FLOORS = zeros(1,length(X));
KM0WALLS1FLOOR = zeros(1,length(X));
KM1kf11kf21kf31FLOORS = zeros(1,length(X));
for i=1:length(X)
    [KM0WALLS0FLOORS(1,i)] = KeenanMotleyModel(X(i), 0, 0, 0, 0);
    [KM1kf11kf21kf30FLOORS(1,i)] = KeenanMotleyModel(X(i), 1, 1, 1, 0);
    [KM0WALLS1FLOOR(1,i)] = KeenanMotleyModel(X(i), 0, 0, 0, 1);
    [KM1kf11kf21kf31FLOORS(1,i)] = KeenanMotleyModel(X(i), 1, 1, 1, 1);
end
figure;
plot(X,KM0WALLS0FLOORS, X,KM1kf11kf21kf30FLOORS, X,KM0WALLS1FLOOR, X,KM1kf11kf21kf31FLOORS);
grid on;
title("Keenan-Motley Model Path Loss");
xlabel("Distance (m)");
ylabel("Path Loss (dB)");
legend("0 walls (any type), 0 floors", "1 brick wall, 1 plasterboard wall, 1 concrete wall , 0 floors",...
    "0 walls (any type), 1 floor", "1 brick wall, 1 plasterboard wall, 1 concrete wall , 1 floor");
figure;
semilogx(X,KM0WALLS0FLOORS, X,KM1kf11kf21kf30FLOORS, X,KM0WALLS1FLOOR, X,KM1kf11kf21kf31FLOORS);
grid on;
title("Keenan-Motley Model Path Loss");
xlabel("Distance (m)");
ylabel("Path Loss (dB)");
legend("0 walls (any type), 0 floors", "1 brick wall, 1 plasterboard wall, 1 concrete wall , 0 floors",...
    "0 walls (any type), 1 floor", "1 brick wall, 1 plasterboard wall, 1 concrete wall , 1 floor");
end