function sui_plot()
% sui_plot() plots the Stanford University Interim (SUI) model losses. It
% calculates the losses based on the sui(d, htx, hrx, f, env) script. The
% htx depends on the environment, and is at 50m in urban, 30m in suburban,
% and 20m in rural. The hrx and d have fixed values at 3m, and a vector
% from 0.1km to 8km with variable sampling, respectively. Two carrier
% frequencies are tested; a low frequency at 1900MHz and a high frequency
% at 3500MHz. All possible environments are tested, i.e., 'urban',
% 'suburban', 'rural'.

% Close all open figures.
close all;

% Set calculations fixed parameters.
HRX = 3;
DISTANCES = [0.1:0.05:1 1.1:0.1:2 2.2:0.2:3 3.5:0.5:8];
FC_LOW = 1900;
FC_HIGH = 3500;

% Set plotting parameters.
URBAN_COLOR = '#2277cc';
SUBUR_COLOR = '#9922aa';
RURAL_COLOR = '#118833';
FC_LOW_LINESTYLE = '-';
FC_HIGH_LINESTYLE = '--';
LINEWIDTH = 2;
URBAN_MARKER = '*';
SUBUR_MARKER = 's';
RURAL_MARKER = 'D';
TITLE_FONTSIZE = 24;
AXIS_FONTSIZE = 22;
FONT_NAME = 'Times New Roman';

% Calculate the losses with the use of sui(d, htx, hrx, d, env) script.
losses = zeros(6, length(DISTANCES));
for iter=1:length(DISTANCES)
    % Losses for low carrier frequency.
    losses(1, iter) = sui(DISTANCES(iter), 50, HRX, FC_LOW, 'urban');
    losses(2, iter) = sui(DISTANCES(iter), 30, HRX, FC_LOW, 'suburban');
    losses(3, iter) = sui(DISTANCES(iter), 20, HRX, FC_LOW, 'rural');
    % Losses for high carrier frequency.
    losses(4, iter) = sui(DISTANCES(iter), 50, HRX, FC_HIGH, 'urban');
    losses(5, iter) = sui(DISTANCES(iter), 30, HRX, FC_HIGH, 'suburban');
    losses(6, iter) = sui(DISTANCES(iter), 20, HRX, FC_HIGH, 'rural');
end

% Plot the losses.
figure(Visible="on");
plot(DISTANCES, losses(1, :), Color=URBAN_COLOR, ...
    LineStyle=FC_LOW_LINESTYLE, LineWidth=LINEWIDTH, Marker=URBAN_MARKER);
hold on;
plot(DISTANCES, losses(2, :), Color=SUBUR_COLOR, ...
    LineStyle=FC_LOW_LINESTYLE, LineWidth=LINEWIDTH, Marker=SUBUR_MARKER);
plot(DISTANCES, losses(3, :), Color=RURAL_COLOR, ...
    LineStyle=FC_LOW_LINESTYLE, LineWidth=LINEWIDTH, Marker=RURAL_MARKER);
plot(DISTANCES, losses(4, :), Color=URBAN_COLOR, ...
    LineStyle=FC_HIGH_LINESTYLE, LineWidth=LINEWIDTH, Marker=URBAN_MARKER);
plot(DISTANCES, losses(5, :), Color=SUBUR_COLOR, ...
    LineStyle=FC_HIGH_LINESTYLE, LineWidth=LINEWIDTH, Marker=SUBUR_MARKER);
plot(DISTANCES, losses(6, :), Color=RURAL_COLOR, ...
    LineStyle=FC_HIGH_LINESTYLE, LineWidth=LINEWIDTH, Marker=RURAL_MARKER);
hold off;

% Style the plot.
grid on;
set(gca, FontName=FONT_NAME, FontSize=AXIS_FONTSIZE-6);
title_string = sprintf("SUI Model Losses (hrx = %dm)", HRX);
title(title_string, FontSize=TITLE_FONTSIZE);
xlabel('Distance (km)', FontSize=AXIS_FONTSIZE);
ylabel('Loss (dB)', FontSize=AXIS_FONTSIZE);
legend_strings = {
    sprintf('%dMHz, Urban (htx = 50m)', FC_LOW), ...
    sprintf('%dMHz, Suburban (htx = 30m)', FC_LOW), ...
    sprintf('%dMHz, Rural (htx = 20m)', FC_LOW), ...
    sprintf('%dMHz, Urban (htx = 50m)', FC_HIGH), ...
    sprintf('%dMHz, Suburban (htx = 30m)', FC_HIGH), ...
    sprintf('%dMHz, Rural (htx = 20m)', FC_HIGH), ...
    };
legend(legend_strings, Location='southeast' , FontSize=AXIS_FONTSIZE);

end
