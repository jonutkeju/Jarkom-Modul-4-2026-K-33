! Cisco Packet Tracer router configuration
! Interface order maps to GigabitEthernet0/0, 0/1, ...; adjust for the router model.
enable
configure terminal
hostname Navi
interface GigabitEthernet0/0
 description up Wired
 ip address 10.80.18.65 255.255.255.252
 no shutdown
exit
interface GigabitEthernet0/1
 description LAN Sw6
 ip address 10.80.16.1 255.255.255.0
 no shutdown
exit
interface GigabitEthernet0/2
 description LAN Sw7
 ip address 10.80.18.1 255.255.255.192
 no shutdown
exit
interface GigabitEthernet0/3
 description LAN Sw8
 ip address 10.80.17.1 255.255.255.0
 no shutdown
exit
ip route 10.80.0.0 255.255.192.0 10.80.18.66
ip route 10.80.64.0 255.255.255.128 10.80.18.66
end
write memory
