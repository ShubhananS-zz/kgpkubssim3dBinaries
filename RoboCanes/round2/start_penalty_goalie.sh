#!/bin/bash
HOST=$1
binary="./robocanes"

#-----
#default values
if [ "$HOST" == "" ]; then HOST="127.0.0.1"; fi

#-----
#start agent

#./kill.sh

echo Starting penalty goalie...

$binary -c SimSparkConnection.ip=$HOST \
        -c SimSparkConnection.unum=1  \
        -c Goalie.penaltymode=1  \
        -c SimSparkConnection.teamname=RoboCanesGoalie  \
   > /dev/null 2> /dev/null &

echo done.

