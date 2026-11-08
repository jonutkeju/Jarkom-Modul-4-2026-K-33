! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Protocol7
interface GigabitEthernet0/0
 description up Deus
 ip address 10.80.2.66 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw11
 ip address 10.80.2.1 255.255.255.192
 no shutdown
exit
interface GigabitEthernet0/2
 description dn Knights
 ip address 10.80.1.9 255.255.255.252
 no shutdown
exit
ip route 10.80.0.0 255.255.254.0 10.80.1.10
ip route 0.0.0.0 0.0.0.0 10.80.2.65
end
write memory
