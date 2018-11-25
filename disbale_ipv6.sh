if grep -q net.ipv6.conf.all.disable_ipv6 /etc/sysctl.conf; then
    sudo sed -i '/net.ipv6.conf.all.disable_ipv6/c\net.ipv6.conf.all.disable_ipv6 = 1' /etc/sysctl.conf
else
    sudo sed -e "\$anet.ipv6.conf.all.disable_ipv6 = 1" /etc/sysctl.conf
fi

if grep -q net.ipv6.conf.default.disable_ipv6 /etc/sysctl.conf; then
    sudo sed -i '/net.ipv6.conf.default.disable_ipv6/c\net.ipv6.conf.default.disable_ipv6 = 1' /etc/sysctl.conf
else
    sudo sed -e "\$anet.ipv6.conf.default.disable_ipv6 = 1" /etc/sysctl.conf
fi

sudo sysctl -p
# ip addr show | grep net6
