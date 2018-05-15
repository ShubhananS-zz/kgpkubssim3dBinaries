#!/bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./lib
#HOST=$1;
#HOST=127.0.0.1

if [ -e $HOST ]; then
	HOST="localhost";
fi

BINARY=futk
NAME=FUT-K
HOST=${1:-127.0.0.1}
PORT=$2
SYNCHRONIZE=1
TYPE=4
UNUM=10

# Check simspark server port number
#if [ $PORT -ne 3100 ]; then
#	SYNCHRONIZE=1
#fi

echo "Running $5"

if [ "$5" != "KeepAwayChallenge" ]; then
	./$BINARY --team=$NAME --host=$HOST --port=$PORT --unum=$UNUM --syn=$SYNCHRONIZE --type=$TYPE --mode=$5 &
	sleep 1
else
	for i in `seq 8 10`; do
		./$BINARY --team=$NAME --host=$HOST --port=$PORT --unum=$i --syn=$SYNCHRONIZE --type=$TYPE --mode=$5 &
		sleep 1
	done
fi
