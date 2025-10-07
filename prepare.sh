#!/bin/bash

git branch -r | grep 'origin' | grep -v 'master$' | grep -v HEAD | cut -d/ -f2- | while read line; do git push origin :heads/$line; done;

git checkout -b calculate-accident-fall-point
git am patches/calculate-accident-fall-point.patch
git push --set-upstream origin calculate-accident-fall-point

git checkout master

git checkout -b precise-satellite-orbit
git am patches/precise-satellite-orbit.patch
git push --set-upstream origin precise-satellite-orbit

git checkout master

git checkout -b fuel-estimation
git am patches/fuel-estimation.patch
git push --set-upstream origin fuel-estimation

git checkout master

git checkout -b fall-point-calculation
git am patches/fall-point-calculation.patch
git push --set-upstream origin fall-point-calculation

git checkout master

git checkout -b flight-time-estimation
git am patches/flight-time-estimation.patch
git push --set-upstream origin flight-time-estimation

git checkout -b fix-flight-time
git am patches/fix-flight-time.patch
git push --set-upstream origin fix-flight-time