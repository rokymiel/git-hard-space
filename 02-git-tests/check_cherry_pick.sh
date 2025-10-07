#!/bin/bash

git config --global --add safe.directory '*'
git checkout flight-time-estimation

LOG_SIZE=`git log | grep "commit " | wc -l`
GITHUB_LOG_SIZE=`git log | grep github-classroom | wc -l`
CURRENT=`../launch.sh && cat flight-time.txt`
LAST_AUTHOR=`git log | grep "Author: Evgeny Kalishenko <ydginster@gmail.com>" | wc -l`
ETALON=""
ETALON_LOG_SIZE=3

let LOG_SIZE=LOG_SIZE-GITHUB_LOG_SIZE+1

if [ "$CURRENT" != "1002" ]; then
    echo "FAIL: wrong flight time $CURRENT"
    exit 1
fi

if [ "$ETALON_LOG_SIZE" != "$LOG_SIZE" ]; then
    echo "FAIL: wrong commits count $LOG_SIZE"
    exit 1
fi

if [ "$LAST_AUTHOR" != "2" ]; then
    echo "FAIL: author changed"
    exit 1
fi

echo "OK"
exit 0