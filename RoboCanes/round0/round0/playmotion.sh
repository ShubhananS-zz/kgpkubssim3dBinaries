#!/bin/bash

./robocanes -c controller.modules=config/modulesWithMoLeReplay.cfg \
            -c MoLeFileReader.file=$1 \
            -v #| grep "\[MoLe"


