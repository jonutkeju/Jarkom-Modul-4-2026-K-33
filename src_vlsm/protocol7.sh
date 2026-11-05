cat << 'EOF' > /root/protocol7.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.78/30  dev eth0
ip addr add 10.80.15.129/26 dev eth1
ip addr add 10.80.16.81/30  dev eth2
for i in 0 1 2; do ip link set eth$i up; done
ip route replace default via 10.80.16.77
ip route replace 10.80.16.48/29 via 10.80.16.82
ip route replace 10.80.16.80/28 via 10.80.16.82
ip route replace 10.80.16.0/27  via 10.80.16.82
ip route replace 10.80.15.0/26  via 10.80.16.82
EOF
chmod +x /root/protocol7.sh && /root/protocol7.sh
grep -q "protocol7.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/protocol7.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/protocol7.sh