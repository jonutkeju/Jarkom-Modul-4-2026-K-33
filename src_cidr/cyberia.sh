! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Cyberia
interface GigabitEthernet0/0
 description WAN
 ip address 192.168.122.100 255.255.255.0
 no shutdown
ip nat outside
exit
interface GigabitEthernet0/1
 description LAN Switch1 (JJ, MyuMyu)
 ip address 10.80.64.1 255.255.255.128
 no shutdown
ip nat inside
exit
interface GigabitEthernet0/2
 description P2P to Wired
 ip address 10.80.20.1 255.255.255.252
 no shutdown
ip nat inside
exit
access-list 1 permit 10.80.0.0 0.0.255.255
ip nat inside source list 1 interface GigabitEthernet0/0 overload
ip route 10.80.0.0 255.255.192.0 10.80.20.2
ip route 0.0.0.0 0.0.0.0 192.168.122.1
end
write memory
