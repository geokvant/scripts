!#/bin/bash
apt update
apt upgrade -y
sudo apt install libicu-dev -y
passwd
bash no-password.sh
sudo bash socks5.sh
bash jackett.sh
bash qbittorrent.sh
bash radarr.sh
