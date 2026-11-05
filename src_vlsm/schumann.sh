cat << 'EOF' > /root/schumann.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.36/29 dev eth0
ip addr add 10.80.16.41/29 dev eth1
ip addr add 10.80.16.69/30 dev eth2
for i in 0 1 2; do ip link set eth$i up; done
ip route replace default via 10.80.16.33
ip route replace 10.80.4.0/22 via 10.80.16.70
EOF
chmod +x /root/schumann.sh && /root/schumann.sh
grep -q "schumann.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/schumann.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/schumann.sh