#!/bin/sh

# generate default templates (this will be updated by dhclient hook later)
PUBLIC_IP=127.0.0.1 /var/tinkerballa/render_templates

# make a bunch of soft links
ln -sb --suffix .bak /var/tinkerballa/tinkerballa.conf /etc/dnsmasq.d/tinkerballa.conf
ln -sb --suffix .bak /var/tinkerballa/dhclient-enter /etc/dhcp/dhclient-enter-hooks.d/tinkerballa

# release/renew DHCP lease to configure
dhclient eth1
