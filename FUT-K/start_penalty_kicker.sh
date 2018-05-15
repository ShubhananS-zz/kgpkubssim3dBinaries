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
PORT=3100
SYNCHRONIZE=1
TYPE=4

# Check simspark server port number
#if [ $PORT -ne 3100 ]; then
#	SYNCHRONIZE=1
#fi

echo "Running"
./$BINARY --team=$NAME --host=$HOST --port=$PORT --unum=9 --syn=$SYNCHRONIZE --type=$TYPE --mode=kicker &	
sleep 1
