cat << 'EOF' > /root/yasuo.sh
#!/bin/bash
ip addr add 10.80.13.2/24 dev eth0
ip link set eth0 up
ip route replace default via 10.80.13.1
EOF
chmod +x /root/yasuo.sh && /root/yasuo.sh
grep -q "yasuo.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/yasuo.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/yasuo.sh