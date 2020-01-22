#!/bin/bash

./setup.sh
./wait-for-it.sh sim:57832 -s -t 10

if [ "$ROLE" == "server" ]; then
  ./wait-for-it.sh client:5001 -s -t 10
  iperf -c client -t 3600 -e -i 1 -Z $IPERF_CONGESTION
else
  iperf -s -m -i 1
fi
