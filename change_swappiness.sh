cat /proc/sys/vm/swappiness
cat /proc/sys/vm/vfs_cache_pressure

sudo echo 1 > /proc/sys/vm/swappiness
sudo echo 200 > /proc/sys/vm/vfs_cache_pressure
sudo echo 5242880 > /proc/sys/vm/min_free_kbytes

sudo sysctl -w vm.swappiness=1
sudo sysctl -w vm.vfs_cache_pressure=200
sudo sysctl -w vm.min_free_kbytes=5242880

sudo sysctl -p /etc/sysctl.d/*

cat /etc/sysctl.conf

if grep -q vm.swappiness /etc/sysctl.conf; then
    sed -i '/vm.swappiness=/c\vm.swappiness=1' /etc/sysctl.conf
else
    echo 'vm.swappiness=1' >> /etc/sysctl.conf
fi

if grep -q vm.vfs_cache_pressure /etc/sysctl.conf; then
    sed -i '/vm.vfs_cache_pressure=/c\vm.vfs_cache_pressure=200' /etc/sysctl.conf
else
    echo 'vm.vfs_cache_pressure=200' >> /etc/sysctl.conf
fi

if grep -q vm.min_free_kbytes /etc/sysctl.conf; then
    sed -i '/vm.min_free_kbytes=/c\vm.min_free_kbytes=5242880' /etc/sysctl.conf
else
    echo 'vm.min_free_kbytes=5242880' >> /etc/sysctl.conf
fi
