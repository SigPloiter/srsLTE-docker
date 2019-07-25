#!/bin/bash


echo " "
echo "Cloning srsLTE"
echo "=============="
echo " "
git clone https://github.com/srsLTE/srsLTE.git

echo " "
echo "Firing up the containers"
echo "========================"
echo " "
sudo docker-compose up -d

echo " "
echo "Allowing container communication in IPtables"
echo "============================================="
echo " "
sudo iptables -I FORWARD 1 -j ACCEPT
sudo iptables-save
