#!/bin/bash
HOST=$1
binary="./robocanes"

#-----
#default values
if [ "$HOST" == "" ]; then HOST="127.0.0.1"; fi

#-----
#start agent

#./kill.sh
echo Starting striker...

$binary -c controller.modules=./config/modulesPenaltyKicker.cfg \
        -c SimSparkConnection.ip=$HOST \
        -c Striker2.penaltymode=1 \
        -c SimSparkConnection.unum=2  \
        -c SimSparkConnection.robotType=0 \
        -c SimSparkConnection.teamname=RoboCanesStriker  \
   > /dev/null 2> /dev/null &

echo done.

