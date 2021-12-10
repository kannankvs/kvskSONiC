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
The SONiC CLI Auto-generation tool - is a utility for generating the command-line interface for third-party features, called application extensions, that provide their functionality as separate docker containers. The YANG model will be used to describe the CONFIG DB schema and CLI will be generated according to CONFIG DB schema. The YANG model will serve as an input parameter for the SONiC Auto-generation utility. The CLI should be a part of SONiC utilities and support - show, config operations.
     
Refer [HLD document](https://github.com/Azure/SONiC/blob/master/doc/sonic-application-extention/sonic-application-extention-hld.md) and below mentioned PR's for more details. 
<br> **Pull Requests** : [780](https://github.com/Azure/SONiC/pull/780), [1644](https://github.com/Azure/sonic-utilities/pull/1644) & [1650](https://github.com/Azure/sonic-utilities/pull/1650)
          
#### Automatic techsupport and core dump creation 
Currently, techsupport is run by invoking show techsupport either by orchestration tools like Jenkins or manually. The techsupport dump also collects any core dump files available in the /var/core/ directory. However if the techsupport invocation can be made event-driven based on core dump generation, that would definitely improve the debuggability. 
 
Refer [HLD document](https://github.com/Azure/SONiC/blob/61a07b416d0ecab85833337944928dca5d64150e/doc/auto_techsupport_and_coredump_mgmt.md) and below mentioned PR's for more details. 
<br> **Pull Requests** : [818](https://github.com/Azure/SONiC/pull/818), [8670](https://github.com/Azure/sonic-buildimage/pull/8670) & [1796](https://github.com/Azure/sonic-utilities/pull/1796)
               
#### Better route scalability with multiple next-hops 
Currently the route table within APP_DB contains all next hop information for a route embedded in that route's entry in the table. At high scale (particularly when handling millions of routes all routed over multiple next hops) this is inefficient both in terms of performance and occupancy. A more efficient system would involve managing the next hop groups in use by the route table separately, and simply have the route table specify a reference to which next hop group to use. Since at scale many routes will use the same next hop groups, this requires much smaller occupancy per route, and so more efficient building, transmission and parsing of per-route information.
    
Refer [HLD document](https://github.com/Azure/SONiC/blob/master/doc/ip/next_hop_group_hld.md) and below mentioned PR's for more details. 
<br> **Pull Requests** : [712](https://github.com/Azure/SONiC/pull/712), [475](https://github.com/Azure/sonic-swss-common/pull/475) & [1702](https://github.com/Azure/sonic-swss/pull/1702)
          
#### Class-Based Forwarding      
Class Based Forwarding which allows traffic to be steered through the network by policy, adding a layer of traffic engineering based on a Forwarding Class value which allows custom paths to be configured for a destination based on this value.

Refer [HLD document](https://github.com/Azure/SONiC/blob/e65d05a32761ea1c50c170008b22410879dce300/doc/cbf/cbf_hld.md) and below mentioned PR's for more details. 
<br> **Pull Requests** : [796](https://github.com/Azure/SONiC/pull/796), [525](https://github.com/Azure/sonic-swss-common/pull/525), [909](https://github.com/Azure/sonic-sairedis/pull/909), [1963](https://github.com/Azure/sonic-swss/pull/1963), [8689](https://github.com/Azure/sonic-buildimage/pull/8689) & [1799](https://github.com/Azure/sonic-utilities/pull/1799)
                    
#### CLI level authorization      
This feature is based on TACACS+ Authentication, and provides a detailed description for improved TACACS+ support.

SONiC currently supported TACACS+ features:

***Authentication:***

	* 	User session authorization.
	*	User session accounting.
	*	User command authorization with local permission.

***New features:***

	*	User command authorization with TACACS+ server.
	*	User command accounting with TACACS+ server.

Refer [HLD document](https://github.com/Azure/SONiC/blob/4d1660cc88002aff64e6228b63b5f2d6b59d6031/doc/aaa/TACACS%2B%20Design.md) and below mentioned PR's for more details. 
<br> **Pull Requests** : [813](https://github.com/Azure/SONiC/pull/813), [8660](https://github.com/Azure/sonic-buildimage/pull/8660), [8659](https://github.com/Azure/sonic-buildimage/pull/8659), [8715](https://github.com/Azure/sonic-buildimage/pull/8715), [9029](https://github.com/Azure/sonic-buildimage/pull/9029), [1889](https://github.com/Azure/sonic-utilities/pull/1889), [4605](https://github.com/Azure/sonic-mgmt/pull/4605) & [8750](https://github.com/Azure/sonic-buildimage/pull/8750)
                     
#### DHCP support IPv6     
SONiC currently supports DHCPv4 Relay via the use of open source ISC DHCP package. However, DHCPv6 specification does not define a way to communicate client link-layer address to the DHCP server where DHCP server is not connected to the same network link as DHCP client. DHCPv6 requires all clients prepare and send a DUID as the client identifier in all DHCPv6 message exchanges. 
       
Refer [HLD document](https://github.com/Azure/SONiC/blob/92acec6cc29165382e0b40d1ff528a6f409de572/doc/DHCPv6_relay/DHCPv6-relay-agent-High-Level-Design.md) and below mentioned PR's for more details. 
<br> **Pull Requests** : [787](https://github.com/Azure/SONiC/pull/787)
              
#### Dynamic Policy Based Hashing       
This feature will support policy based hashing for NVGRE/VxLAN packets based on inner 5-tuple (IP proto, L4 dst/src port, IPv4/IPv6 dst/src)

Refer [HLD document](https://github.com/Azure/SONiC/blob/91eee7f952b4ad4679ada1b5b5f3b95ad39e2431/doc/pbh/pbh-design.md) and below mentioned PR's for more details. 
<br> **Pull Requests** : [773](https://github.com/Azure/SONiC/pull/773), [7461](https://github.com/Azure/sonic-buildimage/pull/7461), [495](https://github.com/Azure/sonic-swss-common/pull/495), [1782](https://github.com/Azure/sonic-swss/pull/1782) & [1701](https://github.com/Azure/sonic-utilities/pull/1701)
          
#### Dynamic port breakout         
This feature is to support port breakout dynamically. We should be able to change port breakout mode at run time without affecting the unrelated port activities. Configuration dependencies on the ports to be changed with breakout mode should be reported or removed automatically. Run time dependencies and resources should be cleared on the ports to be changed with breakout mode. Optionally, we provide a way to automatically add the configuration back to the port if operators can specify in advance.

Refer [HLD document](https://github.com/Azure/SONiC/blob/master/doc/dynamic-port-breakout/sonic-dynamic-port-breakout-HLD.md) and below mentioned PR's for more details. 
<br> **Pull Requests** : [4235](https://github.com/Azure/sonic-buildimage/pull/4235), [3910](https://github.com/Azure/sonic-buildimage/pull/3910), [1242](https://github.com/Azure/sonic-swss/pull/1242), [1219](https://github.com/Azure/sonic-swss/pull/1219), [1148](https://github.com/Azure/sonic-swss/pull/1148), [1112](https://github.com/Azure/sonic-swss/pull/1112), [766](https://github.com/Azure/sonic-utilities/pull/766), [72](https://github.com/Azure/sonic-platform-common/pull/72), [859](https://github.com/Azure/sonic-utilities/pull/859), [767](https://github.com/Azure/sonic-utilities/pull/767), [765](https://github.com/Azure/sonic-utilities/pull/765), [3912](https://github.com/Azure/sonic-buildimage/pull/3912), [3911](https://github.com/Azure/sonic-buildimage/pull/3911), [3909](https://github.com/Azure/sonic-buildimage/pull/3909), [3861](https://github.com/Azure/sonic-buildimage/pull/3861), [3730](https://github.com/Azure/sonic-buildimage/pull/3730), [3907](https://github.com/Azure/sonic-buildimage/pull/3907), [3891](https://github.com/Azure/sonic-buildimage/pull/3891), [3874](https://github.com/Azure/sonic-buildimage/pull/3874), [1085](https://github.com/Azure/sonic-swss/pull/1085), [1151](https://github.com/Azure/sonic-swss/pull/1151) & [1150](https://github.com/Azure/sonic-swss/pull/1150)
                
#### EXP to TC QoS maps          
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
               
#### EVPN VXLAN  for platforms using P2MP tunnel based L2 forwarding  
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Handle port config change on fly in xcvrd          
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Host interface trap counter           
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### L2 functional and performance enhancements       
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### New branch creation for Debian11         
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### One line command to extract multiple DBs info of a SONiC component   
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Overlay ECMP                
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### PDK - Platform Development Environment       
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### PINS (P4 Integrated Network Stack)              
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Reclaim reserved buffer for unused ports       
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Routed sub-interface naming convention           
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### SONiC for MPLS Dataplane             
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### SRv6 support (Cntd)           
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Support for passing IS-IS, LDP and MicroBFD packets to CPU
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### Upgrade  SONiC init flow               
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          
#### VXLAN src port configuration 
Refer [HLD document]() and below mentioned PR's for more details. 
<br> **Pull Requests** :
          


# SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.8.1 Release Notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.8.1%20Release%20notes.md)


# Contributors 

SONiC community would like to thank all the contributors from various companies and the individuals who has contributed for the release. Special thanks to the major contributors - Broadcom, DellEMC, Innovium, Intel, Juniper, Metaswitch, Microsoft, Nvidia.   . 

<br> 
