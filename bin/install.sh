#!/bin/sh

# generate default templates (this will be updated by dhclient hook later)
PUBLIC_IP=127.0.0.1 /var/tinkerballa/bin/render_templates

if [ ! -f /var/tinkerballa/www/insecure_default_key ]; then
  ssh-keygen -b 2048 -t rsa -f /var/tinkerballa/www/insecure_default_key -P "" -C "tinkerballa"
fi

# make a bunch of soft links
ln -sb --suffix .bak /var/tinkerballa/bin/tinkerballa.conf /etc/dnsmasq.d/tinkerballa.conf
ln -sb --suffix .bak /var/tinkerballa/bin/dhclient-enter /etc/dhcp/dhclient-enter-hooks.d/tinkerballa

# this is annoying, apparently upstart jobs can't be links. >sigh<
cp -f /var/tinkerballa/bin/tinkerballa-http.conf /etc/init/tinkerballa-http.conf

# reload upstart config
initctl reload-configuration

# release/renew DHCP lease to configure
dhclient eth1
