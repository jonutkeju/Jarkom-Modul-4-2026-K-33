cat << 'EOF' > /root/jj.sh
#!/bin/bash
ip addr add 10.80.14.2/25 dev eth0
ip link set eth0 up
ip route replace default via 10.80.14.1
EOF
chmod +x /root/jj.sh && /root/jj.sh
grep -q "jj.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/jj.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/jj.sh