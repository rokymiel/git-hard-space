#!/bin/bash

git config --global --add safe.directory '*'

FT=`../launch.sh && cat flight-time.txt`
AFP=`cat accident_fp.txt`
FUEL=`cat fuel.txt`
ORBIT=`cat orbit.txt`

if [ "$FT" != "1002" ]; then
    echo "FAIL: wrong flight time $FT"
    exit 1
fi

if [ "$AFP" != "2" ]; then
    echo "FAIL: wrong fall point $AFP"
    exit 1
fi

if [ "$FUEL" != "123" ]; then
    echo "FAIL: wrong fuel $FUEL"
    exit 1
fi

if [ "$ORBIT" != "101" ]; then
    echo "FAIL: wrong orbit $ORBIT"
    exit 1
fi


echo "OK"
exit 0