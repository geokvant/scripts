#!/bin/bash
username=$(whoami)
touch /etc/sudoeds.d/77-nopass-init-users
echo '# User rules for ubuntu' >> 77-nopass-init-users
echo '$username ALL=(ALL) NOPASSWD:ALL' >> 77-nopass-init-users
