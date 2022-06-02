#!/bin/bash
sudo apt update
sudo apt install shadowsocks-libev -y
sudo systemctl status shadowsocks-libev
sudo systemctl stop shadowsocks-libev
sudo systemctl disable shadowsocks-libev
sudo systemctl status shadowsocks-libev
touch /etc/shadowsocks-libev/vpnbook.json
cat << EOF >> /etc/shadowsocks-libev/vpnbook.json
{
    "server":"ca231.vpnbook.com",
    "server_port":80,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"6smnvua",
    "timeout":300,
    "method":"chacha20-ietf-poly1305",
    "fast_open": false,
    "workers": 1,
    "prefer_ipv6": false
}
EOF
rm /usr/lib/systemd/system/shadowsocks-libev-local@.service
cat << EOF >> /usr/lib/systemd/system/shadowsocks-libev-local@.service
[Unit]
Description=Shadowsocks-Libev Custom Client Service for VPNBOOK
Documentation=man:ss-local(1)
After=network-online.target

[Service]
Type=simple
#CapabilityBoundingSet=CAP_NET_BIND_SERVICE
#AmbientCapabilities=CAP_NET_BIND_SERVICE
DynamicUser=true
ExecStart=/usr/bin/ss-local -c /etc/shadowsocks-libev/vpnbook.json
Restart=on-failure
RestartSec=30

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl enable shadowsocks-libev-local@vpnbook.service
sudo systemctl start shadowsocks-libev-local@vpnbook.service
sudo systemctl status shadowsocks-libev-local@vpnbook.service
curl --socks5 127.0.0.1 eth0.me
