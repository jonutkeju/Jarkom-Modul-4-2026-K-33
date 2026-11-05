cat << 'EOF' > /root/shibuya.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.90/30 dev eth0
ip addr add 10.80.15.1/26  dev eth1
ip link set eth0 up
ip link set eth1 up
ip route replace default via 10.80.16.89
EOF
chmod +x /root/shibuya.sh && /root/shibuya.sh
grep -q "shibuya.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/shibuya.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/shibuya.sh