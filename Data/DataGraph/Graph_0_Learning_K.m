close all

K = DataSenario0k;

index = [1 2 3 4 5 6 7 8 9 10];

K(:, "Time") = [];

figure
plot(K{1, index}, '-.', 'LineWidth', 2)
hold on
plot(K{2, index}, '-.', 'LineWidth', 2)
hold on
plot(K{3, index}, '-.', 'LineWidth', 2)
hold on
plot(K{4, index}, '-.', 'LineWidth', 2)
hold on
plot(K{5, index}, '-.', 'LineWidth', 2)
hold on
plot(K{6, index}, '-.', 'LineWidth', 2)

set(gca, 'box', 'off')
title("K")
ylim([-12,6]);

% Deco ---
leg = legend('$K_1$', '$K_2$', '$K_3$', '$K_4$', '$K_5$', '$K_6$', 'Location','Best');
set(leg, 'interpreter', 'latex', 'NumColumns',2)

legend boxoff
set(gca, 'fontsize', 15)
box off

ax = gca;
ax.FontSize = 15;
% Deco ---

xlabel('Trial');
ylabel('K');