#!/bin/bash 
# BahiaRT 2016 binary

sleep 1.0
echo "Launch 1"
./bahiart -u 1 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 2"
./bahiart -u 2 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 3"
#./bahiart -u 3 -h $1>/dev/null 2>&1 &
./bahiart -robot naotoe.xml -u 3 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 4"
./bahiart -robot nao1.xml -u 4 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 5"
./bahiart -robot nao1.xml -u 5 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 6"
./bahiart -robot nao1.xml -u 6 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 7"
./bahiart -robot naotoe.xml -u 7 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 8"
./bahiart -robot naotoe.xml -u 8 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 9"
./bahiart -u 9 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 10"
./bahiart -u 10 -h $1>/dev/null 2>&1 &
sleep 1.0
echo "Launch 11"
./bahiart -u 11 -h $1>/dev/null 2>&1 &
