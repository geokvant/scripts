#!/bin/bash
sudo apt-mark showhold
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo touch /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bullseye main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bullseye main" >> /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security bullseye-security main" >> /etc/apt/sources.list
echo "deb-src http://security.debian.org/debian-security bullseye-security main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian bullseye-updates main" >> /etc/apt/sources.list
export LC_ALL=C 
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo systemctl reboot
