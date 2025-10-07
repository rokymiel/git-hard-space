#!/bin/bash

calculate_fall_point() {
  let POINT=1
  let POINT=POINT*2
  let POINT=POINT+3
  let POINT=POINT*POINT
  
  echo "$POINT" > fp.txt
}

calculate_accident_fall_point() {
  echo "0" > accident_fp.txt
}

calculate_satellite_orbit() {
  echo "0" > orbit.txt
}

calculate_flight_time() {
  echo "0" > flight-time.txt
}

calculate_fuel() {
  echo "0" > fuel.txt
}

calculate_fall_point
calculate_accident_fall_point
calculate_satellite_orbit
calculate_flight_time
calculate_fuel