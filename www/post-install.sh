#!/bin/bash

# post-install.sh - Configures a new machine after a successful PXE run. 
#
# NOTE: This script is executed with sudo permissions
#

if [ $PUBLIC_IP ]; then

  wget http://$PUBLIC_IP:8000/insecure_default_key.pub

  mkdir -p /home/ubuntu/.ssh
  cat insecure_default_key.pub >> /home/ubuntu/.ssh/authorized_keys
  rm insecure_default_key.pub

  chmod 700 /home/ubuntu/.ssh
  chmod 644 /home/ubuntu/.ssh/authorized_keys

  chown ubuntu:ubuntu /home/ubuntu/.ssh
  chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys

else
  echo "Environment variable PUBLIC_IP not configured, so cannot pull remote ssh keys."
fi

# add custom post-install steps here