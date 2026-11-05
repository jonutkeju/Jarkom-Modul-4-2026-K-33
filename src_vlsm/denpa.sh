cat << 'EOF' > /root/denpa.sh
#!/bin/bash
ip addr add 10.80.4.3/22 dev eth0
ip link set eth0 up
ip route replace default via 10.80.4.1
EOF
chmod +x /root/denpa.sh && /root/denpa.sh
grep -q "denpa.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/denpa.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/denpa.sh