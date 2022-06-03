#!/bin/bash
apt update
sudo apt install -y qbittorrent-nox
sudo adduser --system --group qbittorrent-nox
sudo adduser qbittorrent-nox media
cat << EOF >> qbittorrent-nox.service
[Unit]
Description=qBittorrent Command Line Client
After=network.target

[Service]
#Do not change to "simple"
Type=forking
User=qbittorrent-nox
Group=qbittorrent-nox
UMask=007
ExecStart=/usr/bin/qbittorrent-nox -d --webui-port=8080
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
sudo mv qbittorrent-nox.service /etc/systemd/system/qbittorrent-nox.service
sudo systemctl daemon-reload
sudo systemctl enable qbittorrent-nox
sudo systemctl start qbittorrent-nox
systemctl status qbittorrent-nox
IP=$(hostname -I)
echo "Go to http://$IP :8080 (default port 8080), User: admin, Password: adminadmin"
