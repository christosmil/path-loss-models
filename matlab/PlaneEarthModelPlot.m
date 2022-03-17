function PlaneEarthModelPlot()
clc; close all;

distances = [100:50:950 1000:500:10000];
transmitterHeights = [10 15 30];
receiverHeight = 1.8;

LINEWIDTH = 2;
LINESTYLES = ["-" "--" ":"];
MARKERSIZE = LINEWIDTH + 2;
MARKERS = ["*" "v" "square"];
FONTNAME = "Calibri Light";
FONTSIZE = 18;
RESULTS_FOLDER = "./results";

if not(isfolder(RESULTS_FOLDER))
    mkdir(RESULTS_FOLDER);
end

planeEarth = zeros(length(transmitterHeights), length(distances));
for iter1 = 1:length(distances)
    for iter2 = 1:length(transmitterHeights)
        [planeEarth(iter2, iter1)] = PlaneEarthModel(distances(iter1), ...
            10, 10, transmitterHeights(iter2), receiverHeight);
    end
end

figure;
for iter = 1:height(planeEarth)
    semilogx(distances, planeEarth(iter,:), 'LineWidth', LINEWIDTH, ...
        'LineStyle', LINESTYLES(iter), 'MarkerSize', MARKERSIZE, ...
        'Marker', MARKERS(iter), 'DisplayName', ...
        sprintf('h_t = %dm', transmitterHeights(iter)));
    hold on;
end
hold off;
grid on;
set(gca, 'FontSize', FONTSIZE, 'FontName', FONTNAME);
xlabel("Distance (m)");
ylabel("Path Loss (dB)");
legend('Location', 'SouthEast');
saveas(gcf, sprintf('%s/analytical-plane-earth.svg', RESULTS_FOLDER));
end