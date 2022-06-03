#!/bin/bash
curl -L -O $( curl -s https://api.github.com/repos/Jackett/Jackett/releases | perl -pe 's/^.+?browser_download_url.+?(https.+?Jackett.Binaries.LinuxAMDx64.tar.gz).+/$1/;' )
tar -xvzf Jackett.Binaries.LinuxAMDx64.tar.gz
rm Jackett.Binaries.LinuxAMDx64.tar.gz
sudo mv Jackett /opt/
cd /opt/Jackett
./jackett
sed -i 's/"ProxyType": 0,/"ProxyType": 2,/g' /home/$USER/.config/Jackett/ServerConfig.json
sed -i 's/"ProxyUrl": null,/"ProxyUrl": "127.0.0.1",/g' /home/$USER/.config/Jackett/ServerConfig.json
sed -i 's/"ProxyPort": null,/"ProxyPort": 1080,/g' /home/$USER/.config/Jackett/ServerConfig.json
sudo ./install_service_systemd.sh
sudo systemctl status jackett.service
