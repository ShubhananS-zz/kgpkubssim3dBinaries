#!/bin/bash
# FC Portugal 3D 2008 binary

#echo "Launch simulator"
#simspark &
#sleep 3
host="localhost"
if [ $# -gt 0 ]; then
	host="${1}"  
fi


echo "Launch 1"
./fcpagent -u 1 -r 0 -h ${host} $2 >/dev/null 2>&1 &
sleep 1 
echo "Launch 2"
./fcpagent -u 2 -r 0 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 3"
./fcpagent -u 3 -r 2 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 4"
./fcpagent -u 4 -r 4 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 5"
./fcpagent -u 5 -r 4 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 6"
./fcpagent -u 6 -r 2 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 7"
./fcpagent -u 7 -r 4 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 8"
./fcpagent -u 8 -r 4 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 9"
./fcpagent -u 9 -r 4 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 10"
./fcpagent -u 10 -r 4 -h ${host} $2 >/dev/null 2>&1 &
sleep 1
echo "Launch 11"
./fcpagent -u 11 -r 4  -h ${host} $2 >/dev/null 2>&1 &
