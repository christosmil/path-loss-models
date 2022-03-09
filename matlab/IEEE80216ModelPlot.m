function IEEE80216ModelPlot()
X = 0.1:0.1:8;
IEEE802161900 = zeros(1, length(X));
IEEE802162500 = zeros(1, length(X));
IEEE802163500 = zeros(1, length(X));
IEEE80216A = zeros(1, length(X));
IEEE80216B = zeros(1, length(X));
IEEE80216C = zeros(1, length(X));
for i=1:length(X)
    [IEEE802161900(1, i)] = IEEE80216Model(X(i), 1900, 30, 2, 0);
    [IEEE802162500(1, i)] = IEEE80216Model(X(i), 2500, 30, 2, 0);
    [IEEE802163500(1, i)] = IEEE80216Model(X(i), 3500, 30, 2, 0);
    [IEEE80216A(1, i)] = IEEE80216Model(X(i), 2000, 30, 2, 0);
    [IEEE80216B(1, i)] = IEEE80216Model(X(i), 2000, 30, 2, 1);
    [IEEE80216C(1, i)] = IEEE80216Model(X(i), 2000, 30, 2, 2);
end
% test model according to frequency
figure;
semilogx(X,IEEE802161900, X,IEEE802162500, X,IEEE802163500);
grid on;
title("IEEE 802.16 Model Path Loss (h(BS)=30m, h(MS)=2m, terrain type A)");
xlabel("distance (km)");
ylabel("Path Loss (dB)");
legend("1900MHz", "2500MHz", "3500MHz");
figure;

% test model according to terrain
plot(X,IEEE80216A, X,IEEE80216B, X,IEEE80216C);
grid on;
title("IEEE 802.16 Model Path Loss (h(BS)=30m, h(MS)=2m, f=2GHz)");
xlabel("distance (km)");
ylabel("Path Loss (dB)");
legend("terrain type A", "terrain type B", "terrain type C");
figure;
semilogx(X,IEEE80216A, X,IEEE80216B, X,IEEE80216C);
grid on;
title("IEEE 802.16 Model Path Loss (h(BS)=30m, h(MS)=2m, f=2GHz)");
xlabel("distance (km)");
ylabel("Path Loss (dB)");
legend("terrain type A", "terrain type B", "terrain type C");