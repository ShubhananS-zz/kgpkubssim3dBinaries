#!/usr/bin/env bash

for KILLPID in `ps ax | grep agent | awk ' { print $1;}'`; do
  kill -9 $KILLPID;
done
