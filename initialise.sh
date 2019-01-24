#!/bin/bash

#Prepare Skyminer for Node-Red Email notification flow

#Download locally scripts to check status of nodes.
curl -o status.sh https://raw.githubusercontent.com/Skyboxpro/offlinenotice/master/status.sh
curl -o allstatus.sh https://raw.githubusercontent.com/Skyboxpro/offlinenotice/master/status.sh

sudo chmod 777 status.sh
sudo chmod 777 allstatus.sh

# Create SSH key pairs on all nodes
#1 to 2, 3, 4,..n
#Create key on Primary Node
ssh-keygen -t rsa -N '' -f /home/pi/.ssh/id_rsa -C "$HOSTNAME"

#Send public key to all Secondary Nodes in IP list
iplist="/home/pi/ips.txt"
while IFS= read -r ip
do  
    ssh-copy-id $ip
done < "$iplist"

iplist="/home/pi/ips.txt"
while IFS= read -r ip
do
  scp /home/pi/status.sh $ip:/home/pi

done < "$iplist"

#Install Node-Red
bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)
