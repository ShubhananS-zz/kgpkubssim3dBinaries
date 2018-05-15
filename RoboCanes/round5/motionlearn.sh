#!/bin/bash

motionfile=$1
runs=$2
minutes=$3
opt=$4
func=$5

#default values
if [ "$runs" == "" ]; then
  runs=1
fi
if [ "$minutes" == "" ]; then
  minutes=-1
fi
if [ "$opt" == "" ]; then
  opt="cma"
fi
if [ "$func" == "" ]; then
  func="sigm"
fi

for ((i=0;i<$runs;i++))
do

./robocanes -c controller.modules=config/modulesWithMoLe.cfg \
            -c MoLeFileReader.file=$motionfile \
            -c MoLeControl.timeLimitMinutes=$minutes \
            -c MoLeFuncOpt.optType=$opt \
            -c MoLeFuncOpt.functionType=$func \
            -v | grep "\[MoLe"

  if [ "$runs" -ge "2" ]; then
      rm $motionfile*cma*resume* $motionfile*pso*resume*
  fi

done

