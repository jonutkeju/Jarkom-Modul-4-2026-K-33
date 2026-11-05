cat << 'EOF' > /root/deus.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.74/30  dev eth0
ip addr add 10.80.14.129/25 dev eth1
ip addr add 10.80.16.77/30  dev eth2
for i in 0 1 2; do ip link set eth$i up; done
ip route replace default via 10.80.16.73
ip route replace 10.80.15.128/26 via 10.80.16.78
ip route replace 10.80.16.80/28  via 10.80.16.78
ip route replace 10.80.16.48/29  via 10.80.16.78
ip route replace 10.80.16.0/27   via 10.80.16.78
ip route replace 10.80.15.0/26   via 10.80.16.78
EOF
chmod +x /root/deus.sh && /root/deus.sh
grep -q "deus.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/deus.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/deus.sh