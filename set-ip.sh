#!/bin/bash
mv /etc/systemd/network/eth0.network /etc/systemd/network/eth0.network.bak
touch /etc/systemd/network/eth0.network
echo "What IP address to set for this host?"
read ip_address
echo "What IP gateway to set for this host?"
read gateway
echo "What IP DNS to set for this host?"
read nameserver
echo "[Match]
Name=eth0
[Network]
Address=$ip_address/24
Gateway=$gateway
DNS=$nameserver">>/etc/systemd/network/eth0.network
cat /etc/systemd/network/eth0.network
hostname -I
echo "================="
cat /etc/systemd/network/eth0.network
sleep 3s
rm set-ip.sh
