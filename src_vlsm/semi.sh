cat << 'EOF' > /root/semi.sh
#!/bin/bash
ip addr add 10.80.16.2/27 dev eth0
ip link set eth0 up
ip route replace default via 10.80.16.1
EOF
chmod +x /root/semi.sh && /root/semi.sh
grep -q "semi.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/semi.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/semi.sh