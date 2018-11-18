if grep -q net.ipv6.conf.all.disable_ipv6 /etc/sysctl.conf; then
    sed -i '/net.ipv6.conf.all.disable_ipv6/c\net.ipv6.conf.all.disable_ipv6 = 1' /etc/sysctl.conf
else
    echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
fi

if grep -q net.ipv6.conf.default.disable_ipv6 /etc/sysctl.conf; then
    sed -i '/net.ipv6.conf.default.disable_ipv6/c\net.ipv6.conf.default.disable_ipv6 = 1' /etc/sysctl.conf
else
    echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.conf
fi

sysctl -p
