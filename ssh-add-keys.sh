#!/bin/bash
mkdir .ssh
cd .ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFsLDFhI/oxMhpAkaXATAHouhwgv7q/qZBd+ti7+QRYh geokvant@Dmitrys-Mini.local">>authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICBjFE3T4XssH9rA0B6WEtg/k7rnkbLFoURE2vFq4JJR dmitry@Air-Dmitry.local">>authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOYns5JC5Ed7Ssg3etYR/QnB2EmCixGryK0bUWGFN/lb root@ansible">>authorized_keys
apt-get install openssh-server nano gnupg wget sudo curl -y
rm /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server
sudo timedatectl set-timezone Europe/Moscow
hostname -I
sleep 2s
cd
rm ssh-add-keys.sh
