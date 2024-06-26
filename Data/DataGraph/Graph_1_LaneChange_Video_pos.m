close all

color_code = [0.9,0.9,0.9];

new_data = DataSenario1LaneChangepos;

x = table2array(new_data(:, "Time"));
new_data(:, "Time") = [];

time = x(1:100);

index = 11;

% pos
video_object_pos = VideoWriter('1_LaneChange_pos.avi');
video_object_pos.FrameRate = 10;
open(video_object_pos)
figure
hold on
x = table2array(new_data(:, index*2-1));
y = table2array(new_data(:, index*2));
for i = 1:length(time)
    plot(x(1:i), y(1:i), 'Color', 'r', 'linewidth', 2)
    xlim([0,length(x)]);
    title('pos vs Time Step')
    xlim([2000,6500])
    ylim([2700,3500]);
    xlabel('Position X');
    ylabel('Position Y');
    pause(0.1);
    frame = getframe(gcf);
    writeVideo(video_object_pos, frame);
end
hold off
close(video_object_pos)