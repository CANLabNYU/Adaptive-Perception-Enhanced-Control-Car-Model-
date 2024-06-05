#include <librealsense2/rs.hpp>
#include <opencv2/opencv.hpp>
#include <iostream>
#include <vector>

// Dummy function to simulate object detection, replace with actual detection logic
std::vector<cv::Rect> detectObjects(const cv::Mat& frame) {
    std::vector<cv::Rect> boxes;
    // Example: Adding a fixed box for demonstration purposes
    boxes.push_back(cv::Rect(100, 100, 50, 50));
    return boxes;
}

int main() {
    // Initialize RealSense pipeline
    rs2::pipeline pipe;
    rs2::config cfg;
    cfg.enable_stream(RS2_STREAM_COLOR, RS2_FORMAT_BGR8);
    pipe.start(cfg);

    // Create OpenCV window
    const std::string window_name = "RealSense Object Tracking";
    cv::namedWindow(window_name, cv::WINDOW_AUTOSIZE);

    while (true) {
        // Wait for the next set of frames from the camera
        rs2::frameset frames = pipe.wait_for_frames();
        rs2::frame color_frame = frames.get_color_frame();

        // Convert RealSense frame to OpenCV matrix
        cv::Mat frame(cv::Size(color_frame.get_width(), color_frame.get_height()), CV_8UC3, (void*)color_frame.get_data(), cv::Mat::AUTO_STEP);

        // Detect objects in the frame
        std::vector<cv::Rect> boxes = detectObjects(frame);

        // Draw bounding boxes and display pixel placement
        for (const auto& box : boxes) {
            cv::rectangle(frame, box, cv::Scalar(0, 255, 0), 2);
            std::cout << "Bounding box: x=" << box.x << ", y=" << box.y << ", width=" << box.width << ", height=" << box.height << std::endl;
        }

        // Display the frame
        cv::imshow(window_name, frame);

        // Break the loop if 'q' is pressed
        if (cv::waitKey(1) == 'q') {
            break;
        }
    }

    return 0;
}

