FROM ros:rolling-ros-base-focal

ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp ROS_DOMAIN_ID=0
RUN echo "net.core.rmem_max=8388608\nnet.core.rmem_default=8388608\n" | tee /etc/sysctl.d/60-cyclonedds.conf

# rust
RUN apt-get update -qqy \
 && apt-get install -qqy \
    llvm-dev \
    libclang-dev \
    clang \
 && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
 && rm -rf /var/lib/apt/lists/* 
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo install cargo-chef --locked

COPY entrypoint.sh  /
RUN chmod +x /entrypoint.sh / 

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]