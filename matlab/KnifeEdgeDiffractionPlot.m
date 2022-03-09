function KnifeEdgeDiffractionPlot()
X = -5:0.025:5;
Y1 = zeros(1,length(X));
Y2 = zeros(1,length(X));
for i=1:length(X)
        [Y1(1,i)]=KnifeEdgeDiffraction(X(i));
        [Y2(1,i)]=KnifeEdgeDiffraction2(X(i));
end
figure('Name','Path Loss - Knife Edge Diffraction in Fresnel Zone');
plot(X,Y1, X,Y2);
set(gca,'Ydir','reverse');
title('Path Loss - Knife Edge Diffraction in Fresnel Zone');
grid on;
xlabel('u');
ylabel('Diffraction Path Loss from Knife Edge Obstacle (dB)');
legend('approximation', 'exact calculation');
end