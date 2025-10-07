#!/bin/bash

git config --global --add safe.directory '*'
git checkout fall-point-calculation

LOG_SIZE=`git rev-list --count HEAD`
GITHUB_LOG_SIZE=`git log | grep github-classroom | wc -l`
CURRENT=`../launch.sh && cat fp.txt`
ETALON_LOG_SIZE=3

let LOG_SIZE=LOG_SIZE-GITHUB_LOG_SIZE+1

if [ "$CURRENT" != "25" ]; then
    echo "FAIL: wrong fall point $CURRENT"
    exit 1
fi

if [ "$ETALON_LOG_SIZE" != "$LOG_SIZE" ]; then
    echo "FAIL: wrong commits count $LOG_SIZE"
    exit 1
fi

echo "OK"
exit 0