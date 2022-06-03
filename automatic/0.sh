#!/bin/bash
sudo groupadd media
sudo useradd -G sudo,media -s /bin/bash -m -p $(openssl passwd -1 password) user
echo "Dont forget to change user's password <password> when install complete!"
sleep 3s
wget https://raw.githubusercontent.com/geokvant/scripts/main/ssh-add-keys.sh
bash ssh-add-keys.sh
mkdir /home/user/.ssh
chown user.user -R /home/user/.ssh
cp /root/.ssh/authorized_keys /home/user/.ssh/authorized_keys
chown user.user -R /home/user/.ssh/authorized_keys
cd /home/user
wget https://raw.githubusercontent.com/geokvant/scripts/main/automatic/1_start_all.sh
wget https://raw.githubusercontent.com/geokvant/scripts/main/no-password.sh
wget https://raw.githubusercontent.com/geokvant/scripts/main/automatic/socks5.sh
wget https://raw.githubusercontent.com/geokvant/scripts/main/automatic/qbittorrent.sh
wget https://raw.githubusercontent.com/geokvant/scripts/main/automatic/jackett.sh
wget https://raw.githubusercontent.com/geokvant/scripts/main/automatic/radarr.sh
chown -R user.user 1_start_all.sh no-password.sh qbittorrent.sh socks5.sh radarr.sh jackett.sh
hostname -I
