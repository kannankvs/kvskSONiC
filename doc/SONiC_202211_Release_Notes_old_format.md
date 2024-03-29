# SONiC 202211 Release Notes

This document captures the new features added and enhancements done on existing features/sub-features for the SONiC [202211](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-202211) release.



# Table of Contents

 * [Branch and Image Location](#branch-and-image-location)
 * [Dependency Version](#dependency-version)
 * [Security Updates](#security-updates)
 * [Feature List](#feature-list)
 * [SAI APIs](#sai-apis)
 * [Contributors](#contributors)


# Branch and Image Location  

Branch : https://github.com/Azure/sonic-buildimage/tree/202211 <br> 
Image  : https://sonic-build.azurewebsites.net/ui/sonic/pipelines  (Example - Image for Broadcom based platforms is [here](https://sonic-build.azurewebsites.net/ui/sonic/pipelines/138/builds/51255/artifacts/98637?branchName=master&artifactName=sonic-buildimage.broadcom))

# Dependency Version

|Feature                    | Version  |
| ------------------------- | --------------- |
| Linux kernel version      | linux_5.10.0-18-2-$(5.10.140)  |
| SAI   version             | SAI v1.11.0    |
| FRR                       | 8.2.2   |
| LLDPD                     | 1.0.4-1    |
| TeamD                     | 1.28-1    |
| SNMPD                     | 5.9+dfsg-3+b1    |
| Python                    | 3.9.2-1    |
| syncd                     | 1.0.0    |
| swss                      | 1.0.0    |
| radvd                     | 2.17-2~bpo9+1    |
| isc-dhcp                  | 4.4.1-2   |
| sonic-telemetry           | 1.1    |
| redis-server/ redis-tools | 5.0.3-3~bpo9+2    |
| Debian version			| Continuous to use Bullseye (Debian version 11)	|

Note : The kernel version is migrated to the version that is mentioned in the first row in the above 'Dependency Version' table.


# Security Updates

1. Kernel upgraded from 5.10.103-1 to 5.10.140-1 for SONiC release.<br>
   Change log: https://tracker.debian.org/media/packages/l/linux/changelog-5.10.140-1

2. Docker upgraded from  20.10.17-debian-stretch. to 20.10.22-debian-stretch.<br>
   Change log: https://docs.docker.com/engine/release-notes/#201022


# Feature List


#### Auto Neg Enhancement
This feature does not change the existing SONiC architecture. This feature introduces a few new CLI commands which will fit in sonic-utilities. And this feature also requires to change the configuration flow for port auto negotiation attributes which will be covered in orchagent.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/port_auto_neg/port-auto-negotiation-design.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [924](https://github.com/sonic-net/SONiC/pull/924); [1038](https://github.com/sonic-net/sonic-sairedis/pull/1038); [2359](https://github.com/sonic-net/sonic-swss/pull/2359); [614](https://github.com/sonic-net/sonic-swss-common/pull/614) & [2124](https://github.com/sonic-net/sonic-utilities/pull/2124) 


#### BRCM KNET sflow psample API compliance upgrade 
This feature is an enhancement on BRCM KNET modules to support new psample definitions from sflow dropmon feature

Refer below mentioned PR's for more details. 
<br>  **Pull Requests** : [11709](https://github.com/sonic-net/sonic-buildimage/pull/11709) & [10](https://github.com/sonic-net/saibcm-modules/pull/10)
  

#### Build Time Improvement - Version cache framework
This feature gives the Functionality and High level design of the build improvement in SONiC. This feature provides improvements in three essential areas.

Multi user build <br>
		- Parallel build using Native docker mode.<br>
		- OverlayFS to virtualize the build root.<br>
Build time Optimization<br>
		- Parallel make jobs - Passing dh '-parallel' flags to all the build targets.<br>
		- Binary image build optimization<br>
		- Use tmpfs and OverlayFS to speed up the build process.<br>
Build caching<br>
		- Version cache - Package cache support for build componets that are downloaded from external world.<br>
		- Image cache support for installer image componets.<br>

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/sonic-build-system/build-enhancements.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [942](https://github.com/sonic-net/SONiC/pull/942); [10352](https://github.com/sonic-net/sonic-buildimage/pull/10352); [12000](https://github.com/sonic-net/sonic-buildimage/pull/12000); [12001](https://github.com/sonic-net/sonic-buildimage/pull/12001) & [12005](https://github.com/sonic-net/sonic-buildimage/pull/12005)


#### Bullseye Docker Migration - FRR, PDE, BRCM Platform, ICCPD 
This implements the migration from buster to bullseye. 

Refer below mentioned PR's for more details. 
<br>  **Pull Requests** : [10864](https://github.com/sonic-net/sonic-buildimage/pull/10864); [10836](https://github.com/sonic-net/sonic-buildimage/pull/10836); [30](https://github.com/sonic-net/sonic-platform-pdk-pde/pull/30); [11777](https://github.com/sonic-net/sonic-buildimage/pull/11777) & [12097](https://github.com/sonic-net/sonic-buildimage/pull/12097)
  

#### Bulk counters 
This feature implements the design specification for bulk counter feature on SONiC. SONiC flex counter infrastructure shall utilize bulk stats API to gain better performance. This feature discusses how to integrate these two new APIs to SONiC.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/bulk_counter/bulk_counter.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [1009](https://github.com/sonic-net/SONiC/pull/1009) & [1094](https://github.com/sonic-net/sonic-sairedis/pull/1094)


#### Incremental port configuration update 
This feature fix the two issues on portsyncd and portmgrd.  portsyncd and portmgrd both handle PORT table changes in CONFIG_DB and write APPL_DB according to configuration change. portmgrd handles fields including "mtu", "admin_status" and "learn_mode"; portsyncd handles all fields.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/port_auto_neg/port-auto-negotiation-design.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [985](https://github.com/sonic-net/SONiC/pull/985) & [2305](https://github.com/sonic-net/sonic-swss/pull/2305)


#### Link Training
This feature does not change the existing SONiC architecture, while it has to change the configuration flow for port link training which will be covered in orchagent.

This feature describes the design of following requirement:<br>
	- Allow user to configure link training<br>
	- Allow user to get the operational link training status<br>

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/port_link_training/port-link-training-design.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [915](https://github.com/sonic-net/SONiC/pull/925); [10025](https://github.com/sonic-net/sonic-buildimage/pull/10025); [1038](https://github.com/sonic-net/sonic-sairedis/pull/1038); [2359](https://github.com/sonic-net/sonic-swss/pull/2359); [614](https://github.com/sonic-net/sonic-swss-common/pull/614); [2071](https://github.com/sonic-net/sonic-utilities/pull/2071) &[1434](https://github.com/opencomputeproject/SAI/pull/1434)


#### Make syslog log level configuration persistent  
To make the loglevel persistent to reboot, we will move the Logger's tables in LOGLEVEL DB to CONFIG DB. Since the Config DB is already persistent, the log level will also be persistent to reboot. The log level will be saved using the "config save" CLI command.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/logging/persistent_logger/persistent_loglevel.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [1041](https://github.com/sonic-net/SONiC/pull/1041); [687](https://github.com/sonic-net/sonic-swss-common/pull/687); [2370](https://github.com/sonic-net/sonic-utilities/pull/2370); [12067](https://github.com/sonic-net/sonic-buildimage/pull/12067); [11996](https://github.com/sonic-net/sonic-buildimage/pull/11996); [12657](https://github.com/sonic-net/sonic-buildimage/pull/12657); [271](https://github.com/sonic-net/sonic-snmpagent/pull/271); [56](https://github.com/sonic-net/sonic-gnmi/pull/56); [2507](https://github.com/sonic-net/sonic-swss/pull/2507); [64](https://github.com/sonic-net/sonic-mgmt-common/pull/64) &  [129](https://github.com/sonic-net/sonic-py-swsssdk/pull/129)


#### NPU MDIO Access Support and gbsyncd Enhancement 
This feature describes the high level design of the gbsyncd mdio access function with the focus on using the mdio bus from the switch NPU. This function primarily consists of two new syncd classes, one new mdio access library, addition of SAI switch api and changes in switch NPU configuration. The function helps the gbsyncd and PAI library to access the mdio devices (External PHYs). One of the new syncd class also helps to dynamically load PAI library and MDIO access library at runtime so that only a single gbsyncd docker can work for different switch platforms with external PHY.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/gearbox/gearbox_mdio-HLD.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [1045](https://github.com/sonic-net/SONiC/pull/1045); [11303](https://github.com/sonic-net/sonic-buildimage/pull/11303); [1507](https://github.com/opencomputeproject/SAI/pull/1507) & [1080](https://github.com/sonic-net/sonic-sairedis/pull/1080)


#### OSFP Transceiver monitoring 
This feature implements the refactor SFP code to remove code duplication and to be able to use the latest features available in new APIs.

Refer below mentioned PR's for more details. 
<br>  **Pull Requests** : [10317](https://github.com/sonic-net/sonic-buildimage/pull/10317)


#### PDDF QSFPs Low Power Mode Support 
This implements a change in modified pddf_sfp.py to include get/set APIs for lpmode in case of QSFP. As it was unable to get/set low power mode for QSFP28 and QSFP+

Refer below mentioned PR's for more details. 
<br>  **Pull Requests** : [11786](https://github.com/sonic-net/sonic-buildimage/pull/11786)


#### PINS GE Netlink
SONiC supports Packet I/O on Linux netdev interfaces but this does not meet some unique requirements of P4Runtime application. This feature details the requirements and captures the design changes necessary to meet the new requirements.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/pins/Packet_io.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [978](https://github.com/sonic-net/SONiC/pull/978)


#### PINS Generic SAI Extensions
This feature implements, P4RT-APP and P4Orch are two new components introduced in the SONiC control plane to support PINS. P4RT-APP interfaces to a P4RT Client, reads messages from a client and produces data in APPL_DB. P4Orch subscribes to APPL_DB tables produced by P4RT-APP, translates data received from APPL_DB to respective SAI attributes and after successful cross object dependency resolution calls appropriate SAI APIs.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/pins/PINS_SONiC_Design_for_SaiGenericExt.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [1088](https://github.com/sonic-net/SONiC/pull/1088); [704](https://github.com/sonic-net/sonic-swss-common/pull/704); [17](https://github.com/sonic-net/sonic-pins/pull/17) & [2506](https://github.com/sonic-net/sonic-swss/pull/2506)


#### PINS Runtime Configuration 
The P4RT application is a new component being introduced into SONiC as part of the PINS proposal. P4RT is an API which allows a controller to push a forwarding pipeline configuration (compiled from a P4 program) and control different elements of that pipeline over a gRPC connection.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/pins/p4rt_app_hld.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [826](https://github.com/sonic-net/SONiC/pull/826) & [10499](https://github.com/sonic-net/sonic-buildimage/pull/10499)


#### RJ-45 
This implementation is an enhancement on added support to the RJ45 port in SONiC 

Refer below mentioned PR's for more details. 
<br>  **Pull Requests** : [1030](https://github.com/sonic-net/SONiC/pull/1030), [10377](https://github.com/sonic-net/sonic-buildimage/pull/10377), [11336](https://github.com/sonic-net/sonic-buildimage/pull/11336), [11460](https://github.com/sonic-net/sonic-buildimage/pull/11460), [2112](https://github.com/sonic-net/sonic-utilities/pull/2112), [2111](https://github.com/sonic-net/sonic-utilities/pull/2111), [2110](https://github.com/sonic-net/sonic-utilities/pull/2110), [247](https://github.com/sonic-net/sonic-snmpagent/pull/247), [2249](https://github.com/sonic-net/sonic-utilities/pull/2249), [288](https://github.com/sonic-net/sonic-platform-common/pull/288) & [5927](https://github.com/sonic-net/sonic-mgmt/pull/5927)


#### Setting RIF loopback action to drop 
IP interface loopback action is a feature that allows user to change the way router handles routed packets for which egress port equals to ingress port.

When loopback action is configured to drop, those packets will be dropped. Drppoed packets due to loopback action are counted in rif statistics.
When loopback action is configured to forward, those packets will be forwarded as the pipeline defined.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/ip-interface/loopback-action/ip-interface-loopback-action-design.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [1006](https://github.com/sonic-net/SONiC/pull/1006); [11012](https://github.com/sonic-net/sonic-buildimage/pull/11012); [2192](https://github.com/sonic-net/sonic-utilities/pull/2192); [2307](https://github.com/sonic-net/sonic-swss/pull/2307); [5956](https://github.com/sonic-net/sonic-mgmt/pull/5956) & [5871](https://github.com/sonic-net/sonic-mgmt/pull/5871)


#### SONIC YANG - VxLAN, SNMP   
This feature lists the configuration commands schema applied in the SONiC eco system. All these commands find relevance in collecting system information, analysis and even for trouble shooting. 

Refer [HLD document](https://github.com/sonic-net/sonic-buildimage/blob/master/src/sonic-yang-models/doc/Configuration.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [7294](https://github.com/sonic-net/sonic-buildimage/pull/7294); [10828](https://github.com/sonic-net/sonic-buildimage/pull/10828); [10550](https://github.com/sonic-net/sonic-buildimage/issues/10550)


#### SRv6 uSID support in SONiC dataplane - uN, uA   
This implements an enhanced orchagent to support uSID programming instructions in this IETF draft. Current SAI API definitions already support uSID instructions. No SAI API change required in scope of this document. Current version of routing protocols in SONiC does not support SRv6, it is not in the scope of this document to add such a support for FRR routing stack.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/srv6/SRv6_uSID.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** :  [1034](https://github.com/sonic-net/SONiC/pull/1034) & [2335](https://github.com/sonic-net/sonic-swss/pull/2335)


#### Structured message by streaming telemetry 
This implements the SONiC to stream events occurring in SONiC switch (e.g BGP flap, process not running, ...) in real time via gNMI subscription model. The events are defined using versioned YANG schema.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/event-alarm-framework/events-producer.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [11618](https://github.com/sonic-net/sonic-buildimage/pull/11618); [11639](https://github.com/sonic-net/sonic-buildimage/pull/11639); [11848](https://github.com/sonic-net/sonic-buildimage/pull/11848); [11973](https://github.com/sonic-net/sonic-buildimage/pull/11973); [12059](https://github.com/sonic-net/sonic-buildimage/pull/12059); [12270](https://github.com/sonic-net/sonic-buildimage/pull/12270); [12290](https://github.com/sonic-net/sonic-buildimage/pull/12290); [12554](https://github.com/sonic-net/sonic-buildimage/pull/12554); [12563](https://github.com/sonic-net/sonic-buildimage/pull/12563); [12659](https://github.com/sonic-net/sonic-buildimage/pull/12659); [12687](https://github.com/sonic-net/sonic-buildimage/pull/12687); [2446](https://github.com/sonic-net/sonic-swss/pull/2446); [13](https://github.com/sonic-net/sonic-gnmi/pull/13); [41](https://github.com/sonic-net/sonic-gnmi/pull/41); [43](https://github.com/sonic-net/sonic-gnmi/pull/43); [44](https://github.com/sonic-net/sonic-gnmi/pull/44); [45](https://github.com/sonic-net/sonic-gnmi/pull/45); [2449](https://github.com/sonic-net/sonic-utilities/pull/2449); [667](https://github.com/sonic-net/sonic-swss-common/pull/667) & [672](https://github.com/sonic-net/sonic-swss-common/pull/672)


#### Systemd bootchart integration    
This document describes an integration of one of systemd tools called systemd-bootchart. This tool is a sampling based system profiler that is used to analyze boot up performance but not limited to and can be used to collect samples after the system is booted. The output produced by systemd-bootchart is an SVG image.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/profiling/sonic_bootchart.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [1001](https://github.com/sonic-net/SONiC/pull/1001) , [11047](https://github.com/sonic-net/sonic-buildimage/pull/11047) & [2195](https://github.com/sonic-net/sonic-utilities/pull/2195)


#### Syslog Source IP configuration 
SSIP is a feature which allows user to change UDP packet source IP address. Any configured address can be used for source IP mangling. This might be useful for security reasons. <br>

SSIP also extends the existing syslog implementation with VRF device and server UDP port configuration support. The feature doesn't change the existing DB schema which makes it fully backward compatible.
<br>

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/syslog/syslog-design.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [1002](https://github.com/sonic-net/SONiC/pull/1002), [10992](https://github.com/sonic-net/sonic-buildimage/pull/10992), [11363](https://github.com/sonic-net/sonic-buildimage/pull/11363), [10991](https://github.com/sonic-net/sonic-buildimage/pull/10991), [2191](https://github.com/sonic-net/sonic-utilities/pull/2191), [5943](https://github.com/sonic-net/sonic-mgmt/pull/5943) & [5904](https://github.com/sonic-net/sonic-mgmt/pull/5904)

  
# SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.11.0 Release Notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.11.0_ReleaseNotes.md)


# Contributors 

SONiC community would like to thank all the contributors from various companies and the individuals who has contributed for the release. Special thanks to the major contributors -  Alibaba, Broadcom, Cisco, Dell, Google, Intel, Microsoft, Nvidia,   

<br> 



