#!/bin/bash
mv /etc/systemd/network/eth0.network /etc/systemd/network/eth0.network.bak
touch /etc/systemd/network/eth0.network
echo "[Match]
Name=eth0
Network]
Address=192.168.1.217/24
Gateway=192.168.1.1
DNS=192.168.1.222">>/etc/systemd/network/eth0.network
