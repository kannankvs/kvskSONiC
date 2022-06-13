# SONiC 202111 Release Notes

This document captures the new features added and enhancements done on existing features/sub-features for the SONiC [202205](https://github.com/Azure/SONiC/wiki/Release-Progress-Tracking-202205) release.



# Table of Contents

 * [Branch and Image Location](#branch-and-image-location)
 * [Dependency Version](#dependency-version)
 * [Security Updates](#security-updates)
 * [Feature List](#feature-list)
 * [SAI APIs](#sai-apis)
 * [Contributors](#contributors)


# Branch and Image Location  

Branch : https://github.com/Azure/sonic-buildimage/tree/202205 <br> 
Image  : https://sonic-build.azurewebsites.net/ui/sonic/pipelines  (Example - Image for Broadcom based platforms is [here](https://sonic-build.azurewebsites.net/ui/sonic/pipelines/138/builds/51255/artifacts/98637?branchName=master&artifactName=sonic-buildimage.broadcom))

# Dependency Version

|Feature                    | Version  |
| ------------------------- | --------------- |
| Linux kernel version      | linux_5.10.0-8-2-$(5.10.46-4)  |
| SAI   version             | SAI v1.9.1    |
| FRR                       | 7.5.1   |
| LLDPD                     | 1.0.4-1    |
| TeamD                     | 1.28-1    |
| SNMPD                     | 5.9+dfsg-3+b1    |
| Python                    | 3.6.0-1    |
| syncd                     | 1.0.0    |
| swss                      | 1.0.0    |
| radvd                     | 2.17-2~bpo9+1    |
| isc-dhcp                  | 4.4.1-2   |
| sonic-telemetry           | 0.1    |
| redis-server/ redis-tools | 5.0.3-3~bpo9+2    |


# Security Updates

1. Kernel upgraded from 4.19.152-1 to 5.10.46-4 for SONiC release.<br>
   Change log: https://tracker.debian.org/media/packages/l/linux/changelog-5.10.46-4

2. Docker upgraded from 18.09.8\~3-0\~debian-stretch to 20.10.7\~3-0\~debian-stretch.<br>
   Change log: https://docs.docker.com/engine/release-notes/#20107 


# Feature List

#### NVGRE/GRE
With the implementation of NVGRE/GRE feature, the following is supported:

	*	User should be able to create NVGRE tunnel (L2 over L3 tunnel)
	*	User should be able to create VLAN to VSID mapper entries for the NVGRE tunnel.
	*	Both VLAN and Bridge to VSID mappers should be supported by the NVGRE tunnel
	*	Only the decapsulation mappers supported
	*	YANG model should be created in order to auto-generate CLI by using the SONiC CLI Auto-generation tool.
	*	CLI for NVGRE tunnel

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/nvgre_tunnel/nvgre_tunnel.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Align crmorch with sai_object_type_get_availability

Refer [HLD document]() and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Move Nvidia syncd and pmon to Debian11- "Bullseye"

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Dynamic policy based hashing (edit flow)
This feature implements the PBH for NVGRE/VxLAN packets based on inner 5-tuple (IP proto, L4 dst/src port, IPv4/IPv6 dst/src)

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/pbh/pbh-design.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Counter delay via config_db and not via systemd 
The below are the implementation on Fast reboot flow improvements,

	*	Reboot the switch into a new SONiC software version using kexec - less than 5 seconds.
	*	Upgrade the switch FW by the new SONiC image if needed.
	*	Recover all application's state with the new image to the previous state prior the reboot.
	*	Recover ASIC state after reset to the previous state prior the reboot.
	*	Recover the Kernel internal DB state after reset to the previous state prior the reboot.
	*	Sync the Kernel and ASIC with changes on the network which happen during fast-reboot.
	*	Control plane downtime will not exceed 90 seconds.
	*	Data plane downtime will not exceed 30 seconds.
	
Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/fast-reboot/Fast-reboot_Flow_Improvements_HLD.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Route Flow counters (based on generic counters)
With the implementation of NVGRE/GRE feature, the following is supported:

	*	Generic Counters shall be used as Flow Counters introduced by the feature
	*	Flow Counters for routes shall be configured using prefix patterns. 
	*	Flow Counters shall be bound the matching routes regardless how these routes are added - manually (static) or via FRR
	*	Adding route entry shall be automatically bound to counter if counter is enabled and pattern matches
	*	Removing route entry shall be automatically unbound if the entry is previously bound
	*	To support default route, pattern "0.0.0.0" and "::" shall be treated as exact match instead of pattern match

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/flow_counters/routes_flow_counters.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### hostcfgd Redesign | split hostcfgd into multiple services


Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Password Hardening
The password hardening feature implements the requirements, architecture and configuration details of password hardening feature in switches Sonic OS based.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/passw_hardening/hld_password_hardening.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : [874](https://github.com/sonic-net/SONiC/pull/874/), [2121](https://github.com/Azure/sonic-utilities/pull/2121), [5503](https://github.com/Azure/sonic-mgmt/pull/5503), [10322](https://github.com/Azure/sonic-buildimage/pull/10322) & [10323](https://github.com/Azure/sonic-buildimage/pull/10323)


#### Add system date row to ‘show version’

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Command for showing specific MAC from DB

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Klish CLI for show-tech support
This feature is intended to cover the general approach and method for providing a flexible collection of diagnostic information items. It also considers the basic mechanisms to be used for obtaining the various types of information to be aggregated. It does not address specific details for collection of all supported classes of information.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/mgmt/SONiC%20Management%20Framework%20Show%20Techsupport%20HLD.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### FRR version upgrade from 7.5 to 8.2

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Storm Control (BUM)
This feature supports configuration of Broadcast, Unknown-unicast and unknown-Multicast storm-control independently on physical interfaces. Also, supports threshold rate configuration in kilo bits per second (kbps) in the range of 0 kbps to 100,000,000 kbps (100Gbps).

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/bum_storm_control/bum_storm_control_hld.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Migrated PDDF to Bullseye

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Updated PDDF kernel modules in compliance with kernel 5.10 APIs

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Updated PDDF SFP Class with refactored SFP framework

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Added fan_drawer class support in PDDF

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### CMIS Diagnostics
This feature implements SONIC QSFPDD CMIS support to provide an unified common SFP parser for the QSFPDD transceivers. Enhance the pmon#xcvrd for the QSFPDD application initialization sequence and enhance the pmon#xcvrd for the QSFPDD diagnostics loopback controls

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/master/doc/sfp-cmis/cmis-init.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### System Ready Enhancements
This feature implements a new python based System monitor framework is introduced to monitor all the essential system host services including docker wrapper services on an event based model and declare the system is ready. This framework gives provision for docker and host apps to notify its closest up status. CLIs are provided to fetch the current system status and also service running status and its app ready status along with failure reason if any.

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### SONIC YANG Support for KDUMP, ACL, MCLAG, BUM Storm Control

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### PINS - Batched programming requests for higher throughput
This implements two new APIs will be introduced into the ProducerStateTable. There will be no change in the existing ProducerStateTable method implementations. There is also no change in the ConsumerStateTable implementation as it can already process batches. The entire change is backward compatible.

Refer [HLD document](https://github.com/sonic-net/SONiC/blob/5a5922499b388acafa85dd3c9a64520514e01946/doc/pins/batch_requests_api_hld.md) and below mentioned PR's for more details. 
<br>  **Pull Requests** : 

#### Platform support for Edgecore AS4630/AS7326/AS7816/AS5835

Refer [HLD document] and below mentioned PR's for more details. 
<br>  **Pull Requests** : [10053](https://github.com/Azure/sonic-buildimage/pull/10053)


# SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.9.1 Release Notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.9.1_ReleaseNotes.md)


# Contributors 

SONiC community would like to thank all the contributors from various companies and the individuals who has contributed for the release. Special thanks to the major contributors - Alibaba, Aviz, Broadcom, DellEMC, Google, Intel, Juniper, LinkedIn, Marvell, Metaswitch, Microsoft & Nvidia.  

<br> 
