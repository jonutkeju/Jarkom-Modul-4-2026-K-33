cat << 'EOF' > /root/myumyu.sh
#!/bin/bash
ip addr add 10.80.14.3/25 dev eth0
ip link set eth0 up
ip route replace default via 10.80.14.1
EOF
chmod +x /root/myumyu.sh && /root/myumyu.sh
grep -q "myumyu.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/myumyu.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/myumyu.sh