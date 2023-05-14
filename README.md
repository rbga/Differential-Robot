# Autonomous Navigation and Mapping of Surroundings Using Differential Robot
Course Project for Autonomous Robotics @ Dalhousie University taught by Dr. Mae Seto

Abstract – 
A differential robot powered by Lego EV3, programmed in MATLAB, is used to navigate around a constructed track with different sizes of obstacles and simultaneously map the track.

Keywords – Matlab, PID, Lego EV3, Mapping, Obstacle avoidance, Controller, Algorithm, Tangent Bug, Ultrasound, Gyroscope, SLAM.

The basic goal definition of this problem is to construct a fully autonomous differential drive robot that can navigate around track, avoid obstacles and map the entire track simultaneously. The primary sensor used to do all these activities is Ultrasonic sensor. The robot should start from an entry point within the track and go around the inner walls of the track avoiding obstacles on the way and simultaneously map the walls and the surroundings.

• Devised a differential robot powered by TI Sitara AM1808 (ARM9), programmed in MATLAB to proficiently navigate around a track with varying obstacle sizes while simultaneously mapping the track.

• Formulated and executed a PID algorithm to minimize errors in two motors of a differential drive robot, using proportional, integral, and derivative constants.

• Orchestrated the integration of a diverse array of sensors, such as Ultrasonic, Gyroscope, Servo Motor, Touch, and Color sensors, to effectively localize the Robot using Extended Kalman Filter, and successfully executed path planning utilizing Dijkstra Algorithm, without the assistance of GPS.

• Applied the Tangent Bug algorithm for obstacle avoidance, integrating touch and ultrasonic sensors to effortlessly circumvent obstacles and proceed with the path to the destination.

• Employed industry-standard testing methods, including unit testing, functional testing, and integration testing, to meticulously test and debug various parts and components of the project, ensuring maximum performance and reliability.
