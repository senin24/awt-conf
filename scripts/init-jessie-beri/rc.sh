h=XX.hosts.advancedwebtesting.net
echo $h > /etc/hostname
hostname $h

echo "nameserver 77.88.8.8" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

service postfix restart || true
service squid3 restart || true
service munin-node restart || true
