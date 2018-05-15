#!/usr/bin/env bash
#> /dev/null 2>&1 &

SERVER_IP=$1
SERVER_PORT=3100
TEAM_NAME="ITAndroids"

    cd binaries
for AGENT_NUM in $(seq 1 11);
do
    ./agent --server-ip $SERVER_IP --server-port $SERVER_PORT --team-name $TEAM_NAME --agent-number $AGENT_NUM  &
    sleep 2;
done
