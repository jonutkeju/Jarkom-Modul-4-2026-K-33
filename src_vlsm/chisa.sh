cat << 'EOF' > /root/chisa.sh
#!/bin/bash
ip addr add 10.80.15.130/26 dev eth0
ip link set eth0 up
ip route replace default via 10.80.15.129
EOF
chmod +x /root/chisa.sh && /root/chisa.sh
grep -q "chisa.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/chisa.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/chisa.sh