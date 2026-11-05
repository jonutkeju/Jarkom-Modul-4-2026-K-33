cat << 'EOF' > /root/hodgeson.sh
#!/bin/bash
ip addr add 10.80.15.131/26 dev eth0
ip link set eth0 up
ip route replace default via 10.80.15.129
EOF
chmod +x /root/hodgeson.sh && /root/hodgeson.sh
grep -q "hodgeson.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/hodgeson.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/hodgeson.sh