cat << 'EOF' > /root/ghost.sh
#!/bin/bash
ip addr add 10.80.10.3/23 dev eth0
ip link set eth0 up
ip route replace default via 10.80.10.1
EOF
chmod +x /root/ghost.sh && /root/ghost.sh
grep -q "ghost.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/ghost.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/ghost.sh