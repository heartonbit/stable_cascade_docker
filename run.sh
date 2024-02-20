#!/bin/bash
# docker run --privileged=true -it --rm --gpus all -P -d \
# -v ${PWD}:/home/work \
# -e DISABLE_JUPYTER=true \
# -w /home/work \
# --name stabcas \
# heartonbit/stable_cascade:latest \
# jupyter lab --notebook-dir=/home/work --ip 0.0.0.0 --no-browser --allow-root 

docker run --gpus all -ti --rm -P \
--ipc=host \
--ulimit memlock=-1 \
--ulimit stack=67108864 \
-v ./models:/root/.cache/huggingface \
--name stabcas \
heartonbit/stable_cascade:latest 

