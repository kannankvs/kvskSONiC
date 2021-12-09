# SONiC 202111 Release Notes

This document captures the new features added and enhancements done on existing features/sub-features for the SONiC [202111](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-202111) release.



# Table of Contents

 * [Branch and Image Location](#branch-and-image-location)
 * [Dependency Version](#dependency-version)
 * [Security Updates](#security-updates)
 * [Feature List](#feature-list)
 * [SAI APIs](#sai-apis)
 * [Contributors](#contributors)


# Branch and Image Location  

Branch : https://github.com/Azure/sonic-buildimage/tree/202111 <br> 
Image  : https://sonic-build.azurewebsites.net/ui/sonic/pipelines  (Example - Image for Broadcom based platforms is [here](https://sonic-build.azurewebsites.net/ui/sonic/pipelines/138/builds/51255/artifacts/98637?branchName=master&artifactName=sonic-buildimage.broadcom))

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

1. Kernel upgraded from 4.9.168-1+deb9u5 (SONiC Release 202006) to 4.19.152-1 for SONiC release.
   Change log: https://salsa.debian.org/kernel-team/linux/-/raw/buster-security/debian/changelog 

2. Plexus-utils fix: CVE-2017-1000487   


# Feature List

#### ACL orch redesign
This feature covers ACL rule counters support and enhancements in that area. The current design of ACL rule counters implements polling at orchagent side at a constant hardcoded interval of 10 seconds. While it is a simpler approach comparing to Flex Counters infrastructure it comes at a cost of scalability and performance issues.Flex counters infrastructure on another hand already used for port, PG, queue, watermark counters solves this issue by delegating counter polling to a separate thread in syncd and allowing to configure polling interval as well.

Refer [HLD document](https://github.com/Azure/SONiC/blob/master/doc/acl/ACL-Flex-Counters.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** :  [533](https://github.com/Azure/sonic-swss-common/pull/533), [953](https://github.com/Azure/sonic-sairedis/pull/953), [1943](https://github.com/Azure/sonic-swss/pull/1943), [1858](https://github.com/Azure/sonic-utilities/pull/1858), [8908](https://github.com/Azure/sonic-buildimage/pull/8908) & [8909](https://github.com/Azure/sonic-buildimage/pull/8909)
<br>
 
#### App extension CLI generation tool      
<br>  Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Automatic techsupport and core dump creation  
<br>  Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
               
#### Better route scalability with multiple next-hops     
<br>  Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Class-Based Forwarding      
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
                    
#### CLI level authorization      
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
                     
#### DHCP support IPv6            
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
              
#### Dynamic Policy Based Hashing       
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Dynamic port breakout         
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
                
#### EXP to TC QoS maps          
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
               
#### EVPN VXLAN  for platforms using P2MP tunnel based L2 forwarding  
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Handle port config change on fly in xcvrd          
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Host interface trap counter           
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### L2 functional and performance enhancements       
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### New branch creation for Debian11         
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### One line command to extract multiple DBs info of a SONiC component   
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Overlay ECMP                
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### PDK - Platform Development Environment       
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### PINS (P4 Integrated Network Stack)              
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Reclaim reserved buffer for unused ports       
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Routed sub-interface naming convention           
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### SONiC for MPLS Dataplane             
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### SRv6 support (Cntd)           
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Support for passing IS-IS, LDP and MicroBFD packets to CPU
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Upgrade  SONiC init flow               
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### VXLAN src port configuration 
<br> Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          


# SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.8.1 Release Notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.8.1%20Release%20notes.md)


# Contributors 

SONiC community would like to thank all the contributors from various companies and the individuals who has contributed for the release. Special thanks to the major contributors - Broadcom, DellEMC, Innovium, Intel, Juniper, Metaswitch, Microsoft, Nvidia.   . 

<br> 
