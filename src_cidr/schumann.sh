! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Schumann
interface GigabitEthernet0/0
 description up Sw2
 ip address 10.80.36.4 255.255.255.248
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw5
 ip address 10.80.56.1 255.255.255.248
 no shutdown
exit
interface GigabitEthernet0/2
 description dn Accela
 ip address 10.80.52.1 255.255.255.252
 no shutdown
exit
ip route 10.80.48.0 255.255.248.0 10.80.52.2
ip route 0.0.0.0 0.0.0.0 10.80.36.1
end
write memory
