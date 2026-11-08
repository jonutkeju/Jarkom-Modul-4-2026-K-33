! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Wired
interface GigabitEthernet0/0
 description up Cyb
 ip address 10.80.20.2 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description dn Navi
 ip address 10.80.18.66 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/2
 description dn Tachi
 ip address 10.80.10.1 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/3
 description LAN Sw2
 ip address 10.80.36.1 255.255.255.248
 no shutdown
exit
ip route 10.80.32.0 255.255.252.0 10.80.36.2
ip route 10.80.40.0 255.255.254.0 10.80.36.3
ip route 10.80.42.0 255.255.255.192 10.80.36.3
ip route 10.80.48.0 255.255.240.0 10.80.36.4
ip route 10.80.0.0 255.255.240.0 10.80.10.2
ip route 10.80.16.0 255.255.252.0 10.80.18.65
ip route 10.80.64.0 255.255.255.128 10.80.20.1
end
write memory
