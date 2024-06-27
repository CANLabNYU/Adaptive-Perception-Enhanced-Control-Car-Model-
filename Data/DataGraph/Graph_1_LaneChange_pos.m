close all

color_code = [0.9,0.9,0.9];

new_data = readtable("Data_Scenario_1_pos.csv");
% new_data(:, "Time") = [];

gap = 2;

% Target Points
figure
hold on
new_y_array = [];
new_x_array = [];
for n = 1:20
    if mod(n, gap) == 1
        x = table2array(new_data(:, n));
    else
        y = table2array(new_data(:, n));
        new_x_array = [new_x_array, x];
        new_y_array = [new_y_array, y];
        plot(x, y, 'Color', color_code);
    end
end
new_x_array = mean(new_x_array, 2);
new_y_array = mean(new_y_array, 2);
plot(new_x_array, new_y_array, 'Color', 'r', 'linewidth', 2);
title('Position vs Time Step')
xlim([2000,7000]);
ylim([2700,3500]);

% Deco ---
leg = legend('$Experiments$', '', '', '', '', '', '', '', '', '', '$Average$', 'Location','northwest');
set(leg, 'interpreter', 'latex')

legend boxoff
set(gca, 'fontsize', 15)
box off

ax = gca;
ax.FontSize = 15;
% Deco ---

xlabel('Position X');
ylabel('Position Y');

hold off