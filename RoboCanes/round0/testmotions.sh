#!/bin/bash

c=0;
for i
do

  c=`expr $c + 1` 
  echo Motion $c: $i
 
  rcssserver3d > /dev/null 2> /dev/null &
  sleep 1
  ./playmotion.sh $i > /dev/null &

  read -p "Press Enter to continue."
  killall -9 robocanes
  killall -9 rcssserver3d
  sleep 1

done


