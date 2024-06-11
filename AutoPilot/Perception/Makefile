all:
	g++ perception-udp.cpp -lrealsense2 -o perception
	g++ -std=c++11 -I/usr/include/opencv4 -L/usr/lib -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_videoio -lrealsense2 -o object_tracking object_tracking.cpp

