#!/bin/bash


echo " "
echo "Cloning srsLTE"
echo "=============="
echo " "
apt install git docker-compose -y
git clone https://github.com/srsran/srsRAN.git

echo " "
echo "Firing up the containers"
echo "========================"
echo " "
docker-compose up -d

echo " "
echo "Allowing container communication in IPtables"
echo "============================================="
echo " "
iptables -I FORWARD 1 -j ACCEPT
iptables-save
