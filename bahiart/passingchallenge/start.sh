#!/bin/bash 
# BahiaRT 2016 binary

sleep 1.0
echo "Launch 2"
./bahiart -u 2 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 3"
./bahiart -u 3 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 4"
./bahiart -u 4 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 5"
./bahiart -u 5 -h $1>/dev/null 2>&1 &
sleep 1.0
