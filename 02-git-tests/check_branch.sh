#!/bin/bash

git config --global --add safe.directory '*'
git checkout simple-satellite-orbit

LOG_SIZE=`git log | grep "commit " | wc -l`
GITHUB_LOG_SIZE=`git log | grep github-classroom | wc -l`
CURRENT=`../launch.sh && cat orbit.txt`
ETALON=""
ETALON_LOG_SIZE=3

let LOG_SIZE=LOG_SIZE-GITHUB_LOG_SIZE+1

if [ "$CURRENT" != "101" ]; then
    echo "FAIL: wrong orbit $CURRENT"
    exit 1
fi

if [ "$ETALON_LOG_SIZE" != "$LOG_SIZE" ]; then
    echo "FAIL: wrong commits count $LOG_SIZE"
    exit 1
fi

echo "OK"
exit 0