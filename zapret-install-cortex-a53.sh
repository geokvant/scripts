mkdir /root/zapret
cd /root/zapret
wget -O zapret.zip https://github.com/remittor/zapret-openwrt/releases/download/v72.20260307/zapret_v72.20260307_aarch64_cortex-a53.zip
# add extractor
apk update
apk add unzip
unzip zapret.zip
# install packs
cd /root/zapret/apk
apk add --allow-untrusted /root/zapret/apk/zapret-72.20260307-r1.apk
apk add --allow-untrusted /root/zapret/apk/luci-app-zapret-72.20260307-r1.apk
# remove apks
rm -r /root/zapret/
