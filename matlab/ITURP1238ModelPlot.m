function ITURP1238ModelPlot()
X=1:1:100;
ITU1238900=zeros(1,length(X));
ITU12382400=zeros(1,length(X));
ITU12385800=zeros(1,length(X));
for i=1:length(X)
    [ITU1238900(1,i)] = ITURP1238Model(X(i), 900);
    [ITU12382400(1,i)] = ITURP1238Model(X(i), 2400);
    [ITU12385800(1,i)] = ITURP1238Model(X(i), 5800);
end
figure;
plot(X,ITU1238900, X,ITU12382400, X,ITU12385800);
grid on;
title("ITU-R P.1238 Path Loss (Offices w/ 1 floor)");
xlabel("distance (m)");
ylabel("Path Loss (dB)")
legend("900MHz", "2.4GHz", "5.8GHz");
figure;
semilogx(X,ITU1238900, X,ITU12382400, X,ITU12385800);
grid on;
title("ITU-R P.1238 Path Loss (Offices w/ 1 floor)");
xlabel("distance (m)");
ylabel("Path Loss (dB)")
legend("900MHz", "2.4GHz", "5.8GHz");
end