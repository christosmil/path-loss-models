function oh2023plot()
% oh2023plot() plot losses based on Okumura-Hata model with respect to
% bs-ms distance. To calculate losses the function uses the oh2023(fc, hbs,
% hms, d, env). Frequency has two values; one low at 300MHz, one high at
% 1500MHz. Base station is at 50m. Mobile station is at 2m. Distance takes
% values from 1km to 20km. All environments are tested.

% Close all open figures.
close all;

% Fix plot parameters.
LINEWIDTH = 2;
LINESTYLE_FC_LOW = '-';
LINESTYLE_FC_HIGH = '--';
COLOR_URBAN = '#ab1234';
COLOR_SUBUR = 'b';
COLOR_RURAL = 'g';
MARKER_URBAN = 'o';
MARKER_SUBUR = 's';
MARKER_RURAL = '+';
MARKERSIZE = 6;
FONTSIZE = 16;
FONTSIZE_TITLE = FONTSIZE + 10;
FONTSIZE_AXIS = FONTSIZE + 4;
FONTNAME = 'Calibri';

% Fix parameters.
FC_LOW = 300;
FC_HIGH = 1500;
HBS = 50;
HMS = 2;
DISTANCES = [1:0.1:2 2.2:0.2:5 5.5:0.5:20];

% Calculate losses.
losses = zeros(6, length(DISTANCES));
for iter=1:length(DISTANCES)
    % Low frequencies.
    losses(1, iter) = oh2023(FC_LOW, HBS, HMS, DISTANCES(iter), 'urban');
    losses(2, iter) = oh2023(FC_LOW, HBS, HMS, DISTANCES(iter), ...
        'suburban');
    losses(3, iter) = oh2023(FC_LOW, HBS, HMS, DISTANCES(iter), 'rural');
    % High frequencies.
    losses(4, iter) = oh2023(FC_HIGH, HBS, HMS, DISTANCES(iter), 'urban');
    losses(5, iter) = oh2023(FC_HIGH, HBS, HMS, DISTANCES(iter), ...
        'suburban');
    losses(6, iter) = oh2023(FC_HIGH, HBS, HMS, DISTANCES(iter), 'rural');
end

% Plot losses.
figure(Visible='on');
plot(DISTANCES, losses(1, :), LineWidth=LINEWIDTH, ...
    LineStyle=LINESTYLE_FC_LOW, Color=COLOR_URBAN, Marker=MARKER_URBAN, ...
    MarkerSize=MARKERSIZE);
hold on;
plot(DISTANCES, losses(2, :), LineWidth=LINEWIDTH, ...
    LineStyle=LINESTYLE_FC_LOW, Color=COLOR_SUBUR, Marker=MARKER_SUBUR, ...
    MarkerSize=MARKERSIZE);
plot(DISTANCES, losses(3, :), LineWidth=LINEWIDTH, ...
    LineStyle=LINESTYLE_FC_LOW, Color=COLOR_RURAL, Marker=MARKER_RURAL, ...
    MarkerSize=MARKERSIZE);
plot(DISTANCES, losses(4, :), LineWidth=LINEWIDTH, ...
    LineStyle=LINESTYLE_FC_HIGH, Color=COLOR_URBAN, Marker=MARKER_URBAN,...
    MarkerSize=MARKERSIZE);
plot(DISTANCES, losses(5, :), LineWidth=LINEWIDTH, ...
    LineStyle=LINESTYLE_FC_HIGH, Color=COLOR_SUBUR, Marker=MARKER_SUBUR,...
    MarkerSize=MARKERSIZE);
plot(DISTANCES, losses(6, :), LineWidth=LINEWIDTH, ...
    LineStyle=LINESTYLE_FC_HIGH, Color=COLOR_RURAL, Marker=MARKER_RURAL,...
    MarkerSize=MARKERSIZE);
hold off;

% Style plot.
grid on;
set(gca, FontSize=FONTSIZE, FontName=FONTNAME);
title_string = sprintf('50%% Losses Okumura-Hata (hbs=%dm, hms=%dm)', ...
    HBS, HMS);
title(title_string, FontSize=FONTSIZE_TITLE);
xlabel('Distance (km)', FontSize=FONTSIZE_AXIS);
ylabel('Loss (dB)', FontSize=FONTSIZE_AXIS);
legend_strings = {...
    sprintf('urban, %dMHz', FC_LOW) ...
    sprintf('suburban, %dMHz', FC_LOW) ...
    sprintf('rural, %dMHz', FC_LOW) ...
    sprintf('urban, %dMHz', FC_HIGH) ...
    sprintf('suburban, %dMHz', FC_HIGH) ...
    sprintf('rural, %dMHz', FC_HIGH) ...
};
legend(legend_strings, location='southeast');

end