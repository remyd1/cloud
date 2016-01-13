#!/bin/bash

echo "This script will remove every DHCP servers in your Virtualbox. Are you sure ? [Yy/Nn]"

# assuming awk and vboxmanage are both in the PATH

DHCPservers=`vboxmanage list dhcpservers | awk -F"[: ]" '/NetworkName/ {print $2}'`


for server in $DHCPservers
    do
    vboxmanage dhcpserver remove --netname $server
done
