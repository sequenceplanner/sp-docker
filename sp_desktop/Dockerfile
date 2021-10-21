FROM kristoferb/spbase_ros2:rolling

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qqy \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    ros-rolling-desktop \
    python3-pip \
 && rm -rf /var/lib/apt/lists/* \
 && pip3 install -U argcomplete \
 && echo "source /opt/ros/rolling/setup.bash" >> ~/.bashrc \
 && echo "set +e" >> ~/.bashrc 

