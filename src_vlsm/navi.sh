cat << 'EOF' > /root/navi.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.62/30 dev eth0
ip addr add 10.80.12.1/24  dev eth1
ip addr add 10.80.15.65/26 dev eth2
ip addr add 10.80.13.1/24  dev eth3
for i in 0 1 2 3; do ip link set eth$i up; done
ip route replace default via 10.80.16.61
EOF
chmod +x /root/navi.sh && /root/navi.sh
grep -q "navi.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/navi.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/navi.sh