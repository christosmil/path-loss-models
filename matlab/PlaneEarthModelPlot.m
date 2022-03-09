function PlaneEarthModelPlot()
X=10:1:10000; % distance in meters
PE = zeros(1,length(X));
for i=1:length(X)
    [PE(1,i)] = PlaneEarthModel(X(i), 10, 10, 9, 1.8);
end
figure;
plot(X,PE);
grid on;
title("Plane Earth Model Path Loss");
xlabel("Distance (m)");
ylabel("Path Loss (dB)");
annotation('textbox', 'String', {['h_t=9m' newline 'h_r=1.8m' newline 'G_t=10dB' newline 'G_r=10dB']});
figure;
semilogx(X,PE);
grid on;
title("Plane Earth Model Path Loss");
xlabel("Distance (m)");
ylabel("Path Loss (dB)");
annotation('textbox', 'String', {['h_t=9m' newline 'h_r=1.8m' newline 'G_t=10dB' newline 'G_r=10dB']});
end