close all

color_code = [0.9,0.9,0.9];

new_data = DataSenario2Stoptargetpoint;

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
new_y_array = mean(new_y_array, 2);
for n = 1:100
    mean_y = new_y_array(n);
    if n < 40 & mean_y < 0.5
        new_y_array(n) = 0;
    elseif mean_y > 0
        new_y_array(n) = 1;
    elseif mean_y == 0
        new_y_array(n) = 0;
    else
        new_y_array(n) = -1;
    end
end

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