#!/bin/sh
# To start this from CLI on Router Copy and Paste: 
# curl -fsSL "https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/01-dnsmasq-update.sh" | sh
uci set dhcp.@dnsmasq[0].confdir="/etc/dnsmasq.d"
uci set dhcp.@dnsmasq[0].serversfile='/opt/dnsmasq.servers'
uci commit dhcp
rm /opt/dnsmasq.servers
wget -O /opt/dnsmasq.servers https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/dnsmasq.servers
# add netbird api record to dnsmasq resolver
wget -O /etc/dnsmasq.d/netbird-dnsmasq.list https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/netbird-dnsmasq.list
wget -O /etc/dnsmasq.d/vpn1440tk-dnsmasq.list https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/vpn1440tk-dnsmasq.list
wget -O /etc/dnsmasq.d/magicdns-dnsmasq.list https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/magicdns-dnsmasq.list
service dnsmasq restart
service dnsmasq reload
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "DNSMasq is running?"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
service dnsmasq status
nslookup chatgpt.com
