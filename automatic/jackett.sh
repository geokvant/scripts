#!/bin/bash
sudo groupadd jackett
sudo useradd -g jackett -G media jackett
sudo apt install libicu-dev -y
curl -L -O $( curl -s https://api.github.com/repos/Jackett/Jackett/releases | perl -pe 's/^.+?browser_download_url.+?(https.+?Jackett.Binaries.LinuxAMDx64.tar.gz).+/$1/;' )
tar -xvzf Jackett.Binaries.LinuxAMDx64.tar.gz
rm Jackett.Binaries.LinuxAMDx64.tar.gz
sudo mv Jackett /opt/
cd /opt/Jackett
./jackett
sudo chown jackett:jackett -R /opt/Jackett
sudo ./install_service_systemd.sh
sudo systemctl status jackett.service