FROM foxy-ros-base

# rust
RUN apt-get update -qqy \
 && apt-get install -qqy \
    llvm-dev \
    libclang-dev \
    clang \
 && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
 && rm -rf /var/lib/apt/lists/* 

