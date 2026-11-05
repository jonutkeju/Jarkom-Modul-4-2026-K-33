cat << 'EOF' > /root/accela.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.70/30 dev eth0
ip addr add 10.80.4.1/22   dev eth1
ip link set eth0 up
ip link set eth1 up
ip route replace default via 10.80.16.69
EOF
chmod +x /root/accela.sh && /root/accela.sh
grep -q "accela.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/accela.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/accela.sh