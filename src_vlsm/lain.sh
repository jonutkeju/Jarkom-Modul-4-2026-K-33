cat << 'EOF' > /root/lain.sh
#!/bin/bash
ip addr add 10.80.15.2/26 dev eth0
ip link set eth0 up
ip route replace default via 10.80.15.1
EOF
chmod +x /root/lain.sh && /root/lain.sh
grep -q "lain.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/lain.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/lain.sh