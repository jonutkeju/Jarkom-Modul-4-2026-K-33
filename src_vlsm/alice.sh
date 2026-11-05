cat << 'EOF' > /root/alice.sh
#!/bin/bash
ip addr add 10.80.12.2/24 dev eth0
ip link set eth0 up
ip route replace default via 10.80.12.1
EOF
chmod +x /root/alice.sh && /root/alice.sh
grep -q "alice.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/alice.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/alice.sh