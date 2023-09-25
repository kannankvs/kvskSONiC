# SONiC 202305 Release Notes

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
| ***Fix containers deployments dependencies on boot/config_reload affecting user experience*** | | | |	
| ***Persistent DNS address across reboots*** | | | |
| ***SSH global config*** | | | |
| ***UMF Infra Enhancement for SONIC-YANG*** | | | |
| ***Libvs Port Counter Support*** | | | |
| ***RADIUS NSS Vulnerability*** | | | |
| ***PDDF System Fan Enhancement*** | | | |
| ***PDDF support for Ufispace platforms and GPIO extension*** | | | |
| ***TACACS NSS Vulnerability*** | | | |
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
| ***Virtual SONiC Network Helper*** | | | |
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
| ***Upgrade hsflowd and remove dropmon build flags*** | | | |
| ***Upgrade to FRR 8.5.1*** | | | |
| ***BGP Unnumberd- enable Multiple sessions and assign unique MAC address per port by default*** | | | |
| ***Sflow 800G Support*** | | | |
| ***CLI session commands*** | | | |
| ***Block SONiC CLI until configuration is done*** | | | |
| ***Enable Redis ACLs*** | | | |
| ***SONiC App extension enhance manifest to support additional networking streaming  capabilities from external container*** | | | |
| ***Build improvements changes*** | | | |
| ***Auto FEC*** | | | |
| ***Factory reset*** | | | |
| ***NTP: Additional NTP configuration knobs + NTP server provisioning*** | | | |
| ***Isis configuration support*** | | | |
| ***Egress Sflow Enhancement.*** | | | |
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
| ***[DASH] ACL tags HLD*** | | | |

# SAI APIs

Please find the list of API's classified along the newly added SAI features. For further details on SAI API please refer [SAI_1.13.1 Release Notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.13.1_ReleaseNotes.md)


# Contributors 

SONiC community would like to thank all the contributors from various companies and the individuals who has contributed for the release. Special thanks to the major contributors - AvizNetworks, Broadcom, Celestica, Cisco, Dell, Edge-core, Google, Innovium, Intel, Marvell, Microsoft, Nvidia, xFlow Research Inc.    

<br> 


NA* - Not Applicable
