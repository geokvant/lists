#!/bin/sh
# To start this from CLI on Router Copy and Paste: 
# curl -fsSL "https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/01-dnsmasq-update.sh" | sh
uci set dhcp.@dnsmasq[0].confdir="/etc/dnsmasq.d"
uci set dhcp.@dnsmasq[0].serversfile='/opt/dnsmasq.servers'
uci commit dhcp
rm /opt/dnsmasq.servers
wget -O /opt/dnsmasq.servers https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/dnsmasq.servers
# ADD netbird api record to dnsmasq resolver
wget -O /etc/dnsmasq.d/netbird-dnsmasq.list https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/netbird-dnsmasq.list
# ADD vpn1440tk-ingress records to dnsmasq resolver
wget -O /etc/dnsmasq.d/vpn1440tk-dnsmasq.list https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/vpn1440tk-dnsmasq.list
# ADD Domains to ignore (IPv6) AAAA records to dnsmasq resolver
wget -O /etc/dnsmasq.d/no_ipv6_resolv.list https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/no_ipv6_resolv.list
# ADD MagicDNS to dnsmasq resolver
wget -O /etc/dnsmasq.d/magicdns-dnsmasq.list https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/magicdns-dnsmasq.list
# OR #
# ADD RU-GeoHide DNS to dnsmasq resolver
#wget -O /etc/dnsmasq.d/ru-geohide-dnsmasq.list https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq/ru-geohide-dnsmasq.list
# RESTART Reload service
service dnsmasq restart
service dnsmasq reload
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo "DNSMasq is running?"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
service dnsmasq status
nslookup chatgpt.com
