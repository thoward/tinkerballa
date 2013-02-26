#!/bin/sh

# generate default templates (this will be updated by dhclient hook later)
PUBLIC_IP=127.0.0.1 /var/tinkerbell/render_templates

# make a bunch of soft links
ln -sb --suffix .bak /var/tinkerbell/tinkerbell.conf /etc/dnsmasq.d/tinkerbell.conf
ln -sb --suffix .bak /var/tinkerbell/dhclient-enter /etc/dhcp/dhclient-enter-hooks.d/tinkerbell

# release/renew DHCP lease to configure
dhclient eth1
