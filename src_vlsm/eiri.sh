cat << 'EOF' > /root/eiri.sh
#!/bin/bash
# Menggunakan replace agar silent & tidak error saat di-restart
ip addr replace 10.80.16.50/29 dev eth0
ip link set eth0 up
ip route replace default via 10.80.16.49
EOF
chmod +x /root/eiri.sh && /root/eiri.sh

auto eth0
iface eth0 inet manual
	up /bin/bash /root/eiri.sh