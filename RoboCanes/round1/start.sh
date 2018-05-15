#!/bin/bash
HOST=$1
NUM_PLAYERS=$2
binary="./robocanes"

#-----
#default values
if [ "$HOST" == "" ]; then HOST="127.0.0.1"; fi
if [ "$NUM_PLAYERS" == "" ]; then NUM_PLAYERS=11; fi

#-----
#start agents

#./kill.sh

robotTypes=( 0 0 0 0 0 2 2 4 4 0 0 )
echo "RoboCanes 2017 3D Simulation Team"

for ((i=1;i<=$NUM_PLAYERS;i++)); do

    robotType=${robotTypes[$i-1]}

    echo "Starting agent $i (type $robotType) ..."
    $binary -c SimSparkConnection.ip=$HOST \
            -c SimSparkConnection.unum=$i  \
            -c SimSparkConnection.robotType=$robotType \
            -c log.file=../log/stderr$i     \
            > /dev/null 2> /dev/null &

    #wait longer after starting first agent
    if [ $i -eq 1 ]; then
      sleep 1
    fi
    sleep 1
done

echo done.

