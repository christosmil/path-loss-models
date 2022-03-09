function EgliModelPlot()
X = 1:1:1000; % distance in m
Y = 90:1:1000; % frequency in MHz
E100 = zeros(1,length(X));
E450 = zeros(1,length(X));
E900 = zeros(1,length(X));
Efrequenccy = zeros(1,length(Y));
for i = 1:length(X)
    [E100(1,i)] = EgliModel(X(i),100,10,2);
    [E450(1,i)] = EgliModel(X(i),450,10,2);
    [E900(1,i)] = EgliModel(X(i),900,10,2);
end
for j = 90:length(Y)
    [Efrequenccy(1,j)] = EgliModel(10,Y(j),10,2);
end
figure;
semilogx(X,E100, X,E450, X,E900);
grid on;
title("Egli Model Loss (h(BS)=10m, h(MS)=2m)");
xlabel("Distance (m)");
ylabel("Loss (dB)");
legend("100 MHz", "450 MHz", "900 MHz");
figure;
semilogx(Y,Efrequenccy);
grid on;
title("Egli Model Loss");
xlabel("Frequency (MHz)");
ylabel("Loss (dB)");
legend("d = 10 m, h(BS) = 10 m, h(MS) = 2 m");