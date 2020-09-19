#!/bin/bash
# docker build --network=host -t hsnuhayato/px4-gazebo-gpu .

docker run  -it --name px4_container --rm  --gpus all \
       -v $(pwd):/mnt --workdir=/mnt \
       --net host \
       --privileged     \
       --env="DISPLAY"  \
       hsnuhayato/px4-gazebo-gpu  /bin/bash
