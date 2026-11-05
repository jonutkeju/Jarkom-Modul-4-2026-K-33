cat << 'EOF' > /root/karl.sh
#!/bin/bash
ip addr add 10.80.0.2/22 dev eth0
ip link set eth0 up
ip route replace default via 10.80.0.1
EOF
chmod +x /root/karl.sh && /root/karl.sh
grep -q "karl.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/karl.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/karl.sh