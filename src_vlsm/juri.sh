cat << 'EOF' > /root/juri.sh
#!/bin/bash
ip addr add 10.80.15.194/26 dev eth0
ip link set eth0 up
ip route replace default via 10.80.15.193
EOF
chmod +x /root/juri.sh && /root/juri.sh
grep -q "juri.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/juri.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/juri.sh