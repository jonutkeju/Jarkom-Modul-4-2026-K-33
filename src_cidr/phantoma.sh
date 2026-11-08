! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Phantoma
interface GigabitEthernet0/0
 description up Knights
 ip address 10.80.0.162 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw12
 ip address 10.80.0.129 255.255.255.224
 no shutdown
exit
interface GigabitEthernet0/2
 description dn Shibuya
 ip address 10.80.0.65 255.255.255.252
 no shutdown
exit
ip route 10.80.0.0 255.255.255.128 10.80.0.66
ip route 0.0.0.0 0.0.0.0 10.80.0.161
end
write memory
