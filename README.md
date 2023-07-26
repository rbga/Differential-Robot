# Differential Robot Project

![Differential Robot](![image](https://github.com/rbga/Differential-Robot/assets/75168756/87f19d18-06d7-43d7-97d9-2d99456daf81))

## Introduction

The Differential Robot project is a fully autonomous robot designed to navigate around a track, avoid obstacles, and simultaneously map the surroundings. This project was developed as a course project for Autonomous Robotics at Dalhousie University, under the guidance of Dr. Mae Seto.

## Key Features

- Autonomous navigation using a differential drive mechanism.
- Obstacle avoidance using a PID algorithm and Tangent Bug algorithm.
- Simultaneous Localization and Mapping (SLAM) using Ultrasonic, Gyroscope, and Color sensors.
- Path planning with Dijkstra's algorithm.
- Integration of diverse sensors, including Ultrasonic, Gyroscope, Touch, and Color sensors.
- Utilization of Extended Kalman Filter for robot localization without GPS assistance.

## Requirements

To build and run this project, you will need the following hardware and software:

- TI Sitara AM1808 (ARM9) powered robot with differential drive mechanism.
- MATLAB for programming and control.
- Ultrasonic, Gyroscope, Touch, and Color sensors.
- Servo Motor for navigation.
- Dijkstra's algorithm for path planning.
- Extended Kalman Filter for localization.
- PID algorithm for motor control.

## Installation and Usage

1. Clone this repository to your local machine.
2. Install MATLAB and the required libraries.
3. Connect the robot hardware components as specified in the documentation.
4. Run the MATLAB script to initiate the robot.
5. The robot will autonomously navigate the track, avoiding obstacles, and mapping the surroundings.

## How It Works

The robot is powered by TI Sitara AM1808 and programmed in MATLAB. It utilizes Ultrasonic, Gyroscope, Touch, and Color sensors to detect obstacles, localize itself, and map the surroundings. The PID algorithm ensures precise control of the two motors in the differential drive mechanism, allowing the robot to move smoothly. The integration of sensors and the Tangent Bug algorithm enable the robot to avoid obstacles efficiently and navigate towards its destination.

## Contributions

- **Your Name**: Implemented PID algorithm for motor control.
- **Your Teammate's Name**: Developed the obstacle avoidance algorithm using the Tangent Bug approach.
- **Another Teammate's Name**: Integrated the diverse range of sensors and implemented SLAM using Extended Kalman Filter.

## Acknowledgments

We would like to thank Dr. Mae Seto for her guidance and support throughout the project. This project would not have been possible without her expertise and encouragement.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

If you have any questions or suggestions regarding this project, feel free to contact us at [email@example.com](mailto:email@example.com). We welcome any feedback and contributions!
