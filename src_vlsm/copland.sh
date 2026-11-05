cat << 'EOF' > /root/copland.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
ip addr add 10.80.16.35/29  dev eth0
ip addr add 10.80.15.193/26 dev eth1
ip addr add 10.80.8.1/23    dev eth2
for i in 0 1 2; do ip link set eth$i up; done
ip route replace default via 10.80.16.33
EOF
chmod +x /root/copland.sh && /root/copland.sh
grep -q "copland.sh" /etc/network/interfaces 2>/dev/null || echo -e "\nup /bin/bash /root/copland.sh" >> /etc/network/interfaces

auto eth0
iface eth0 inet manual
	up /bin/bash /root/copland.sh