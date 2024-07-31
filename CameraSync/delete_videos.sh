#!/bin/bash
#All targets in orchestra
cd ~/TMT_BEHAVIOR/
Lines=$(cat IPs.txt)

#Loop through IP addresses
for IP in $Lines;
do
#Delete all videos on the pi
sshpass -p "" ssh -tt ${IP[0]} 'sudo killall screen && exit; exec bash -l'
done


