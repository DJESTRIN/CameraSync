#!/bin/bash/
cd ~/TMT_BEHAVIOR/
Lines=$(cat IPs.txt)
for IP in $Lines;
do
sshpass -p "" ssh -t $IP 'sudo mkdir -p /home/pi/Desktop/schedule/ && exit; exec bash -;'
/usr/bin/rsync -var --rsh="/usr/bin/sshpass -p  ssh -o StrictHostKeyChecking=no -l pi" ~/Desktop/schedule/* $IP:/home/pi/Desktop/schedule/
done
