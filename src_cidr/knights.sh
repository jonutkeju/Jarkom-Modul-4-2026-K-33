! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Knights
interface GigabitEthernet0/0
 description up P7
 ip address 10.80.1.10 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Eiri
 ip address 10.80.1.1 255.255.255.248
 no shutdown
exit
interface GigabitEthernet0/2
 description dn Phantoma
 ip address 10.80.0.161 255.255.255.252
 no shutdown
exit
ip route 10.80.0.0 255.255.255.0 10.80.0.162
ip route 0.0.0.0 0.0.0.0 10.80.1.9
end
write memory
