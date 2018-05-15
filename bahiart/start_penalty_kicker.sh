#!/bin/bash
# BahiaRT 2013 binary

echo "Launch 8"
./bahiart -u 11 -k -robot naotoe.xml -h $1 >/dev/null 2>&1 &
sleep 0.5
