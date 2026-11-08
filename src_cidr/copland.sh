! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Copland
interface GigabitEthernet0/0
 description up Sw2
 ip address 10.80.36.3 255.255.255.248
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Juri
 ip address 10.80.42.1 255.255.255.192
 no shutdown
exit
interface GigabitEthernet0/2
 description LAN Sw4
 ip address 10.80.40.1 255.255.254.0
 no shutdown
exit
ip route 0.0.0.0 0.0.0.0 10.80.36.1
end
write memory
