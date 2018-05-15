#!/bin/bash
HOST=$1
NUM_PLAYERS=$2
binary="./robocanes"

#-----
#default values
if [ "$HOST" == "" ]; then HOST="127.0.0.1"; fi
if [ "$NUM_PLAYERS" == "" ]; then NUM_PLAYERS=9; fi

#-----
#start agents

#./kill.sh

for ((i=1;i<=$NUM_PLAYERS;i++)); do

    echo Starting agent $i...
    $binary -c controller.modules=config/modules_test.cfg  \
            -c SimSparkConnection.ip=$HOST \
            -c SimSparkConnection.unum=$i  \
            -c log.file=crash.log          \
       > /dev/null 2> /dev/null &

    #wait longer after starting first agent
    if [ $i -eq 0 ]; then
      sleep 1
    fi
    sleep 1
done

echo done.
