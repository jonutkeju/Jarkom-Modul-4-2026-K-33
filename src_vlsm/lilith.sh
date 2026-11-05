cat << 'EOF' > /root/lilith.sh
#!/bin/bash
ip addr add 10.80.14.130/25 dev eth0
ip link set eth0 up
ip route replace default via 10.80.14.129
EOF
chmod +x /root/lilith.sh && /root/lilith.sh
grep -q "lilith.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/lilith.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/lilith.sh