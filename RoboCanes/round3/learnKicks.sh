#!/bin/bash
binary=`mktemp --tmpdir=./ robocanes.tmp.XXXXXXXX`
cp ./robocanes $binary
chmod +x $binary

KICK=$1
robotType=$2
cloptPort=$3
[ "$KICK" == "" ] && KICK=4
[ "$robotType" == "" ] && robotType=0

useClopt=1
if [ "$cloptPort" == "" ]; then
  cloptPort=0
  useClopt=0
fi

while true
do

  echo start agent, learn kick $KICK
  $binary -c SimSparkConnection.ip=127.0.0.1 \
          -c SimSparkConnection.startSimspark=0 \
          -c SimSparkConnection.reconnect=1 \
          -c SimSparkConnection.robotType=$robotType \
          -c SimSparkConnection.unum=0 \
          -c SkillKickPSO.kickType=$KICK \
          -c SkillKickPSO.useHeight=0 \
          -c SkillKickPSO.maxDist=-1 \
          -c SkillKickPSO.useClopt=$useClopt \
          -c clopt.ip=127.0.0.1 \
          -c clopt.port=$cloptPort \
          -c controller.modules=config/modulesKickOpt.cfg \
          -v #| grep -E "(PSO\])|(simspark on ports)"
  
  # change kick type, when learning quick kicks (0 to 3)
  if [ $KICK -le 3 ]
  then
    KICK=`expr $KICK + 1`
    [ $KICK -eq 4 ] && KICK=0
  fi

  sleep 2

  if [ $useClopt -eq 1 ]; then
    rm $binary
    exit 0
  fi
done

rm $binary

