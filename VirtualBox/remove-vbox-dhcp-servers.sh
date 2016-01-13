#!/bin/bash

echo "This script will remove every DHCP servers in your Virtualbox. Are you sure ? [Yy/Nn]"
read -n 1 rmdhcp

# assuming awk and vboxmanage are both in the PATH

DHCPservers=`vboxmanage list dhcpservers | awk -F"[: ]" '/NetworkName/ {print $2}'`

if [ "$rmdhcp" == "y" ] || [ "$rmdhcp" == "Y" ]; then
    for server in $DHCPservers
        do
        vboxmanage dhcpserver remove --netname $server
    done
fi
