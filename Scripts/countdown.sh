#!/bin/bash

# https://itectec.com/superuser/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal/
seconds=$(($1*60))
date1=$((`date +%s` + $seconds));
while [ "$date1" -ge `date +%s` ]; do
 echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
 sleep 0.1
done


