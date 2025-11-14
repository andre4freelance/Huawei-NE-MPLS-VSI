# 2025-11-14 18:34:33 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/interface bridge
add name=bridge-CS
add name=bridge-FINANCE
/interface ethernet
set [ find default-name=ether1 ] comment=METRO-E disable-running-check=no
set [ find default-name=ether2 ] comment=FINANCE disable-running-check=no
set [ find default-name=ether3 ] comment=CS disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vlan
add interface=ether1 name="vlan2001 - FINANCE" vlan-id=2001
add interface=ether1 name="vlan2002 - CS" vlan-id=2002
add interface=ether1 name=vlan2005-MGMT vlan-id=2005
/interface bridge port
add bridge=bridge-FINANCE interface="vlan2001 - FINANCE"
add bridge=bridge-FINANCE interface=ether2
add bridge=bridge-CS interface=ether3
add bridge=bridge-CS interface="vlan2002 - CS"
/ip address
add address=10.100.0.1/29 interface=vlan2005-MGMT network=10.100.0.0
add address=192.168.100.1/28 interface=bridge-FINANCE network=192.168.100.0
add address=172.16.100.1/28 interface=bridge-CS network=172.16.100.0
/system identity
set name=RO-HQ-OFFICE
/tool netwatch
add disabled=no down-script="" host=10.100.0.2 http-codes="" name=SW-BC-A \
    test-script="" type=simple up-script=""
add disabled=no down-script="" host=10.100.0.3 http-codes="" name=SW-BC-B \
    test-script="" type=simple up-script=""
add disabled=no down-script="" host=172.16.100.11 http-codes="" name=PC1-CS \
    test-script="" type=simple up-script=""
add disabled=no down-script="" host=172.16.100.12 http-codes="" name=PC2-CS \
    test-script="" type=simple up-script=""
add disabled=no down-script="" host=172.16.100.13 http-codes="" name=PC3-CS \
    test-script="" type=simple up-script=""
add disabled=no down-script="" host=192.168.100.13 http-codes="" name=\
    PC3-FINANCE test-script="" type=simple up-script=""
add disabled=no down-script="" host=192.168.100.12 http-codes="" name=\
    PC2-FINANCE test-script="" type=simple up-script=""
add disabled=no down-script="" host=192.168.100.11 http-codes="" name=\
    PC1-FINANCE test-script="" type=simple up-script=""