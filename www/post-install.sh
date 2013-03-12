#!/bin/bash

# post-install.sh - Configures a new machine after a successful PXE run. 
#
# NOTE: This script is executed with sudo permissions
#

touch /root/post-install.started

if [ $1 ]; then

  wget -O /root/insecure_default_key.pub http://$1:8000/insecure_default_key.pub

  mkdir -p /home/ubuntu/.ssh
  cat /root/insecure_default_key.pub >> /home/ubuntu/.ssh/authorized_keys
  rm /root/insecure_default_key.pub

  chmod 700 /home/ubuntu/.ssh
  chmod 644 /home/ubuntu/.ssh/authorized_keys

  chown ubuntu:ubuntu /home/ubuntu/.ssh
  chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys

else
  echo "IP of PXE host not passed as an argument, so cannot pull remote ssh keys."
fi

touch /root/post-install.completed

# add custom post-install steps here
