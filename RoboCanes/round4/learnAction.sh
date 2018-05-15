#!/bin/bash
binary=`mktemp --tmpdir=./ robocanes.tmp.XXXXXXXX`
cp ./robocanes $binary
chmod +x $binary

# parameters for action to optimize and robot type
action=$1
robotType=$2
useSkillKick=$3
cloptPort=$4

# default values
[ "$action" == "" ] && action=0
[ "$robotType" == "" ] && robotType=1
[ "$useSkillKick" == "" ] && useSkillKick=0


# different action files to be used as seed
[ $action -eq 0 ] && actionFile=actions/kick_right.act
[ $action -eq 1 ] && actionFile=actions/stand_up_front.act
[ $action -eq 2 ] && actionFile=actions/stand_up_back.act
[ $action -eq 3 ] && actionFile=actions/kick_right_6m.act
[ $action -eq 4 ] && actionFile=actions/kick_right_6m_flat.act
[ $action -eq 5 ] && actionFile=actions/kick_right_8m.act
[ $action -eq 6 ] && actionFile=actions/kick_right_15m.act
[ $action -eq 7 ] && actionFile=actions/kick_right_7m.act
[ $action -eq 8 ] && actionFile=actions/kick_right_5m.act
resultFile=$actionFile.$robotType


# use different seeds for some actions on some robot types
[ $action -eq 1 ] && [ $robotType -eq 1 ] && actionFile=actions/stand_up_front_manual_slow.act
[ $action -eq 1 ] && [ $robotType -eq 3 ] && actionFile=actions/stand_up_front_manual_slow.act
[ $action -eq 2 ] && [ $robotType -eq 3 ] && actionFile=actions/stand_up_back_manual.act

# for kick optimization use another result file if SkillKick is not used
[ $action -eq 0 ] && [ $useSkillKick -eq 0 ] && resultFile=$actionFile.fixedPos.$robotType



#if the result file exists already, use it as seed (continue)
[ -f $resultFile ] && actionFile=$resultFile  

#if a clopt port was passed, activate clopt
useClopt=1
if [ "$cloptPort" == "" ]; then
  cloptPort=0
  useClopt=0
fi


echo "Starting ActionOpt agent (action $action, robotType $robotType, SkillKick $useSkillKick)..."
echo "seed:   $actionFile"
echo "output: $resultFile"
if [[ $(ps -o stat= -p $$) =~ .*+.* ]]; then
   read -p "Press enter to start (ctrl+c to abort) "
fi

$binary -c SimSparkConnection.ip=127.0.0.1 \
        -c SimSparkConnection.startSimspark=0 \
        -c SimSparkConnection.reconnect=1 \
        -c SimSparkConnection.robotType=$robotType \
        -c SimSparkConnection.unum=0  \
        -c controller.modules=config/modulesActionOpt.cfg \
        -c SpecialActionOpt.reps=30 \
        -c SpecialActionOpt.useSkillKick=$useSkillKick \
        -c SpecialActionOpt.seedfile=$actionFile \
        -c SpecialActionOpt.resultfile=$resultFile \
        -c SpecialActionOpt.useClopt=$useClopt \
        -c clopt.ip=127.0.0.1 \
        -c clopt.port=$cloptPort \
        #-v #| grep -E "(PSO\])|(simspark on ports)"

rm $binary

