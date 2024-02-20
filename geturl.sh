#!/bin/bash
CONTAINER_NAME='stabcas'
echo "http://`hostname -i`:`docker port $CONTAINER_NAME | grep '8888/tcp -> 0.0.0.0' | grep -o ':[0-9]\+' | grep -o '[0-9]\+'`/lab?`docker exec -it $CONTAINER_NAME jupyter notebook list | grep -o 'token=[[:alnum:]]*'`"
