# How to run gazebo simulation
## 1. with sensors, but no robots 
Five Velodynes are placed.
For the simulation, you can expect the following image:
[![Screenshot-from-2022-06-29-18-35-16.png](https://i.postimg.cc/rwwBbMn7/Screenshot-from-2022-06-29-18-35-16.png)](https://postimg.cc/bs4VScjR)


Terminal 1
- roscore

Terminal 2
- cd ~/test_ws/src/velodyne_simulator/velodyne_description/
- source ~/test_ws/devel/setup.bash
- export GAZEBO_MODEL_PATH=`pwd`/models
- roslaunch velodyne_description warehouse_1.launch

## 2. with sensors and robots 
Kinect camera, Velodyne HDL-32, Velodyne VLP-16, Luminar Iris, and Ouster Os0 lidar are added in the origin.

Turtlebots and a forklift are located as well.
For the simulation, you can expect the following image:
[![ouster.png](https://i.postimg.cc/44vjxmjr/ouster.png)](https://postimg.cc/yWdLfY1P)

Terminal 1
- roscore

Terminal 2
- cd ~/test_ws/src/velodyne_simulator/velodyne_description/
- source ~/test_ws/devel/setup.bash
- export GAZEBO_MODEL_PATH=`pwd`/models
- roslaunch velodyne_description warehouse_1_w_robot.launch

# Licenses

## 1. ROBOTIS for TurtleBot3 (Apache License)
AMR robots in the simulation are modified from Turtlebot Burger and Waffle
- [ROBOTIS e-Manual for TurtleBot3](http://turtlebot3.robotis.com/)
- https://www.youtube.com/watch?v=ji2kQXgCjeM&list=PLRG6WP3c31_XI3wlvHlx2Mp8BYqgqDURU&index=2



## 2. velodyne (BSD License)
Originally, velodyne sensor is given from the following source:

- https://bitbucket.org/DataspeedInc/velodyne_simulator/src/master/

and other sensors, like Kinect camera, Luminar, and Ouster lidar, are added by Ella.

Spectation of those sensors can be edited.



## 3. AWS-robomaker-small-warehouse-world (MIT License) 
no_roof_warehouse model is used for this emvironment (warehouse_1 & warehouse_1_w_robot.launch)

- https://github.com/aws-robotics/aws-robomaker-small-warehouse-world
- https://github.com/aws-robotics/aws-robomaker-small-warehouse-world/blob/ros1/README.md



## 4. Forklift model (No license)
Only base and fork of the forklift, in STL and DAE file, are utilized in the code (turtlebot3_forklift.urdf.xacro).

urdf file is made by Ella and it can be edited.

- https://github.com/youbot/youbot_forklift



## 5. Extra models (No license)

- https://github.com/osrf/gazebo_models
