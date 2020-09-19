FROM nvidia/cudagl:10.2-base-ubuntu18.04

# Run a full upgrade and install utilities for development.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mesa-utils \
    emacs \
    build-essential gdb \
    cmake cmake-curses-gui \
    git \
    libgtest-dev \
    ssh \
 && rm -rf /var/lib/apt/lists/*


# install px4 toolchain
RUN wget https://raw.githubusercontent.com/PX4/Firmware/master/Tools/setup/ubuntu.sh && \
    wget https://raw.githubusercontent.com/PX4/Firmware/master/Tools/setup/requirements.txt && \
    bash ubuntu.sh --no-nuttx

ENV QT_X11_NO_MITSHM 1
ENV XDG_RUNTIME_DIR /tmp/runtime-root