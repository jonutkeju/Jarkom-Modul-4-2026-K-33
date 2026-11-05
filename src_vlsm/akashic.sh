cat << 'EOF' > /root/akashic.sh
#!/bin/bash
ip addr add 10.80.16.42/29 dev eth0
ip link set eth0 up
ip route replace default via 10.80.16.41
EOF
chmod +x /root/akashic.sh && /root/akashic.sh
grep -q "akashic.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/akashic.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/akashic.sh