#!/usr/bin/env sh
# Copyright (c) 2022, NAVIFRA CO., LTD.

# THIS IS AN INSTALL SCRIPT FILE FOR NAVIFRA SIMULATION
# IT IS LIKELY YOU WANT TO RUN THIS FILE BEFORE STARTING NAVIFRA SIMULATION
# IF YOU WANT TO RUN GAZEBO SIMULATION IN DIFFERENT ENVIRONMENTS LISTED BELOW, 
# PLEASE UNDERSTAND SOME MODELS CANNOT BE OPEN AS WE DESIGNED

# OS : Ubuntu 20.04
# ROS VERSION : NOETIC
# GAZEBO VERSION : 11.XX.X

## CHECK ROS VERSION
# If noetic, install Gazebo and related packages
# If others, don't install
echo "******************************************************************************"
echo ""
echo "[Note] THIS IS THE INSTALLATION SCRIPT FOR NAVIFRA SIMULATION"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read REPLY
echo ""

echo "[Check ROS version]"
rosversion -d
name_ros_version=`rosversion -d | grep "noetic"`
echo ""
echo ""


if [ -n "$name_ros_version" ]
then  # noetic
  echo "[Install GAZEBO for ROS noetic]"
  sudo apt install ros-$name_ros_version-turtlebot3-msgs ros-$name_ros_version-gazebo-ros ros-$name_ros_version-robot-state-publisher -y
  echo ""
  echo "Finished Gazebo and related package installation!"
else  
  echo "[No ROS installed or ROS version is not noetic]"  
  echo "NO INSTALLATION AVAILABLE FOR ROS VERSION OTHER THAN NOETIC"  
  echo "PLEASE SETUP ROS FIRST BEFORE USE NAVIFRA SIMULATION"
  echo "SEE: http://www.ros.org/wiki/rosinstall"  

  exit
fi
echo ""
echo ""

## Make Workspace for simulation
# ask for a name for the new directory
# write some lines in .bashrc
# install sources and build
echo "******************************************************************************"
echo ""
echo "[Note] THIS IS TO BUILD A NEW WORKSPACE FOR NAVIFRA SIMULATION"
echo ""
echo "PRESS [ENTER] TO CONTINUE TO MAKE DIRECTORY"
echo "IF YOU WANT TO CANCEL, PRESS [CTRL] + [C]"
read REPLY
echo ""

echo "[ENTER THE NAME OF NEW DIRECTORY FOR NAVIFRA SIMULATION]"
read name_new_workspace

echo ""
echo "Simulation Setup will be done in ${name_new_workspace}"

sudo bash -c "echo \"export GAZEBO_MODEL_PATH=$HOME/$name_new_workspace/src/velodyne_simulator/velodyne_description/models\" >> $HOME/.bashrc"
sudo bash -c "echo \"source ~/${name_new_workspace}/devel/setup.bash\" >> $HOME/.bashrc"
echo ""

cd
mkdir -p $name_new_workspace/src
cd $name_new_workspace
git clone https://github.com/navifra/infra_simulation.git
mv infra_simulation/* src/
rm -rf infra_simulation/
rosdep install --from-paths src --ignore-src -r -y
catkin_make -DCMAKE_BUILLD_TYPE=Release