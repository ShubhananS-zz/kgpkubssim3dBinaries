#!/bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib
#HOST=$1;
#HOST=127.0.0.1

BINARY=futk
NAME=FUT-K
HOST=${1:-127.0.0.1}
PORT=${2:-3100}
SYNCHRONIZE=0
TYPE=0

# Check simspark server port number
if [ $PORT -ne 3100 ]; then
	SYNCHRONIZE=1
fi

#killall -9 $BINARY

for i in `seq 1 11`; do
  echo "Running $i";
  case $i in
  	4)
		TYPE=0
		;;
  	5)
		TYPE=0
		;;
	6)
		TYPE=2
		;;	
	7)
		TYPE=2
		;;
	*)
		TYPE=4
		;;
	esac
	./$BINARY --team=$NAME --host=$HOST --port=$PORT --unum=$i --syn=$SYNCHRONIZE --type=$TYPE &	
	sleep 1
done

