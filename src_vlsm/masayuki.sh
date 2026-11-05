cat << 'EOF' > /root/masayuki.sh
#!/bin/bash
ip addr add 10.80.8.2/23 dev eth0
ip link set eth0 up
ip route replace default via 10.80.8.1
EOF
chmod +x /root/masayuki.sh && /root/masayuki.sh
grep -q "masayuki.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/masayuki.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/masayuki.sh