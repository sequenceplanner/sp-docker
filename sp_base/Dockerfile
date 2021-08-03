FROM ros:rolling-ros-base-focal

# FastDDS
RUN apt-get update -qqy \
 && apt-get install -qqy curl\
 && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null \
 && apt-get update -qqy \
 && apt-get install -qqy \
    ros-rolling-rmw-fastrtps-cpp \
 && rm -rf /var/lib/apt/lists/* 
ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp

# rust
RUN apt-get update -qqy \
 && apt-get install -qqy \
    llvm-dev \
    libclang-dev \
    clang \
 && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
 && rm -rf /var/lib/apt/lists/* 
ENV PATH="/root/.cargo/bin:${PATH}"

COPY entrypoint.sh super_client.xml /
RUN chmod +x /entrypoint.sh / super_client.xml

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]