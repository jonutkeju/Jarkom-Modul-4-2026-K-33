! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Psyche
interface GigabitEthernet0/0
 description up Sw2
 ip address 10.80.36.2 255.255.255.248
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw3
 ip address 10.80.32.1 255.255.252.0
 no shutdown
exit
ip route 0.0.0.0 0.0.0.0 10.80.36.1
end
write memory
