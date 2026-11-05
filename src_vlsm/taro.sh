cat << 'EOF' > /root/taro.sh
#!/bin/bash
ip addr add 10.80.15.66/26 dev eth0
ip link set eth0 up
ip route replace default via 10.80.15.65
EOF
chmod +x /root/taro.sh && /root/taro.sh
grep -q "taro.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/taro.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/taro.sh