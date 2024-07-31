#!/bin/bash
#All targets in orchestra
cd ~/TMT_BEHAVIOR/
Lines=$(cat IPs.txt)
sudo rm -rf /home/pi/test_video_archive/
mkdir -p /home/pi/test_video_archive/

message="start up screen session"
echo $message
for line in $Lines;
do
echo ${line[0]}
sshpass -p "" ssh -n -tt ${line[0]} 'tag=$(date "+%Y%m%d%H%M%S") && screen -dmS $tag bash -c "echo $message; exec bash" && screen -r $tag -p 0 -X stuff "bash /home/pi/TMT_BEHAVIOR/RUN.sh\n" && exit; exec bash -l'
done

sleep 60

echo "Zipping videos"
while IFS=, read IP box; do
echo "Zipping videos for box" $box
mkdir -p ~/test_video_archive/${box}/
sshpass -p "" rsync -chavzP --stats $IP:/home/pi/NAS/test_zip.zip /home/pi/test_video_archive/$box/ || echo "Error occured for " $box
done < IPS.txt

while IFS=, read IP box; do
cd ~/test_video_archive/${box}/
unzip test_zip.zip
echo "box number" $box "has had data unzipped!"
done < IPS.txt
