! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Accela
interface GigabitEthernet0/0
 description up Schu
 ip address 10.80.52.2 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw6
 ip address 10.80.48.1 255.255.252.0
 no shutdown
exit
ip route 0.0.0.0 0.0.0.0 10.80.52.1
end
write memory
