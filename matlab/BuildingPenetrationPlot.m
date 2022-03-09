function BuildingPenetrationPlot()
X = 100:1:6000; % frequency in MHz
BP = zeros(1,length(X));
for i = 1:length(X)
    [BP(1,i)] = BuildingPenetration(X(i));
end
figure;
semilogx(X,BP);
grid on;
title("Building Penetration Loss");
xlabel("Frequency (MHz)");
ylabel("Loss (dB)");