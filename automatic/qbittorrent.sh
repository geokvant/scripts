#!/bin/bash
apt update
sudo apt install -y qbittorrent-nox
qbittorrent-nox --version
touch /etc/systemd/system/qbittorrent-nox.service
cat << EOF >> /etc/systemd/system/qbittorrent-nox.service
[Unit]
Description=qBittorrent client
After=network.target
 
[Service]
ExecStart=/usr/bin/qbittorrent-nox --webui-port=8080
Restart=always
 
[Install]
WantedBy=multi-user.target
EOF
sudo service qbittorrent-nox start
sudo service qbittorrent-nox status
sudo systemctl enable qbittorrent-nox
IP=$(hostname -I)
echo "Go to http://$IP::8080 (default port 8080), User: admin, Password: adminadmin"
