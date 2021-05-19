FROM spdesktop

RUN git clone -b rolling https://github.com/sequenceplanner/dorna_example.git dorna \
 && git clone https://github.com/sequenceplanner/sp-ros.git sp

WORKDIR /sp/
RUN . /opt/ros/rolling/setup.sh \
 && colcon build

WORKDIR /dorna/
RUN . /opt/ros/rolling/setup.sh \
 && . /sp/install/setup.sh \
 && colcon build

WORKDIR / 
COPY entrypoint.sh /
CMD /entrypoint.sh
