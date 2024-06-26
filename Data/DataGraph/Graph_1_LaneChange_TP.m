close all

color_code = [0.9,0.9,0.9];

new_data = DataSenario1LaneChangetargetpoint;

x = table2array(new_data(:, "Time"));
new_data(:, "Time") = [];

% Target Points
figure
hold on
new_y_array = [];
for n = 1:10
    y = table2array(new_data(:, n));
    new_y_array = [new_y_array, y];
    plot(x, y, 'Color', color_code);
end
new_y_array = round(mean(new_y_array, 2));
plot(x, new_y_array, 'Color', 'r', 'linewidth', 2);

title('Target Point vs Time Step')
ylim([-2,2]);

% Deco ---
leg = legend('$Experiments$', '', '', '', '', '', '', '', '', '', '$Average$', 'Location','southwest');
set(leg, 'interpreter', 'latex')

legend boxoff
set(gca, 'fontsize', 15)
box off

ax = gca;
ax.FontSize = 15;
% Deco ---

xlabel('Time Step');
ylabel('Target Point');

hold off