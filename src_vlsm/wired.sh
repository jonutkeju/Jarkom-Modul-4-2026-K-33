cat << 'EOF' > /root/wired.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.58/30 dev eth0
ip addr add 10.80.16.61/30 dev eth1
ip addr add 10.80.16.65/30 dev eth2
ip addr add 10.80.16.33/29 dev eth3
for i in 0 1 2 3; do ip link set eth$i up; done
ip route replace default via 10.80.16.57
ip route replace 10.80.12.0/23   via 10.80.16.62
ip route replace 10.80.15.64/26  via 10.80.16.62
ip route replace 10.80.0.0/22    via 10.80.16.34
ip route replace 10.80.8.0/23    via 10.80.16.35
ip route replace 10.80.15.192/26 via 10.80.16.35
ip route replace 10.80.4.0/22    via 10.80.16.36
ip route replace 10.80.16.40/29  via 10.80.16.36
ip route replace 10.80.16.68/30  via 10.80.16.36
ip route replace 10.80.10.0/23   via 10.80.16.66
ip route replace 10.80.14.128/25 via 10.80.16.66
ip route replace 10.80.15.0/26   via 10.80.16.66
ip route replace 10.80.15.128/26 via 10.80.16.66
ip route replace 10.80.16.0/27   via 10.80.16.66
ip route replace 10.80.16.48/29  via 10.80.16.66
ip route replace 10.80.16.64/27  via 10.80.16.66
EOF
chmod +x /root/wired.sh && /root/wired.sh
grep -q "wired.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/wired.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/wired.sh