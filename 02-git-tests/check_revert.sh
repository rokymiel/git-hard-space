#!/bin/bash

git config --global --add safe.directory '*'
git checkout fix-flight-time

LOG_SIZE=`git rev-list --count HEAD`
GITHUB_LOG_SIZE=`git log | grep github-classroom | wc -l`
CURRENT=`../launch.sh && cat flight-time.txt`
ETALON_LOG_SIZE=6

let LOG_SIZE=LOG_SIZE-GITHUB_LOG_SIZE+1

if [ "$CURRENT" != "1002" ]; then
    echo "FAIL: wrong flight time $CURRENT"
    exit 1
fi

if [ "$ETALON_LOG_SIZE" != "$LOG_SIZE" ]; then
    echo "FAIL: wrong commits count $LOG_SIZE"
    exit 1
fi

echo "OK"
exit 0