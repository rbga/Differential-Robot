# Autonomous Navigation and Mapping of Surroundings Using Differential Robot
Course Project for Autonomous Robotics @ Dalhousie University taught by Dr. Mae Seto

Abstract – A differential robot powered by Lego EV3, programmed in MATLAB, is used to navigate around a constructed track with different sizes of obstacles and simultaneously map the track.

Keywords – Matlab, PID, Lego EV3, Mapping, Obstacle avoidance, Controller, Algorithm, Tangent Bug, Ultrasound, Gyroscope, SLAM.

I. INTRODUCTION
The basic goal definition of this problem is to construct a fully autonomous differential drive robot that can navigate around track, avoid obstacles and map the entire track simultaneously. The primary sensor used to do all these activities is Ultrasonic sensor. The robot should start from an entry point within the track and go around the inner walls of the track avoiding obstacles on the way and simultaneously map the walls and the surroundings.

II. PID CONTROL FOR DIFFERENTIAL DRIVE
A differential drive robot consists of 2 wheels powered by motors, so there is always an error between the speeds of rotation. So even if intended straight, there tends to be a drift causing the entire robot to sway to the right or left side depending on dominant motor. To combat this problem we can use a PID algorithm to substitute the errors in the 2 motors.

lasterror = 0 
integral = 0 
KP = Proportional Constant 
KI = Integral Constant 
KD = Derivative Constant 
while(1) 
{ 
  error = desired – actual 
  integral = integral + (error*period) 
  derivative = (error – lasterror)/period 
  output = KP*error + KI*integral + KD*derivative + bias 
  lasterror = error sleep(period) 
  }
  
  An algorithm to alternatively substitute the errors in both motors is formulated and applied to the straight function for testing. Based on adjusting the values of the three different constants and the overall speeds of both the motors, various results were concluded. The proportional constant is the most important one as minor changes to the values show a greater impact in the movement of the robot.
  
  So once the values of Proportional constant is set, the integral constant is tuned. The Integral constant (Ki) is
introduced to reduce the steady state errors in the motors. It’s merely an accumulation of error signals from start. With the integral constants, if the value chosen is low, the steady state error is corrected very slowly. If chosen high, the system may become unstable and can oscillate.

The final controller is the Derivative controller. It has a derivative constant (Kd). The derivate controller will describe how the errors change over time. It is basically the rate of change of error. Higher Kd values are not recommended as if the feedback is noisy, the system tends to be unstable.

III. BASIC FUNCTIONS FOR MOVEMENT
As the robot needs to be specified the exact distance to move forth or back and the exact degree to turn left or right, each of them were given a separate function for easier execution and versatility. For forth and back, the exact distance to be travelled was divided by the circumference of the wheel. Then the result was multiplied by 360’ to get exact degree of rotations, the wheels needed to rotate to achieve the specified distance.

In a while loop the motors were specified positive or negative speeds for either straight or reverse functions. For right and left turns the calculations were a bit different. First the wheel base was found and divided with the wheel diameter, then the required angle was divided by 360’. The first result was divided by the second and was entirely multiplied by 360’ to get the exact degree of rotations, the wheels needed to rotate to achieve the specified turn angle. Depending on right or left each motor rotated in different directions to produce a torque effect on the surface of the robot that helps it turn.

IV. MAPPING USING ULTRASOUND
Mapping the surroundings and the obstacles in it is done entirely using ultrasound. The native ultrasonic sensor of Lego EV3 does the job.

