#!/bin/bash

cd /root/uptime-kuma

# Update from git
git fetch --all
git checkout 1.14.0 --force

# Install dependenies and prebuilt
npm ci --production
npm run download-dist

# Restart
pm2 restart uptime-kuma
