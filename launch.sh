#!/bin/bash

calculate_accident_fall_point() {
  echo "0" > accident_fp.txt
}

calculate_satellite_orbit() {
  echo "0" > orbit.txt
}

calculate_flight_time() {
  let ft=999
  let einstein=3
  let ft=ft+einstein
  let something=7
  let ft=ft+something
  let something_else=9
  let ft=ft+something_else
  echo "$ft" > flight-time.txt
}

calculate_fuel() {
  echo "0" > fuel.txt
}

calculate_accident_fall_point
calculate_satellite_orbit
calculate_flight_time
calculate_fuel