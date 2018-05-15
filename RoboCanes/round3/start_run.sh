#!/bin/bash
HOST=$1
PORT=$2
binary="./robocanes"

#-----
#default values
if [ "$HOST" == "" ]; then HOST="127.0.0.1"; fi
if [ "$PORT" == "" ]; then PORT="3100"; fi

#-----
#start agent

#./kill.sh

echo Starting run agent...

$binary -c controller.modules=./config/modulesRun.cfg \
        -c SimSparkConnection.ip=$HOST \
        -c SimSparkConnection.port=$PORT \
        -c Test.fixedRobotPose=1  \
        -c Test.fixedRobotPose_x=-10  \
        -c Test.robotPoseOdometryUpdates=0 \
        -c Test.moveTo=1 \
        -c Test.moveTo_x=10 \
        -c SkillMoveToPos.max_walk_speed=2000 \
        -c Hoap2WalkingEngine.maxStepSizeX=1540 \
        -c Hoap2WalkingEngine.STEP_DURATION=230.0 \
        -c Hoap2WalkingEngine.STEP_ORIGIN_Z=-217.0 \
        -c Hoap2WalkingEngine.STEP_HEIGHT_AIR=70 \
        -c Hoap2WalkingEngine.maxSpeedChangeX=1000 \
        -c SimSparkConnection.teamname=RoboCanesRun  \
 ;#  > /dev/null 2> /dev/null &

echo done.
# result 1.002:  1500   65  1000
