close all

color_code = [0.9,0.9,0.9];

new_data = DataSenario2Stopstate;

x = table2array(new_data(:, "Time"));
x = x(1:100);
new_data(:, "Time") = [];
gap = 2;

index = 5;

% e
video_object_e = VideoWriter('2_stop_e.avi');
video_object_e.FrameRate = 10;
open(video_object_e)
figure
hold on
y = table2array(new_data(:, index*gap + 1));
for i = 1:length(x)
    plot(x(1:i), y(1:i), 'Color', 'r', 'linewidth', 2)
    xlim([0,length(x)]);
    title('x_1 vs Time Step')
    ylim([-20,20]);
    xlabel('Time Step');
    ylabel('x_1');
    pause(0.1);
    frame = getframe(gcf);
    writeVideo(video_object_e, frame);
end
hold off
close(video_object_e)

% theta
video_object_theta = VideoWriter('2_stop_theta.avi');
video_object_theta.FrameRate = 10;
open(video_object_theta)
figure
hold on
y = table2array(new_data(:, index*gap + 2));
for i = 1:length(x)
    plot(x(1:i), y(1:i), 'Color', 'r', 'linewidth', 2)
    xlim([0,length(x)]);
    title('x_2 vs Time Step')
    ylim([-0.1,0.15]);
    xlabel('Time Step');
    ylabel('x_2');
    pause(0.1);
    frame = getframe(gcf);
    writeVideo(video_object_theta, frame);
end
hold off
close(video_object_theta)