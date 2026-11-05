cat << 'EOF' > /root/cyberia.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

# Interface NAT (eth0): IP statis, jaringan NAT GNS3 = 192.168.122.0/24
ip link set eth0 up
ip addr replace 192.168.122.100/24 dev eth0
ip route replace default via 192.168.122.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Interface internal (eth1 & eth2)
ip addr replace 10.80.14.1/25 dev eth1
ip addr replace 10.80.16.57/30 dev eth2
ip link set eth1 up
ip link set eth2 up

# Rute internal dan NAT masquerade (cek dulu supaya tidak dobel)
ip route replace 10.80.0.0/19 via 10.80.16.58
iptables -t nat -C POSTROUTING -o eth0 -j MASQUERADE 2>/dev/null || \
  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
EOF
chmod +x /root/cyberia.sh && /root/cyberia.sh

auto eth0
iface eth0 inet manual
	up /bin/bash /root/cyberia.sh