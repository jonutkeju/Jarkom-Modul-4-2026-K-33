cat << 'EOF' > /root/miho.sh
#!/bin/bash
ip addr add 10.80.13.3/24 dev eth0
ip link set eth0 up
ip route replace default via 10.80.13.1
EOF
chmod +x /root/miho.sh && /root/miho.sh
grep -q "miho.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/miho.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/miho.sh