cat << 'EOF' > /root/knights.sh
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1

# Menggunakan replace agar silent & tidak error saat di-restart
ip addr replace 10.80.16.82/30 dev eth0
ip addr replace 10.80.16.49/29 dev eth1
ip addr replace 10.80.16.85/30 dev eth2

for i in 0 1 2; do ip link set eth$i up; done

ip route replace default via 10.80.16.81
ip route replace 10.80.16.0/27  via 10.80.16.86
ip route replace 10.80.16.88/30 via 10.80.16.86
ip route replace 10.80.15.0/26  via 10.80.16.86
EOF
chmod +x /root/knights.sh && /root/knights.sh

auto eth0
iface eth0 inet manual
	up /bin/bash /root/knights.sh