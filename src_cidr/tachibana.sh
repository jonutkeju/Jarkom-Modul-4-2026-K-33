! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Tachibana
interface GigabitEthernet0/0
 description up Wired
 ip address 10.80.10.2 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw9
 ip address 10.80.8.1 255.255.254.0
 no shutdown
exit
interface GigabitEthernet0/2
 description dn Deus
 ip address 10.80.4.129 255.255.255.252
 no shutdown
exit
ip route 10.80.0.0 255.255.248.0 10.80.4.130
ip route 10.80.0.0 255.255.192.0 10.80.10.1
ip route 10.80.64.0 255.255.255.128 10.80.10.1
end
write memory
