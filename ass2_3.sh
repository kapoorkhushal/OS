#!/bin/bash
top10process="$(ps -e -o %cpu -o %p -o comm | sort -r |
sed -n '1!p' | head -n 10)"
num1=40.0
cpu_util="$(echo "$top10process" | awk '{print $1}')"
counter=1
delProcess=" "
for i in $cpu_util; do
	if (( $(echo "$i > $num1" |bc -l) )); then
		echo "----------------------------------------------------"
		echo "Found the following process with CPU utilization $i:"
		echo "CPU% PID PName"
		echo "$(echo "$top10process" | sed -n "$counter p")"
		echo "Killing the found processes:
		$(echo "$top10process" | sed -n "$counter p" | awk '{print $3}')"
		delProcess=$(echo "$top10process" | sed -n "$counter p" | awk '{print $33
}')
		sudo killall "$delProcess"
		echo "----------------------------------------------------"
fi
let counter=counter+1
done

