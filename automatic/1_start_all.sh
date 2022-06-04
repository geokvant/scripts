#!/bin/bash
bash no-password.sh
passwd
apt update
sudo apt install libicu-dev -y
apt upgrade -y
sudo bash socks5.sh
bash jackett.sh
sudo bash qbittorrent.sh
sudo bash radarr.sh
echo "Radarr port 7878"
echo "Jackett port 9117"
echo "qBittorrent port 8080"
hostname -I
