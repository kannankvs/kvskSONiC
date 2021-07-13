# SONiC 202012 Release Notes

This document captures the new features added and enhancements done on existing features/sub-features for the SONiC [202106](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-202106) release.



# Table of Contents

 * [Branch and Image Location](#branch-and-image-location)
 * [Dependency Version](#dependency-version)
 * [Security Updates](#security-updates)
 * [Feature List](#feature-list)
 * [SAI APIs](#sai-apis)
 * [Contributors](#contributors)


# Branch and Image Location  

Branch : https://github.com/Azure/sonic-buildimage/tree/202106 <br>
Image  : https://sonic-jenkins.westus2.cloudapp.azure.com/  (Example - Image for Broadcom based platforms is [here]( https://sonic-jenkins.westus2.cloudapp.azure.com/job/broadcom/job/buildimage-brcm-202106/lastSuccessfulBuild/artifact/target/))

# Dependency Version

|Feature                    | Version  |
| ------------------------- | --------------- |
| Linux kernel version      | linux_4.19.0-12-2 (4.19.152-1)   |
| SAI   version             | SAI v1.8.1    |
| FRR                       | 7.5.1   |
| LLDPD                     | 1.0.4-1    |
| TeamD                     | 1.28-1    |
| SNMPD                     | 5.7.3+dfsg-1.5    |
| Python                    | 3.6.0-1    |
| syncd                     | 1.0.0    |
| swss                      | 1.0.0    |
| radvd                     | 2.17-2~bpo9+1    |
| isc-dhcp                  |  4.4.1-2   |
| sonic-telemetry           | 0.1    |
| redis-server/ redis-tools | 5.0.3-3~bpo9+2    |


# Security Updates

1. Kernel upgraded from 4.9.110-3deb9u6 (SONiC Release 201904) to 4.9.168-1+deb9u5 for SONiC release. 
   Change log: https://tracker.debian.org/media/packages/l/linux/changelog-4.9.168-1deb9u5
2. Docker upgraded from 18.09.2\~3-0\~debian-stretch to 18.09.8\~3-0\~debian-stretch. 
   Change log: https://docs.docker.com/engine/release-notes/#18098 

# Feature List

####Telemetry for Multi-ASIC
This feature is an enhancement on sonic_db_config package for multi-asic to read different namespace redis configuration. And enhanced V2R Lookup for multi-asic, enhanced gNMI Server to initiate redis connection, enhanced gNMI Server Get and enhanced the parsing of target in gNMI Request.
<br> Refer [HLD document](https://github.com/Azure/sonic-telemetry/pull/77) and below mentioned PR's for more details. 
<br>**Pull Requests** : [77](https://github.com/Azure/sonic-telemetry/pull/77)

####Dynamic port breakout
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Dynamic policy based hashing
PBH is a feature which allows user to configure a custom hashing for different packet types.SONiC PBH for NVGRE/VxLAN packets based on inner 5-tuple (IP proto, L4 dst/src port, IPv4/IPv6 dst/src) has been taken care in this feature
<br> Refer [HLD document](https://github.com/Azure/SONiC/blob/6af2959ee5829f801409fc833389e78802d5258a/doc/pbh/pbh-design.md) and below mentioned PR's for more details. 
<br>**Pull Requests** :  [7461](https://github.com/Azure/sonic-buildimage/pull/7461), [773](https://github.com/Azure/sonic/pull/773)

####DHCP relay IPv6 support
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####App extension CLI generation tool
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####App extension with warmboot awareness
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** : 
 
####Add FRR running configuration to tech support
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Enable/Disable auto negotiation and speed setting with number of lanes
This feature introduces a few new CLI commands which will fit in sonic-utilities. And this feature also requires to change the configuration flow for port auto negotiation attributes which will be covered in orchagent.
<br> Refer [HLD document](https://github.com/Azure/SONiC/blob/9b58ef06ab49b489e3aed287659100ce7be8c76a/doc/port_auto_neg/port-auto-negotiation-design.md#cli-enhancements) and below mentioned PR's for more details. 
<br>**Pull Requests** :  [732](https://github.com/Azure/SONiC/pull/732), [6948](https://github.com/Azure/sonic-buildimage/pull/6948), [1568](https://github.com/Azure/sonic-utilities/pull/1568), [1714](https://github.com/Azure/sonic-swss/pull/1714), [3376](https://github.com/Azure/sonic-mgmt/pull/3376)

####TPID config support
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####SONiC TPID Configuration Support 
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Error handling (swss)
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####SONiC YANG model
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Testcase/Testbed Infrastructure
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####SONiC fanout support
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Inband mgmt VRF
This feature design is intended to have a generic approach for in-band management via mgmt VRF feature. A user can set an attribute "in_band_mgmt_enabled" to the config_db for MGMT_VRF_CONFIG table entry. The default value if not specified would be "false"
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####SRv6 support
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####SONiC for MPLS Dataplane
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Better route scalability with multiple next-hops
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####IPv6 Link Local and BGP Unnumbered
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####MC-LAG (L2)
This feature is an enhancements of SONiC ICCP MCLAG. This includes MCLAG configuration support, data structure changes, MAC event handling optimizations for scaling performance, support of static MAC address over MCLAG, support bridge-port isolation group for BUM control to MCLAG, and traffic recovery sequencing for traffic loop prevention.
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####RADIUS AAA
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####PDK - Platform Development Environment
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Broadcom silicon common config
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####PCIe Monitoring
This feature is intended to give the idea of how to monitor the platform PCIe devices and alert of any problems on PCIe buses and devices on SONiC using pcie-check service and pcied on PMON container.New PCIe Monitor service is designed to use the PcieUtil utility to check the current status of PCIe devices and buses and alert if there is any missing devices or any error while communicating on the PCIe buses.PCIe device monitoring will be done in two separate services, pcie-check.service which is a systemd service, will check the PCIe device during the boot time and pcied which is a daemon in PMON container will monitor during the runtime.
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Event-mgmt infra
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Klish CLI for show-tech support
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Debug dump utility
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Enhanced xcrvd SFP error flow HLD
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  

####Entity sensor MIB extension
Content
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br>**Pull Requests** :  



# SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.8.1 Release Notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.7.1_ReleaseNotes.md)


# Contributors 

SONiC community would like to thank all the contributors from various companies and the individuals who has contributed for the release. Special thanks to the major contributors - Microsoft, Broadcom, DellEMC, Nvidia, Alibaba, Linkedin, Nephos & Aviz. 

<br>



