function KnifeEdgeDiffractionPlot()
clc; close all;

fresnelKirchhoff = -5:0.1:5;

LINEWIDTH = 2;
LINESTYLES = ["-" "--" ":"];
FONTNAME = "Calibri Light";
FONTSIZE = 18;
RESULTS_FOLDER = "./results";

if not(isfolder(RESULTS_FOLDER))
    mkdir(RESULTS_FOLDER);
end

knifeEdgeDiffraction = zeros(2,length(fresnelKirchhoff));
for iter = 1:length(fresnelKirchhoff)
        [knifeEdgeDiffraction(1,iter)] = ...
            KnifeEdgeDiffractionApproximation(fresnelKirchhoff(iter));
        [knifeEdgeDiffraction(2,iter)] = ...
            KnifeEdgeDiffractionExact(fresnelKirchhoff(iter));
end
figure("Position", get(0, 'ScreenSize'), 'Visible', 'off');
for iter = 1:2
    plot(fresnelKirchhoff, knifeEdgeDiffraction(iter,:), 'LineWidth', ...
        LINEWIDTH, 'LineStyle', LINESTYLES(iter));
    hold on;
end
hold off;
set(gca,'Ydir','reverse');
grid on;
set(gca, 'FontSize', FONTSIZE, 'FontName', FONTNAME);
xlabel('Fresnel - Kirchhoff factor {\it u}');
ylabel('Diffraction Path Loss from Knife Edge Obstacle (dB)');
legend('approximation', 'exact calculation', 'Location', 'NorthEast');
saveas(gcf, sprintf('%s/analytical-knife-edge-diffraction.svg', ...
    RESULTS_FOLDER));
exportgraphics(gcf, sprintf('%s/analytical-knife-edge-diffraction.png', ...
    RESULTS_FOLDER));
end