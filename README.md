# PC Required Specifications
The current recommended and tested environment is **Ubuntu 20.04 LTS**. 

Theoretically, you can build on other distros as well, but we haven't tested it.

- OS : Ubuntu 20.04
- ROS : Noetic
- Gazebo : 11.XX.X

# Setup
Run codes from "[navifra_simulation_install.sh](https://docs.google.com/document/d/1NpHOrjgmCS0nvNMUpQ01ZhlPlHxse3I8a_IE_jTJ2vU/edit)" to....
1. Check ROS and Gazebo installation
2. Install related packages
3. Make a new directory for navifra simulation and git clone the repository
4. Editing .bashrc for convenience
5. Build 


# Worlds
## warehouse_1
[![warehouse-1.png](https://i.postimg.cc/tgvJwtVM/warehouse-1.png)](https://postimg.cc/3yp3DG1X)

## warehouse_2
[![warehouse-2.png](https://i.postimg.cc/KvQ20cT9/warehouse-2.png)](https://postimg.cc/rKd3mkQW)

## warehouse_3
[![warehouse-3.png](https://i.postimg.cc/X7sRwHMm/warehouse-3.png)](https://postimg.cc/GHsgRjmx)


# Running gazebo simulation

## 1. with sensors, but no robots 
(*** `<workspace name>` should be modified)
```
$ cd ~/<workspace name>/src/velodyne_simulator/velodyne_description/

$ source ~/<workspace name>/devel/setup.bash

$ export GAZEBO_MODEL_PATH=\`pwd\`/models

$ roslaunch velodyne_description warehouse_1.launch
```
Five Velodynes are placed in Gazebo simulation.
The following image can be expected:
[![Screenshot-from-2022-06-29-18-35-16.png](https://i.postimg.cc/rwwBbMn7/Screenshot-from-2022-06-29-18-35-16.png)](https://postimg.cc/bs4VScjR)


## 2. with sensors and robots 

```
$ cd ~/<workspace name>/src/velodyne_simulator/velodyne_description/

$ source ~/<workspace name>/devel/setup.bash

$ export GAZEBO_MODEL_PATH=`pwd`/models

$ roslaunch velodyne_description warehouse_1_w_robot.launch
```

Azure Kinect DK, Velodyne HDL-32, Velodyne VLP-16, Luminar Iris, and Ouster Os0 lidar are added in the origin.

The following image can be expected:
[![warehouse-1-w-robot.png](https://i.postimg.cc/MGf9sLRb/warehouse-1-w-robot.png)](https://postimg.cc/mcR3k8mt)

To move robots, change <robot_name> and run the code below:
```
$ rosrun teleop_twist_keyboard teleop_twist_keyboard.py cmd_vel:=<robot_name>/cmd_vel
```

# Licenses

## 1. ROBOTIS for TurtleBot3 (Apache License)
AMR robots in the simulation are modified from Turtlebot Burger and Waffle
- [ROBOTIS e-Manual for TurtleBot3](http://turtlebot3.robotis.com/)
- https://www.youtube.com/watch?v=ji2kQXgCjeM&list=PLRG6WP3c31_XI3wlvHlx2Mp8BYqgqDURU&index=2



## 2. velodyne (BSD License)
Originally, velodyne sensor is given from the following source:

- https://bitbucket.org/DataspeedInc/velodyne_simulator/src/master/



## 3. AWS-robomaker-small-warehouse-world (MIT License) 
no_roof_warehouse model is used for this emvironment (warehouse_1 & warehouse_1_w_robot.launch)

- https://github.com/aws-robotics/aws-robomaker-small-warehouse-world
- https://github.com/aws-robotics/aws-robomaker-small-warehouse-world/blob/ros1/README.md



## 4. Forklift model (No license)
Only base and fork of the forklift, in STL and DAE file, are utilized in the code (turtlebot3_forklift.urdf.xacro).

- https://github.com/youbot/youbot_forklift
