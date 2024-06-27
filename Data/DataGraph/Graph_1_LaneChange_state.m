close all

color_code = [0.9,0.9,0.9];

new_data = readtable("IROS_Data/Data_Senario_1_LaneChange_state.xlsx");

x = table2array(new_data(:, "Time"));
new_data(:, "Time") = [];
gap = 2;
total_n = 2*10;

% e
figure
hold on
new_y_array = [];
for n = 1:total_n
    if mod(n, gap) == 1
        y = table2array(new_data(:, n));
        new_y_array = [new_y_array, y];
        plot(x, y, 'Color', color_code);
    end
end
new_y_array = mean(new_y_array, 2);
plot(x, new_y_array, 'Color', 'r', 'linewidth', 2);

title('x_1 vs Time Step')
ylim([-20,20]);

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
ylabel('x_1');

hold off

% theta
figure
hold on
new_y_array = [];
for n = 1:total_n
    if mod(n, gap) == 0
        y = table2array(new_data(:, n));
        new_y_array = [new_y_array, y];
        plot(x, y, 'Color', color_code);
    end
end
new_y_array = mean(new_y_array, 2);
plot(x, new_y_array, 'Color', 'r', 'linewidth', 2);

title('x_2 vs Time Step')
ylim([-0.1,0.15]);

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
ylabel('x_2');

hold off