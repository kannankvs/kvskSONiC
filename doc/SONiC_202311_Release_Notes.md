# SONiC 202311 Release Notes

This document captures the new features added and enhancements done on existing features/sub-features for the SONiC [202311](https://github.com/orgs/sonic-net/projects/14/views/1) release.



# Table of Contents

 * [Branch and Image Location](#branch-and-image-location)
 * [Dependency Version](#dependency-version)
 * [Security Updates](#security-updates)
 * [Feature List](#feature-list)
 * [SAI APIs](#sai-apis)
 * [Contributors](#contributors)


# Branch and Image Location  

Branch : https://github.com/Azure/sonic-buildimage/tree/202311 <br> 
Image  : https://sonic-build.azurewebsites.net/ui/sonic/pipelines  (Example - Image for Broadcom based platforms is [here](https://sonic-build.azurewebsites.net/ui/sonic/pipelines/138/builds/51255/artifacts/98637?branchName=master&artifactName=sonic-buildimage.broadcom))

# Dependency Version

|Feature                    | Version  |
| ------------------------- | --------------- |
| Linux kernel version      | linux_5.10.0-18-2-$(5.10.136)  |
| SAI   version             | SAI v1.12.0    |
| FRR                       | 8.2.2   |
| LLDPD                     | 1.0.4-1    |
| TeamD                     | 1.30-1    |
| SNMPD                     | 5.9+dfsg-4+deb11u1    |
| Python                    | 3.9.2-1    |
| syncd                     | 1.0.0    |
| swss                      | 1.0.0    |
| radvd                     | 2.18-3    |
| isc-dhcp                  | 4.4.1-2.3   |
| sonic-telemetry           | 1.1    |
| redis-server/ redis-tools | 5.0.3-3~bpo9+2    |
| Debian version			| Continuous to use Bullseye (Debian version 11)	|

Note : The kernel version is migrated to the version that is mentioned in the first row in the above 'Dependency Version' table.


# Security Updates

1. Kernel upgraded from 5.10.103-1 to 5.10.136-1 for SONiC release.<br>
   Change log: https://tracker.debian.org/media/packages/l/linux/changelog-5.10.136-1

2. Docker upgraded from  20.10.22-debian-stretch. to 24.0.2-debian-stretch <br>
   Change log: https://docs.docker.com/engine/release-notes/24.0/#201022


# Feature List

| Feature| Feature Description | HLD PR / PR tracking |	Quality |
| ------ | ------- | -----|-----|
| ***Auto FEC*** | This feature delivers a deterministic approach when FEC and autoneg are configured together which is currently left to vendor implementation. | [1416](https://github.com/sonic-net/SONiC/pull/1416), [2874](https://github.com/sonic-net/sonic-swss/pull/2874), [1271](https://github.com/sonic-net/sonic-sairedis/pull/1271), [2893](https://github.com/sonic-net/sonic-swss/pull/2893), [2965](https://github.com/sonic-net/sonic-utilities/pull/2965) & [16389](https://github.com/sonic-net/sonic-buildimage/pull/16389) | |
| ***BGP Unnumberd- enable Multiple sessions and assign unique MAC address per port by default*** | This feature is achieved with the implementation of new FRR 8.5.1 integration | [15965](https://github.com/sonic-net/sonic-buildimage/pull/15965), [13396](https://github.com/FRRouting/frr/pull/13396) & [13757](https://github.com/FRRouting/frr/pull/13757) | |
| ***[DASH] ACL tags HLD*** | In a DASH SONiC, a service tag represents a group of IP address prefixes from a given service. The controller manages the address prefixes encompassed by the service tag and automatically updates the service tag as addresses change, minimizing the complexity of frequent updates to network security rules. Mapping a prefix to a tag can reduce the repetition of prefixes across different ACL rules and optimize memory usage. | [1427](https://github.com/sonic-net/SONiC/pull/1427), [2915](https://github.com/sonic-net/sonic-swss/pull/2915), [805](https://github.com/sonic-net/sonic-swss-common/pull/805) & [9844](https://github.com/sonic-net/sonic-mgmt/pull/9844) | |
| ***Egress Sflow Enhancement.*** | This feature updates the existing sFlow HLD for egress Sflow support. | [1268](https://github.com/sonic-net/SONiC/pull/1268), [2790](https://github.com/sonic-net/sonic-utilities/pull/2790), [2731](https://github.com/sonic-net/sonic-swss/pull/2731) & [14630](https://github.com/sonic-net/sonic-buildimage/pull/14630) | |
| ***Fix containers deployments dependencies on boot/config_reload affecting user experience*** | Currently hostcfgd controls the services based on the feature table. The feature table has a specific field 'has_timer' for the non essential services which needs to be delayed during the reboot flow. This field will be now replaced by new field called "delayed". These services will controlled by hostcfgd. | [1203](https://github.com/sonic-net/SONiC/pull/1203) & [1379](https://github.com/sonic-net/SONiC/issues/1379) | |	
| ***Persistent DNS address across reboots*** | With the current implementation dynamic DNS configuration can be received from the DHCP server or static configuration can be set manually by the user. However, SONiC doesn't provide any protection for the static configuration. The configuration that is set by the user can be overwritten with the dynamic configuration at any time. The proposed solution is to add support for static DNS configuration into Config DB. To be able to choose between dynamic and static DNS configurations resolvconf package. | [1380](https://github.com/sonic-net/SONiC/issues/1380), [13834](https://github.com/sonic-net/sonic-buildimage/pull/13834), [14549](https://github.com/sonic-net/sonic-buildimage/pull/14549), [2737](https://github.com/sonic-net/sonic-utilities/pull/2737), [49](https://github.com/sonic-net/sonic-host-services/pull/49), [1322](https://github.com/sonic-net/SONiC/pull/1322), [8436](https://github.com/sonic-net/sonic-mgmt/pull/8436) & [8712](https://github.com/sonic-net/sonic-mgmt/pull/8712) | |
| ***SSH global config*** | This feature introduces a procedure to configure ssh server global settings. This feature will include 3 configurations in the first phase, but can be extended easily to include additional configurations. | [1169](https://github.com/sonic-net/SONiC/issues/1169), [1075](https://github.com/sonic-net/SONiC/pull/1075), [13338](https://github.com/Azure/sonic-buildimage/pull/13338) & [32](https://github.com/sonic-net/sonic-host-services/pull/32) | |
| ***UMF Infra Enhancement for SONIC-YANG*** | This implements the option to import specific sonic yangs from buildimage sonic-yang-models directory into UMF & CVL enhancement to handle handle singleton tables modeled as a container instead of the usual _LIST syntax | [1397](https://github.com/sonic-net/SONiC/issues/1397) | |
| ***Libvs Port Counter Support*** | TBD | [1398](https://github.com/sonic-net/SONiC/issues/1398) | |
| ***RADIUS NSS Vulnerability*** | TBD | [1399](https://github.com/sonic-net/SONiC/issues/1399) | |
| ***PDDF System Fan Enhancement*** | Current PDDF design supports only 12 individual fans (if 2 fans per tray then total of 6 fantrays). However, some platform have more fans. To support those platforms via PDDF, we added support for more fans in common fan PDDF drivers. | [15956](https://github.com/sonic-net/sonic-buildimage/pull/15956) & [1440](https://github.com/sonic-net/SONiC/issues/1440) | |
| ***PDDF support for Ufispace platforms and GPIO extension*** | This feature adds the PDDF support on Ufispace platforms with Broadcom ASIC for S9110-32X, S8901-54XC, S7801-54XS, S6301-56ST | [16017](https://github.com/sonic-net/sonic-buildimage/pull/16017) & [1441](https://github.com/sonic-net/SONiC/issues/1441)| |
| ***Sflow 800G Support*** | This feature enhances the current sFlow in sonic, with additional speed due to new ASICs support for 800G. | [1383](https://github.com/sonic-net/SONiC/issues/1383), [2799](https://github.com/sonic-net/sonic-swss/pull/2799) & [2805](https://github.com/sonic-net/sonic-swss/pull/2805) | |
| ***TACACS NSS Vulnerability*** | TBD | [1464](https://github.com/sonic-net/SONiC/issues/1464) | |
| ***Upgrade hsflowd and remove dropmon build flags*** | TBD | TBD | |
| ***Upgrade to FRR 8.5.1*** | This feature upgrades the FRR 8.5.1 to include latest fixes. | [15965](https://github.com/sonic-net/sonic-buildimage/pull/15965), [13396](https://github.com/FRRouting/frr/pull/13396) & [13757](https://github.com/FRRouting/frr/pull/13757) | |
| ***Virtual SONiC Network Helper*** | This feature implements vsnet tool to create network of virtual sonic instances | [8459](https://github.com/sonic-net/sonic-mgmt/pull/8459) | |
| ***Multiple Spanning Tree Protocol (MSTP) HLD*** | | | |
| ***Mac-based Vlan Assignment*** | | | |
| ***Switchport Mode Hybrid Support*** | | | |
| ***Smart Switch  w/ vNet-vNet/Service Tunnel/Private Link*** | | | |
| ***Port Based DHCP Server*** | | | |
| ***gNOI API support*** | | | |
| ***Default value from SONiC YANG for configuration*** | | | |
| ***MMU incremental config update*** | | | |
| ***Dual ToR heartbeat  offloading to ASIC*** | | | |
| ***Dual ToR fast switchover via protection group - design only*** | | | |
| ***SONiC Port Access Control*** | | | |
| ***UMF Subscription Infra Phase 2*** | | | |
| ***Third Party Container Management*** | | | |
| ***UMF Query Parameter Support*** | | | |
| ***Disaggregated Scheduled Fabric (DSF) Support for SONiC*** | | | |
| ***Virtual Router Redundancy Protocol (VRRP) enalement*** | | | |
| ***LDAP support*** | | | |
| ***SRv6 Performance Measurement*** | | | |
| ***Upgrade SONiC OS (base) image to Debian 12.0*** | | | |
| ***Voltage and Current Sensor Monitoring*** | | | |
| ***UEFI key management in SONiC to perform secure boot key rotation, update, remove revoke etc*** | | | |
| ***sflow_pkt_drop_notifications support for SONiC*** | | | |
| ***TACACS Passkey encryption feature*** | | | |
| ***Queue counter rate support*** | | | |
| ***SONiC Hash Offset configuration support*** | | | |
| ***ACL QOS enhancements*** | | | |
| ***ACL based policer*** | | | |
| ***Statistics support for VLAN*** | | | |
| ***Fpmsyncd Next Hop Table Enhancement*** | | | |
| ***Move chassis-app-db to global-app-db to accommodate*** | | | |
| ***MAB (MAC Authentication Bypass)*** | | | |
| ***VXLAN EVPN Multi-homing*** | | | |
| ***Update Event Framework with DB Support*** | | | |
| ***Multiple Spanning Tree Protocol*** | | | |
| ***Add DPB (Dynamic Port Breakout) support for PHY-less chassis/boards*** | | | |
| ***UMF: Additional Optimizations for Transformer Infrastructure*** | | | |
| ***DHCPv4 - Specify Gateway explicitly*** | | | |
| ***CMIS host management - Extend Port signal integrity with additional SAI attributes*** | | | |
| ***CMIS host management - Port signal integrity per speed*** | | | |
| ***CMIS host management - TX Ready handling*** | | | |
| ***CLI session commands*** | | | |
| ***Block SONiC CLI until configuration is done*** | | | |
| ***Enable Redis ACLs*** | | | |
| ***SONiC App extension enhance manifest to support additional networking streaming  capabilities from external container*** | | | |
| ***Build improvements changes*** | | | |
| ***Factory reset*** | | | |
| ***NTP: Additional NTP configuration knobs + NTP server provisioning*** | | | |
| ***Isis configuration support*** | | | |
| ***ECN and WRED statistics*** | | | |
| ***AMD-Pensando ELBA SOC support*** | | | |
| ***Link Event Damping*** | | | |
| ***gNMI: Save-On-Set*** | | | |
| ***gNMI Master Arbitration*** | | | |
| ***Ondatra*** | | | |
| ***P4-CLI*** | | | |
| ***Software upgrade NSF*** | | | |
| ***NTP: minpoll/maxpoll support*** | | | |
| ***Two-Way Active Measurement Protocol (TWAMP) Light*** | | | |
| ***Container Hardening*** | | | |


# SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.13.1 Release Notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.13.1_ReleaseNotes.md)


# Contributors 

SONiC community would like to thank all the contributors from various companies and the individuals who has contributed for the release. Special thanks to the major contributors - AvizNetworks, Broadcom, Celestica, Cisco, Dell, Edge-core, Google, Innovium, Intel, Marvell, Microsoft, Nvidia, xFlow Research Inc.    

<br> 



