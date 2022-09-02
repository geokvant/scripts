#!/bin/bash
mv /etc/systemd/network/eth0.network /etc/systemd/network/eth0.network.bak
touch /etc/systemd/network/eth0.network
echo "What IP address to set for this host?"
read ip_address
echo "[Match]
Name=eth0
[Network]
Address=$ip_address/24
Gateway=192.168.11.1
DNS=192.168.11.222">>/etc/systemd/network/eth0.network
cat /etc/systemd/network/eth0.network
hostname -I
rm set-ip.sh
