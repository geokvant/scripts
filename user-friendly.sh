#!/bin/bash
wget https://raw.githubusercontent.com/geokvant/scripts/main/ssh-add-keys.sh
wget https://raw.githubusercontent.com/geokvant/scripts/main/no-password.sh
wget https://raw.githubusercontent.com/geokvant/scripts/main/ArrInstall.sh
bash ssh-add-keys.sh
bash no-password.sh
chmod +x ArrInstall.sh
