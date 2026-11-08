! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Shibuya
interface GigabitEthernet0/0
 description up Phantoma
 ip address 10.80.0.66 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw13
 ip address 10.80.0.1 255.255.255.192
 no shutdown
exit
ip route 0.0.0.0 0.0.0.0 10.80.0.65
end
write memory
