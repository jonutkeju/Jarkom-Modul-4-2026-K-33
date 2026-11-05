cat << 'EOF' > /root/reika.sh
#!/bin/bash
ip addr add 10.80.12.3/24 dev eth0
ip link set eth0 up
ip route replace default via 10.80.12.1
EOF
chmod +x /root/reika.sh && /root/reika.sh
grep -q "reika.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/reika.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/reika.sh