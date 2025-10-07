#!/bin/bash

calculate_accident_fall_point() {
  echo "0" > accident_fp.txt
}

simple_satellite_orbit() {
  let ORBIT=10
  let ORBIT=ORBIT*ORBIT
}

precise_satellite_orbit() {
  let ORBIT=ORBIT*ORBIT*ORBIT*ORBIT
}

calculate_satellite_orbit() {
  simple_satellite_orbit
  precise_satellite_orbit
  echo "$ORBIT" > orbit.txt
}

calculate_flight_time() {
  echo "0" > flight-time.txt
}

calculate_fuel() {
  echo "0" > fuel.txt
}

calculate_accident_fall_point
calculate_satellite_orbit
calculate_flight_time
calculate_fuel