So the ultrasonic sensor has 2 main components – sender and receiver. The sender sends continuous beams of ultrasound in a straight line. The ultrasound hits a solid object and returns back to the receiving end where it gets back the beams. The speed of the travelling beam is known and the time taken for the beam to be sent forth and received back is known. Using the distance, speed and time relation the distance of the object in front is calculated. LEGO EV3 has simplified this process and it continuously calculates the distance of the object in centimeters. So the ultrasonic sensor is mounted on the shaft of a servo motor is it does a sweep of 120’ continuously scanning and receiving multiple data of multiple objects in front of it. All these data are stored in a table. To find the exact distance and direction from where the object is, we have to go through trigonometric formulas. For X – Axis the distance is multiplied by the cosine value of the angle of rotation of the sensor, and for the Y – Axis the distance is multiplied by the sine of the angle of rotation of the sensor.

These distances are found and calculated and are stored in a table. Then the X and Y axis is continuously plot in real-time using the HOLD ON and the DRAWNOW functions of Matlab.

V. OBSTACLE AVOIDANCE ALGORITHM
There are a lot of effective known algorithms to combat obstacles in a robot’s path. But the tangent bug algorithm is the best and an efficient way to approach the problem of obstacles in the robot’s bath. It was an inspiration from a bug that could not fly. So according to the algorithm, first the robot knows its destination, and its orientation. It proceeds in a straight line towards the destination goal. When it encounters an obstacle, it circumvents the entire obstacle, finds the shortest distance to avoid the obstacle and resumes back on track to its destination.

To detect the obstacles, we are partially using a touch sensor and ultrasonic sensor combined together. The touch sensor is coupled to a shaft and a gear with a greater radius to collide on obstacles and press the touch sensor. When pressed the touch sensor returns true and false when not pressed.

For the ultrasound part, a separate function where it tracks for any nearby obstacles within 10 cm of range will flag a global variable ‘Object’ as true. So with these 2 sensors whenever it encounters an object, it immediately sets the flags and proceeds with the tangent bug algorithm. The orientation is known using a gyroscope.

VI. WALL SCANNING
The robot should be able to detect both end of the walls and the intermediate obstacles in between. IT should also be able to differentiate between walls and obstacles. So to differentiate, the function of object detection is called twice at different intervals of the program. If the first- called function, detects an obstacle it’s mostly regarded as an object and executes the tangent bug algorithm. But during the second call, if the touch sensor detects an object, then the ultrasonic scanner scans for end points of the objects. When this happens the robot is able to differentiate between walls and obstacles.

VII. ROBOT TRACKING
For demonstration purposes we had to track the movement of the robot in the same plot in MATLAB. This is usually easier with a GPS sensor, where the location of robot can be obtained any second and plotted on the graph. But we employed dead – reckoning methods to track the movement of the robot. For which from the start till the end of the robot movement, every time data had to be logged in as to how many centimeters it has moved and in which direction. The direction part was covered by the gyroscopic sensor which gave the degree of rotation of the robot continuously.

So with the distance being continuously updated and the orientation from gyro, we can now calculate the movement of the robot using the same calculations used for The Mapping function.

X – Axis = Distance * (Cosine in Degrees (Orientation))
Y – Axis = Distance * (Sine in Degrees (Orientation))

The X and Y axis are plotted against each other continuously in Matlab thereby displaying the exact location of the robot in the main Plot. The color and the line thickness of the line can be modified to suit the needs.

VIII. RESULT
The robot was constructed after multiple changes to construction like changing the wheel base value, adapting ultrasound to servo motor with gear, changing the position of the sensors, changing rotation and scanning angles, including other sensors. The construction part at the beginning took 2 days, but it was more of updating later on in the course.

The programming part took up most of the deadline. It took approximately 20+ days to fully finish, programming, debugging, testing and finalizing. It was entirely programmed using MATLAB. Up to 12 user defined functions were created for the program.

The robot for the most part was able to detect the obstacles and the walls and was able to circumvent the track on its own. In the condition of 2 obstacles which were less than 6cms in height went undetected by the robot as all the detection sensors were placed at a height from 6cms above the ground. So in those cases the robot was unable to detect and collided with the obstacles. For most of the part the robot was able to successfully avoid obstacles track the walls, and was able to exit at the end through the exit portal successfully.
