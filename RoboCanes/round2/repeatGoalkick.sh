#!/bin/bash
HOST=$1
binary="./robocanes"

#-----
#default values
if [ "$HOST" == "" ]; then HOST="127.0.0.1"; fi

#-----
#start agent

$binary -c controller.modules=./config/modulesRepeatGoalkick.cfg \
        -c SimSparkConnection.ip=$HOST \
        -c SimSparkConnection.unum=2 \
        -c SimSparkConnection.robotType=4 \
        -c SimSparkConnection.teamname=RoboCanes 


