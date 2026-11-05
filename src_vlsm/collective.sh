cat << 'EOF' > /root/collective.sh
#!/bin/bash
ip addr add 10.80.10.2/23 dev eth0
ip link set eth0 up
ip route replace default via 10.80.10.1
EOF
chmod +x /root/collective.sh && /root/collective.sh
grep -q "collective.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/collective.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/collective.sh