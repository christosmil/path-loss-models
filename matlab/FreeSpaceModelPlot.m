function FreeSpaceModelPlot()
X = 1:1:1000; % distance in m
FS900 = zeros(1,length(X));
FS1800 = zeros(1,length(X));
FS2400 = zeros(1,length(X));
for i = 1:length(X)
    [FS900(1,i)] = FreeSpaceModel(X(i),900);
    [FS1800(1,i)] = FreeSpaceModel(X(i),1800);
    [FS2400(1,i)] = FreeSpaceModel(X(i),2400);
end
figure;
semilogx(X,FS900,X,FS1800,X,FS2400);
grid on;
title("Free Space Path Loss");
xlabel("Distance (m)");
ylabel("Path Loss (dB)");
legend("900 MHz", "1800 MHz", "2400 MHz");