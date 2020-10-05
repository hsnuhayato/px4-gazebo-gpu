FROM nvidia/cudagl:10.2-base-ubuntu18.04

# Run a full upgrade and install utilities for development.
RUN apt update && apt upgrade -y && apt install -y \
    mesa-utils \
    build-essential gdb \
    cmake cmake-curses-gui \
    git \
    libgtest-dev \
    ssh \
 && rm -rf /var/lib/apt/lists/*


# install px4 toolchain
RUN wget https://raw.githubusercontent.com/PX4/Firmware/master/Tools/setup/ubuntu.sh && \
    wget https://raw.githubusercontent.com/PX4/Firmware/master/Tools/setup/requirements.txt && \
    bash ubuntu.sh --no-nuttx && \
    pip3 install scipy && \
    pip3 install pyquaternion && \
    pip3 install mavsdk

ENV QT_X11_NO_MITSHM 1
ENV XDG_RUNTIME_DIR /tmp/runtime-root