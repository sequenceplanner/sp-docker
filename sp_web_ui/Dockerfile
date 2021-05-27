FROM kristoferb/spbase_ros2:rolling

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qqy \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    ros-rolling-desktop \
    python3-pip \
 && rm -rf /var/lib/apt/lists/* \
 && pip3 install -U argcomplete \
 && echo "/opt/ros/rolling/setup.bash" >> ~/.bashrc \
 && chmod +x ~/.vnc/xstartup 

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qqy \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    nano \
    imagemagick \
    mesa-utils \
    net-tools \
    novnc \
    onboard \
    tigervnc-standalone-server \
    tigervnc-xorg-extension \
    terminator \
    x11-apps \
    xfce4 \
    wget \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir ~/.vnc \
 && echo "#!/bin/sh\nstartxfce4" > ~/.vnc/xstartup \
 && chmod +x ~/.vnc/xstartup 

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh 
#CMD /entrypoint.sh
