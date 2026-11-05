cat << 'EOF' > /root/psyche.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.34/29 dev eth0
ip addr add 10.80.0.1/22   dev eth1
ip link set eth0 up
ip link set eth1 up
ip route replace default via 10.80.16.33
EOF
chmod +x /root/psyche.sh && /root/psyche.sh
grep -q "psyche.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/psyche.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/psyche.sh