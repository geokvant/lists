#!/bin/sh
rm /opt/dnsmasq.servers
wget -O /opt/dnsmasq.servers https://raw.githubusercontent.com/geokvant/lists/refs/heads/main/dnsmasq.servers
service dnsmasq restart
service dnsmasq reload
