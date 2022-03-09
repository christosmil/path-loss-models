function LogDistanceINDOORModelPlot()
X = 1:1:100; % distance in m
LGIHALLWAYS = zeros(1,length(X));
LGIBIGOPENROOMS = zeros(1,length(X));
LGIFULLOFFURNITUREROOMS = zeros(1,length(X));
LGIMULTIPLEFLOORS = zeros(1,length(X));
for i = 1:length(X)
    [LGIHALLWAYS(1,i)] = LogDistanceINDOORModel(X(i),1);
    [LGIBIGOPENROOMS(1,i)] = LogDistanceINDOORModel(X(i),2);
    [LGIFULLOFFURNITUREROOMS(1,i)] = LogDistanceINDOORModel(X(i),3);
    [LGIMULTIPLEFLOORS(1,i)] = LogDistanceINDOORModel(X(i),4);
end
figure;
semilogx(X,LGIHALLWAYS, X,LGIBIGOPENROOMS, X,LGIFULLOFFURNITUREROOMS, X,LGIMULTIPLEFLOORS);
grid on;
title("Log Distance Model (INDOOR) Path Loss");
xlabel("Distance (m)");
ylabel("Path Loss (dB)");
legend("hallways", "big open rooms", "rooms full of furniture", "multiple floors");