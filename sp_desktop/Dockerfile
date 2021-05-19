FROM spbase

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qqy \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    ros-rolling-desktop \
    python3-pip \
 && rm -rf /var/lib/apt/lists/* \
 && pip3 install -U argcomplete \
 && echo "/opt/ros/rolling/setup.bash" >> ~/.bashrc \

