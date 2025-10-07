#!/bin/bash

git config --global --add safe.directory '*'
git checkout calculate-accident-fall-point

LOG_SIZE=`git rev-list --count HEAD`
GITHUB_LOG_SIZE=`git log | grep github-classroom | wc -l`
CURRENT=`git log | grep "Secret coordinates"`
ETALON=""
ETALON_LOG_SIZE=3

let LOG_SIZE=LOG_SIZE-GITHUB_LOG_SIZE+1

if [ "$CURRENT" != "" ]; then
    echo "FAIL: found coordinates $CURRENT"
    exit 1
fi

if [ "$ETALON_LOG_SIZE" != "$LOG_SIZE" ]; then
    echo "FAIL: commits count changed $LOG_SIZE"
    exit 1
fi

echo "OK"
exit 0