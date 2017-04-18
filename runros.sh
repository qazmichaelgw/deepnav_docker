#!/bin/bash
#    --cpuset-cpus 0 \ # control the cpu
#    --memory 512mb \ # max memory it can use
#    -v $HOME/Downloads:/root/Downloads \ # optional, but nice
#    -v $HOME/.config/google-chrome/:/data \ # if you want to save state
#
#
# REQUIRES xhost+
# See: http://wiki.ros.org/docker/Tutorials/GUI
#TARGET=osrf/ros:indigo-desktop-full-nvidia
#TARGET=ros:indigo-ros-base
#TARGET=qazmichaelgw/deepnav_docker
#TARGET=qazmichaelgw/deepnav_ros
TARGET=qazmichaelgw/sdc
#TARGET=gcr.io/tensorflow/tensorflow:latest-gpu
#export MYNVIDIA=$(curl -s http://localhost:3476/v1.0/docker/cli?dev=0\&vol=nvidia_driver)
#export MYNVIDIA="-e LD_LIBRARY_PATH=/usr/local/nvidia/lib64 --volume=nvidia_driver_361.42:/usr/local/nvidia:ro --device=/dev/nvidia0 --device=/dev/nvidiactl --device=/dev/nvidia-uvm"
#export MYNVIDIA="-e LD_LIBRARY_PATH=/usr/local/nvidia/lib64 --volume=nvidia_driver_361.42:/usr/local/nvidia:ro --device=/dev/nvidia0 --device=/dev/nvidiactl --device=/dev/nvidia-uvm"
#export MYNVIDIA="-e LD_LIBRARY_PATH=/usr/lib/nvidia-361 --volume=nvidia_driver_361.42:/usr/local/nvidia:ro --device=/dev/nvidia0 --device=/dev/nvidiactl --device=/dev/nvidia-uvm"
xhost + > /dev/zero
#--device /dev/nvidia0 --device /dev/nvidiactl --device /dev/bus/usb:/dev/bus/usb:rwm"
# -v /usr/bin/X11/xeyes:/usr/bin/X11/xeyes
#nvidia-docker run -it --rm --net host -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix -v /media/gaowei/Blade/linux_data/umv:/umv_data -e DISPLAY=$DISPLAY $TARGET bash
# fix the rviz bug by this new command
nvidia-docker run --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -env="QT_X11_NO_MITSHM=1" -v /dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix:ro -it --rm -p 8888:8888 -p 6006:6006 -v /media/gaowei/Blade/linux_data/umv:/umv_data $TARGET bash
#TODO fix 
#TODO add 
#source /opt/ros/indigo/setup.bash
#rocore &

