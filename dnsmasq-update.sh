#!/bin/sh
# To start this from CLI on Router Copy and Paste: 
# curl -fsSL "https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq-update.sh" | sh
uci set dhcp.@dnsmasq[0].serversfile='/opt/dnsmasq.servers'
uci commit dhcp
rm /opt/dnsmasq.servers
wget -O /opt/dnsmasq.servers https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq.servers
service dnsmasq restart
service dnsmasq reload
echo "=-=-=-=-=-=-=-=-=-=-=-="
echo "DNSMasq is running?"
service dnsmasq status
nslookup chatgpt.com
