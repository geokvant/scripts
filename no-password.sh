#!/bin/bash
username=$(whoami)
touch 77-nopass-init-users
echo '# User rules for ubuntu' >> 77-nopass-init-users
echo "$username ALL=(ALL) NOPASSWD:ALL" >> 77-nopass-init-users
sudo chown root 77-nopass-init-users
sudo mv 77-nopass-init-users /etc/sudoers.d/77-nopass-init-users
