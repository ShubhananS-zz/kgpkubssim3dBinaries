#!/bin/bash
# BahiaRT 2013 binary

cd passingchallenge

sleep 2

./bahiart -u 2 -h $1 -p $2 >/dev/null 2>&1 &

sleep 2

./bahiart -u 3 -h $1 -p $2 >/dev/null 2>&1 &

sleep 2

./bahiart -u 4 -h $1 -p $2 >/dev/null 2>&1 &

sleep 2

./bahiart -u 5 -h $1 -p $2 >/dev/null 2>&1 &

