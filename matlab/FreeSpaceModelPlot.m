function FreeSpaceModelPlot()
clc; close all;

distances = [1:0.5:9 10:5:90 100:50:1000];
frequencies = [900 1800 2400];

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

freeSpace = zeros(length(frequencies),length(distances));
for iter1 = 1:length(distances)
    for iter2 = 1:length(frequencies)
        freeSpace(iter2, iter1) = FreeSpaceModel(distances(iter1), ...
            frequencies(iter2));
    end
end

figure('Position', get(0, 'Screensize'), 'visible', 'off');
for iter = 1:height(freeSpace)
    semilogx(distances, freeSpace(iter,:), 'LineWidth', LINEWIDTH, ...
        'LineStyle', LINESTYLES(iter), 'MarkerSize', MARKERSIZE, ...
        'Marker', MARKERS(iter), 'DisplayName', ...
        sprintf('%dMHz', frequencies(iter)));
    hold on;
end
hold off;
grid on;
set(gca, 'FontSize', FONTSIZE, 'FontName', FONTNAME);
xlabel("Distance (m)");
ylabel("Path Loss (dB)");
legend('Location', 'SouthEast');
saveas(gcf, sprintf('%s/analytical-free-space.svg', RESULTS_FOLDER));
exportgraphics(gcf, sprintf('%s/analytical-free-space.png', ...
    RESULTS_FOLDER));
end