cat << 'EOF' > /root/omnipresence.sh
#!/bin/bash
ip addr add 10.80.4.2/22 dev eth0
ip link set eth0 up
ip route replace default via 10.80.4.1
EOF
chmod +x /root/omnipresence.sh && /root/omnipresence.sh
grep -q "omnipresence.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/omnipresence.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/omnipresence.sh