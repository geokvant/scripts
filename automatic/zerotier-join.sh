#!/bin/bash
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join 35c192ce9b8fbfcb
sudo zerotier-cli info
