cat << 'EOF' > /root/phantoma.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.86/30 dev eth0
ip addr add 10.80.16.1/27  dev eth1
ip addr add 10.80.16.89/30 dev eth2
for i in 0 1 2; do ip link set eth$i up; done
ip route replace default via 10.80.16.85
ip route replace 10.80.15.0/26 via 10.80.16.90
EOF
chmod +x /root/phantoma.sh && /root/phantoma.sh
grep -q "phantoma.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/phantoma.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/phantoma.sh