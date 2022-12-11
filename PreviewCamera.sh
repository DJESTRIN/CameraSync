#!/bin/bash
echo on
cd ~/TMT_BEHAVIOR/
Lines=$(cat IPs.txt)

for IP in $Lines
do
echo ${IP[0]}
sshpass -p "estrin1" ssh -tt ${IP[0]} 'screen -dm bash -c "python /media/usb/base/code/temp/preview.py" && exit; exec bash -l'
done

echo "Finished previewing cameras"
