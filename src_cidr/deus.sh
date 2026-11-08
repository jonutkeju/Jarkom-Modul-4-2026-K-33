! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Deus
interface GigabitEthernet0/0
 description up Tachi
 ip address 10.80.4.130 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw10
 ip address 10.80.4.1 255.255.255.128
 no shutdown
exit
interface GigabitEthernet0/2
 description dn P7
 ip address 10.80.2.65 255.255.255.252
 no shutdown
exit
ip route 10.80.0.0 255.255.252.0 10.80.2.66
ip route 0.0.0.0 0.0.0.0 10.80.4.129
end
write memory
