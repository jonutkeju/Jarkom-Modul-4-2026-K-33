cat << 'EOF' > /root/specter.sh
#!/bin/bash
ip addr add 10.80.14.131/25 dev eth0
ip link set eth0 up
ip route replace default via 10.80.14.129
EOF
chmod +x /root/specter.sh && /root/specter.sh
grep -q "specter.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/specter.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/specter.sh