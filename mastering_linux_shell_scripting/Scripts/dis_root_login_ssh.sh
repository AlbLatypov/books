#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Path to the sshd_config file
SSHD_CONFIG="/etc/ssh/sshd_config"

# Backup the original sshd_config file
cp $SSHD_CONFIG "${SSHD_CONFIG}.bak"

# Check if PermitRootLogin exists in the file
if grep -q "^PermitRootLogin" $SSHD_CONFIG; then
    # PermitRootLogin exists, change its value to no
    sed -i '/^PermitRootLogin/c\PermitRootLogin no' $SSHD_CONFIG
else
    # PermitRootLogin does not exist, append it to the file
    echo "PermitRootLogin no" >> $SSHD_CONFIG
fi

# Restart the SSH service to apply changes
systemctl restart sshd

echo "Root login via SSH has been disabled."
