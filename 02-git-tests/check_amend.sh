#!/bin/bash

git config --global --add safe.directory '*'
git checkout fuel-estimation

LOG_SIZE=`git rev-list --count HEAD`
GITHUB_LOG_SIZE=`git log | grep github-classroom | wc -l`
IS_UGLY=`ls | grep "ugly"`
CURRENT=`../launch.sh && cat fuel.txt`
LAST_AUTHOR=`git log | grep "Author: Evgeny Kalishenko <ydginster@gmail.com>" | wc -l`
ETALON_LOG_SIZE=2

let LOG_SIZE=LOG_SIZE-GITHUB_LOG_SIZE+1

if [ "$IS_UGLY" != "" ]; then
    echo "FAIL: ugly file exists"
    exit 1
fi

if [ "$CURRENT" != "123" ]; then
    echo "FAIL: wrong fuel $CURRENT"
    exit 1
fi

if [ "$ETALON_LOG_SIZE" != "$LOG_SIZE" ]; then
    echo "FAIL: wrong commits count $LOG_SIZE"
    exit 1
fi

if [ "$LAST_AUTHOR" != "1" ]; then
    echo "FAIL: author changed"
    exit 1
fi

echo "OK"
exit 0