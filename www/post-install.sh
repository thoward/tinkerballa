#!/bin/bash

# post-install.sh - Configures a new machine after a successful PXE run. 
#
# NOTE: This script is executed with sudo permissions

mkdir /home/ubuntu/.ssh 
wget http://{{PUBLIC_IP}}:8000/insecure_default_key.pub

cat insecure_default_key.pub >> /home/ubuntu/.ssh/authorized_keys
rm insecure_default_key.pub

chmod 700 /home/ubuntu/.ssh
chmod 644 /home/ubuntu/.ssh/authorized_keys

chown ubuntu:ubuntu /home/ubuntu/.ssh
chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
