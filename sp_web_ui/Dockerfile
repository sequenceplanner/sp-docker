FROM kristoferb/spdesktop_ros2:rolling

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qqy \
 && DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    nano \
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
    libgtk-3-dev \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir ~/.vnc \
 && echo "#!/bin/sh\nstartxfce4" > ~/.vnc/xstartup \
 && chmod +x ~/.vnc/xstartup 

COPY launch_novnc.bash launch_first.bash /
COPY launch.desktop /root/.config/autostart/
RUN chmod +x launch_novnc.bash launch_first.bash /root/.config/autostart/launch.desktop
RUN echo 'source /entrypoint.sh' >> ~/.bashrc 

CMD /launch_novnc.bash
