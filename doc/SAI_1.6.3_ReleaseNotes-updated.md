
# SAI 1.6.3 Release Notes

The Switch Abstraction Interface defines the APIs to provide a vendor-independent way of controlling forwarding elements, such as a switching ASIC, an NPU or a software switch in a uniform manner. This release notes covers the changes happened for SAI APIs after SAI 1.5 release. Please refer the previous changes in [SAI 1.5 release notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.5_ReleaseNotes.md) 

This section describes the SAI changes done for features, and various bug fixes mentioned below.


## 1. MACsec Feature (#1010)  

The switching hardware consists of network interfaces connected to a forwarding element, such as a switching ASIC.  Some switching hardware also include Phy ASIC(s) that interconnect network interfaces and forwarding element interfaces.  Each Phy ASIC supports one or more network interfaces.  SAI is used for each such Phy ASIC.  A sai_switch object is used to interface to either a forwarding element or a Phy. This SAI MACsec API provides a software interface for 802.1ae MACSec Entities (SecY) associated with some or all ports of a sai_switch object.

Further details Please refer [Design Document](https://github.com/opencomputeproject/SAI/blob/master/doc/macsec-gearbox/SAI_MACsec_API_Proposal-v1.3.docx) 

#### (a) MACSEC SAI APIs - saimacsec.h
New SAI APIs for MACSEC feature are added for the following.

##### (i) Create/Delete a MACsec object, Set/Get MACsec attribute, 
`````
typedef sai_status_t (*sai_create_macsec_fn)(_Out_ sai_object_id_t *macsec_id,_In_ sai_object_id_t switch_id,_In_ uint32_t attr_count,_In_ const sai_attribute_t *attr_list);
typedef sai_status_t (*sai_remove_macsec_fn)(_In_ sai_object_id_t macsec_id);
typedef sai_status_t (*sai_set_macsec_attribute_fn)(_In_ sai_object_id_t macsec_id,_In_ const sai_attribute_t *attr);
typedef sai_status_t (*sai_get_macsec_attribute_fn)(_In_ sai_object_id_t macsec_id,_In_ uint32_t attr_count,_Inout_ sai_attribute_t *attr_list);		
`````
##### (ii) Create/Delete MACSec port, Get/Set MACSec port attribute, Get MACsec port counters, get MACsec port counters extended, clear MACsec port counters
`````
typedef sai_status_t (*sai_create_macsec_port_fn)(_Out_ sai_object_id_t *macsec_port_id,_In_ sai_object_id_t switch_id,_In_ uint32_t attr_count,_In_ const sai_attribute_t *attr_list);
typedef sai_status_t (*sai_remove_macsec_port_fn)(_In_ sai_object_id_t macsec_port_id);
typedef sai_status_t (*sai_set_macsec_port_attribute_fn)(_In_ sai_object_id_t macsec_port_id,_In_ const sai_attribute_t *attr);
typedef sai_status_t (*sai_get_macsec_port_attribute_fn)(_In_ sai_object_id_t macsec_port_id,_In_ uint32_t attr_count,_Inout_ sai_attribute_t *attr_list);
typedef sai_status_t (*sai_get_macsec_port_stats_fn)(_In_ sai_object_id_t macsec_port_id,_In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids,_Out_ uint64_t *counters);
typedef sai_status_t (*sai_get_macsec_port_stats_ext_fn)(_In_ sai_object_id_t macsec_port_id,_In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids,_In_ sai_stats_mode_t mode,_Out_ uint64_t *counters);
typedef sai_status_t (*sai_create_macsec_flow_fn)(_Out_ sai_object_id_t *macsec_flow_id,_In_ sai_object_id_t switch_id,_In_ uint32_t attr_count,_In_ const sai_attribute_t *attr_list);
`````
##### (iii)  Create/Delete a MACsec flow, Set/Get MACsec flow attributes
`````
typedef sai_status_t (*sai_create_macsec_flow_fn)(_Out_ sai_object_id_t *macsec_flow_id,_In_ sai_object_id_t switch_id,_In_ uint32_t attr_count,_In_ const sai_attribute_t *attr_list);
typedef sai_status_t (*sai_remove_macsec_flow_fn)(_In_ sai_object_id_t macsec_flow_id);
typedef sai_status_t (*sai_set_macsec_flow_attribute_fn)(_In_ sai_object_id_t macsec_flow_id,_In_ const sai_attribute_t *attr);
typedef sai_status_t (*sai_get_macsec_flow_attribute_fn)(_In_ sai_object_id_t macsec_flow_id,_In_ uint32_t attr_count,_Inout_ sai_attribute_t *attr_list);
`````
##### (iv) Create/Delete a MACsec Secure Channel, Set/Get MACsec secure channel attribute, Get MACsec Secure Channel counters & extended counters and clear counters
`````
typedef sai_status_t (*sai_create_macsec_sc_fn)(_Out_ sai_object_id_t *macsec_sc_id,_In_ sai_object_id_t switch_id,_In_ uint32_t attr_count,_In_ const sai_attribute_t *attr_list);
typedef sai_status_t (*sai_remove_macsec_sc_fn)(_In_ sai_object_id_t macsec_sc_id);
typedef sai_status_t (*sai_set_macsec_sc_attribute_fn)(_In_ sai_object_id_t macsec_sc_id,_In_ const sai_attribute_t *attr);
typedef sai_status_t (*sai_get_macsec_sc_attribute_fn)(_In_ sai_object_id_t macsec_sc_id,_In_ uint32_t attr_count,_Inout_ sai_attribute_t *attr_list);
typedef sai_status_t (*sai_get_macsec_sc_stats_fn)(_In_ sai_object_id_t macsec_sc_id,_In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids,_Out_ uint64_t *counters);
typedef sai_status_t (*sai_get_macsec_sc_stats_ext_fn)(_In_ sai_object_id_t macsec_sc_id,_In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids,_In_ sai_stats_mode_t mode,_Out_ uint64_t *counters);
typedef sai_status_t (*sai_clear_macsec_sc_stats_fn)(_In_ sai_object_id_t macsec_sc_id,_In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids);
`````
##### (v) Create/Delete a MACsec Secure Association, Set/Get MACsec Secure Association attribute, Get Secure Association counters & extended counters and clear counters
`````
typedef sai_status_t (*sai_create_macsec_sa_fn)( _Out_ sai_object_id_t *macsec_sa_id,_In_ sai_object_id_t switch_id,_In_ uint32_t attr_count,_In_ const sai_attribute_t *attr_list);
typedef sai_status_t (*sai_remove_macsec_sa_fn)(_In_ sai_object_id_t macsec_sa_id);
typedef sai_status_t (*sai_set_macsec_sa_attribute_fn)(_In_ sai_object_id_t macsec_sa_id,_In_ const sai_attribute_t *attr);
typedef sai_status_t (*sai_get_macsec_sa_attribute_fn)(_In_ sai_object_id_t macsec_sa_id,_In_ uint32_t attr_count, _Inout_ sai_attribute_t *attr_list);		
typedef sai_status_t (*sai_get_macsec_sa_stats_fn)( _In_ sai_object_id_t macsec_sa_id,_In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids,_Out_ uint64_t *counters);
typedef sai_status_t (*sai_get_macsec_sa_stats_ext_fn)(_In_ sai_object_id_t macsec_sa_id,_In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids,_In_ sai_stats_mode_t mode,_Out_ uint64_t *counters);
typedef sai_status_t (*sai_clear_macsec_sa_stats_fn)(_In_ sai_object_id_t macsec_sa_id,_In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids);
`````
##### (vi) MACsec flow counters functions for get/clear are added as below 
`````
typedef sai_status_t (*sai_get_macsec_flow_stats_fn)(_In_ sai_object_id_t macsec_flow_id, _In_ uint32_t number_of_counters, _In_ const sai_stat_id_t *counter_ids,
_Out_ uint64_t *counters);
typedef sai_status_t (*sai_get_macsec_flow_stats_ext_fn)(_In_ sai_object_id_t macsec_flow_id, _In_ uint32_t number_of_counters,_In_ const sai_stat_id_t *counter_ids, _In_ sai_stats_mode_t mode, _Out_ uint64_t *counters);
typedef sai_status_t (*sai_clear_macsec_flow_stats_fn)(_In_ sai_object_id_t macsec_flow_id, _In_ uint32_t number_of_counters, _In_ const sai_stat_id_t *counter_ids);	
`````
#### (b) Additional Changes
##### (i) saiacl.h 
SAI_ACL_ACTION_TYPE_MACSEC_FLOW added to sai_acl_action_type_t
SAI_ACL_TABLE_ATTR_FIELD_HAS_VLAN_TAG, SAI_ACL_TABLE_ATTR_FIELD_MACSEC_SCI added to sai_acl_table_attr_t
SAI_ACL_ENTRY_ATTR_FIELD_HAS_VLAN_TAG, SAI_ACL_ENTRY_ATTR_FIELD_MACSEC_SCI, SAI_ACL_ENTRY_ATTR_ACTION_MACSEC_FLOW added to sai_acl_entry_attr_t
##### (ii) saiport.h Changes
SAI_PORT_ATTR_INGRESS_MACSEC_ACL, SAI_PORT_ATTR_EGRESS_MACSEC_ACL, SAI_PORT_ATTR_MACSEC_PORT_LIST are added to enum sai_port_attr_t
##### (iii) saiswitch.h Changes
SAI_SWITCH_ATTR_MACSEC_OBJECT_ID added to sai_switch_attr_t
##### (iv) saitypes.h - few typedefs used in macsec are added.


## 2. Gearbox (#1014) 

Specific APIs are added as explained in the specification. Please refer the [Document](https://github.com/opencomputeproject/SAI/blob/master/doc/macsec-gearbox/SAI_Gearbox_API_Proposal-v1.0.docx) for more details.
#### (a) saiport.h 
##### (i) This API is to create Port connector to define logical relation between system side port to line side port.
typedef sai_status_t (*sai_create_port_connector_fn)( _Out_ sai_object_id_t *port_connector_id,_In_ sai_object_id_t switch_id,_In_ uint32_t attr_count,_In_ const sai_attribute_t *attr_list);

##### (ii) This API is to remove the same.
typedef sai_status_t (*sai_remove_port_connector_fn)(_In_ sai_object_id_t port_connector_id);

##### (iii) This API is to set port connector attribute value
typedef sai_status_t (*sai_set_port_connector_attribute_fn)(_In_ sai_object_id_t port_connector_id,_In_ const sai_attribute_t *attr);

##### (iv) This API is to get port connector attribute value
typedef sai_status_t (*sai_get_port_connector_attribute_fn)( _In_ sai_object_id_t port_connector_id,_In_ uint32_t attr_count, _Inout_ sai_attribute_t *attr_list);

The required enums like _sai_port_interface_type_t, _sai_port_connector_attr_t for the above APIs are also added in saiport.h

#### (b) saiswitch.h

##### (i) This API provides platform adaption functionality to access device registers from driver. 
This is mandatory to pass as attribute to sai_create_switch when driver implementation does not support register access by device file system directly.		
typedef sai_status_t (*sai_switch_register_read_fn)( _In_ uint64_t platform_context, _In_ uint32_t device_addr,_In_ uint32_t start_reg_addr,_In_ uint32_t number_of_registers,_Out_ uint32_t *reg_val);

##### (ii) This API provides platform adaption device write callback function passed to the adapter. 
This is mandatory function for driver when device access not supported by file system.	
typedef sai_status_t (*sai_switch_register_write_fn)(_In_ uint64_t platform_context,_In_ uint32_t device_addr,_In_ uint32_t start_reg_addr,_In_ uint32_t number_of_registers,_In_ const uint32_t *reg_val);

##### (iii) This API provides read access API for devices connected to MDIO from NPU SAI.
typedef sai_status_t (*sai_switch_mdio_read_fn)(_In_ sai_object_id_t switch_id,_In_ uint32_t device_addr,_In_ uint32_t start_reg_addr,_In_ uint32_t number_of_registers,_Out_ uint32_t *reg_val);

##### (iv) This API provides write access API for devices connected to MDIO from NPU SAI
typedef sai_status_t (*sai_switch_mdio_write_fn)(_In_ sai_object_id_t switch_id,_In_ uint32_t device_addr,_In_ uint32_t start_reg_addr,_In_ uint32_t number_of_registers,_In_ const uint32_t *reg_val);	
	
The required enums like _sai_switch_hardware_access_bus_t, _sai_switch_firmware_load_method_t, _sai_switch_firmware_load_type_t, _sai_switch_type_t for the above APIs are also added in saiswitch.h. 
The enum "sai_switch_attr_t" is also updated to reflect these changes.

#### (c) saitypes.h
Added SAI_OBJECT_TYPE_PORT_CONNECTOR to enum sai_object_type_t.


## 3. Virtual Output Queue(VOQ) Feature (#1081) 

An Integrated VOQ Switch is a system consisting of several Line cards populated with Switch devices and Fabric Cards populated with Fabric devices. The Line Cards switches are connected to network ports on one side and to the Fabric devices on the other side. The Fabric device provides full connectivity between all switch devices. A Clos network is a typical example.
SAI has been ehnaced to support this feature by doing the following changes

(1) Modifying SAI switch attributes to pass chassis specific information to provide a system identifier, the number of total cores in the chassis information
(2) A new Port object subtype "Fabric-Port" for fabric facing ports of the Switch and the ports of the Fabric device.
(3) A new SAI object "System-Ports",representing network or CPU ports in the switch . 
(4) Supporting 3 separate lists of ports: Local Network ports, System-Ports(all NW ports, own ports & all CPU ports), and Fabric-Ports. 
(5) In a VoQ Switch, the SAI_QUEUE_TYPE_UNICAST object refers to the Egress Queues. While the ingress VoQs use the sub-type SAI_QUEUE_TYPE_UNICAST_VOQ.
(6) A System-Port comprises the identification of its location in the chassis – Device-ID, Core-Index, and Local-Core-Port-ID, and a list of VoQs, corresponding to the Traffic Classes.
(7) Each VoQ is associated with a WRED-Profile. Typically Drop and Color statistics are applied to the VoQs (rather than the Egress Queues)
Fabric port is associated with one to three TX- Fabric-Queues,whose IDs are the object handles for statistics collection.

#### New SAI APIs:
System port support - A new file saisystemport.h is added with following SAI APIs for create/remove, set/get system port.
typedef sai_status_t (*sai_create_system_port_fn)(_Out_ sai_object_id_t *system_port_id, _In_ sai_object_id_t switch_id, _In_ uint32_t attr_count,  _In_ const sai_attribute_t *attr_list);
typedef sai_status_t (*sai_remove_system_port_fn)(_In_ sai_object_id_t system_port_id);
typedef sai_status_t (*sai_set_system_port_attribute_fn)(_In_ sai_object_id_t system_port_id,  _In_ const sai_attribute_t *attr);
typedef sai_status_t (*sai_get_system_port_attribute_fn)(_In_ sai_object_id_t system_port_id, _In_ uint32_t attr_count, _Inout_ sai_attribute_t *attr_list);

#### Corresponding changes required in following attrbutes are also added. 
(a) Switch Configuration Info (SAI_SWITCH_ATTR_TYPE, SAI_SWITCH_ATTR_SWITCH_ID, SAI_SWITCH_ATTR_MAX_SYSTEM_CORES, SAI_SWITCH_ATTR_SYSTEM_PORT_CONFIG_LIST, SAI_SWITCH_ATTR_SYSTEM_PORT_LIST, SAI_SWITCH_ATTR_FABRIC_PORT_LIST),
(b) Switch Statistics
(c) Port Attributes, New Port Type(SAI_PORT_TYPE_FABRIC), Port to System Port Mapping, Fabric Port Connectivity/Reachability/Error Status Attributes, SAI_OBJECT_TYPE_LAG, New Ports Stats.
(d) Queue Attributes, New Queue Type, VoQ Attributes, Fabric Queue Attributes, Modification to queue stats.
(e) New Router Interface Attribute
(f) New Neighbor Entry Attributes
(g) New ACL functionality
(h) New Mirror Functionality

For further details refer https://github.com/opencomputeproject/SAI/blob/master/doc/VoQ/SAI-Proposal-VoQ-Switch.md


## 4. MPLS SAI Changes

### 1) MPLS Host-If traps for packets with expiring TTL and Router Alert Label (#1062) 
Added MPLS SAI_HOSTIF_USER_DEFINED_TRAP_TYPE_INSEG_ENTRY in enum sai_hostif_trap_type_t for saihostif.h file.

### 2) Add new hash fields for MPLS labels (#1058) 
new object ids for new hash field SAI_NATIVE_HASH_FIELD_MPLS_LABEL_ALL (with Label 1 to 4) has been added in enum sai_native_hash_field_t for saihash.h file.

### 3) MPLS QOS Maps (#1060) 
SAI has a QoS map for mapping DSCP to traffic class and to color. SAI also has a QoS map for mapping traffic class and color to DSCP. A similar QoS map is required for MPLS traffic. MPLS traffic carries a 3-bit QoS field in MPLS headers called "EXP". A map is needed to associate a traffic class to an MPLS packet based on EXP field in the top label.
Added SAI_PORT_ATTR_QOS_MPLS_EXP_TO_TC_MAP, SAI_PORT_ATTR_QOS_MPLS_EXP_TO_COLOR_MAP and SAI_PORT_ATTR_QOS_TC_AND_COLOR_TO_MPLS_EXP_MAP are added in enum sai_port_attr_t for saiport.h file.
SAI_QOS_MAP_TYPE_MPLS_EXP_TO_TC, SAI_QOS_MAP_TYPE_MPLS_EXP_TO_COLOR and SAI_QOS_MAP_TYPE_TC_AND_COLOR_TO_MPLS_EXP are added in enum sai_qos_map_type_t for saiqosmap.h file.
SAI_SWITCH_ATTR_QOS_MPLS_EXP_TO_TC_MAP, SAI_SWITCH_ATTR_QOS_MPLS_EXP_TO_COLOR_MAP and SAI_SWITCH_ATTR_QOS_TC_AND_COLOR_TO_MPLS_EXP_MAP in enum sai_switch_attr_t for saiswitch.h file. 
MPLS exp value sai_uint8_t mpls_exp has been added in struct sai_qos_map_params_t 

### 4) MPLS ACL filters (#1064) 
Packets can be filtered based on their contents. Added support to filter MPLS packets based on their contents. Each MPLS packet contains a list of one or more MPLS label. Following ACL table attributes and ACL table entries to filter MPLS packets are added. 
a) SAI_ACL_TABLE_ATTR_FIELD_MPLS_LABEL0_LABEL, SAI_ACL_TABLE_ATTR_FIELD_MPLS_LABEL0_TTL, SAI_ACL_TABLE_ATTR_FIELD_MPLS_LABEL0_BOS ( for Label 0 to 4) are added in enum sai_acl_table_attr_t 
b) SAI_ACL_ENTRY_ATTR_FIELD_MPLS_LABEL0_LABEL, SAI_ACL_ENTRY_ATTR_FIELD_MPLS_LABEL0_TTL, SAI_ACL_ENTRY_ATTR_FIELD_MPLS_LABEL0_EXP, SAI_ACL_ENTRY_ATTR_FIELD_MPLS_LABEL0_BOS ( for Label 0 to 4) are added in enum sai_acl_entry_attr_t in saiacl.h file. 

### 5)Provide TTL and QoS treatment during MPLS encap and decap (#1079) 
This change is to define TTL and its setting for PHP or POP and MPLS Outsegment TTL value for pipe/exp mode.Following changes are done to support the same. 
a) Modified enum sai_inseg_entry_pop_ttl_mode_t, enum sai_inseg_entry_pop_qos_mode_t enum sai_inseg_entry_attr_t in saimpls.h
b) Modified enum sai_next_hop_attr_t for sainexthop.h 
e) Added new enum sai_outseg_type_t, sai_outseg_ttl_mode_t and sai_outseg_exp_mode_t in saitypes.h


## 5. Additional SAI Changes

### Added bulk apis for fdb_entry in sai_fdb_api_t (#1018)
(a) Bulk create FDB entry
typedef sai_status_t (*sai_bulk_create_fdb_entry_fn)( _In_ uint32_t object_count,_In_ const sai_fdb_entry_t *fdb_entry,_In_ const uint32_t *attr_count,_In_ const sai_attribute_t **attr_list,_In_ sai_bulk_op_error_mode_t mode,_Out_ sai_status_t *object_statuses);

(b) Bulk remove FDB entry
typedef sai_status_t (*sai_bulk_remove_fdb_entry_fn)(_In_ uint32_t object_count,_In_ const sai_fdb_entry_t *fdb_entry,_In_ sai_bulk_op_error_mode_t mode,_Out_ sai_status_t *object_statuses);
		
(c) Bulk set attribute on FDB entry		
typedef sai_status_t (*sai_bulk_set_fdb_entry_attribute_fn)(_In_ uint32_t object_count,_In_ const sai_fdb_entry_t *fdb_entry,_In_ const sai_attribute_t *attr_list,_In_ sai_bulk_op_error_mode_t mode,_Out_ sai_status_t *object_statuses);

(d)  Bulk get attribute on FDB entry
typedef sai_status_t (*sai_bulk_get_fdb_entry_attribute_fn)(_In_ uint32_t object_count,_In_ const sai_fdb_entry_t *fdb_entry,_In_ const uint32_t *attr_count,_Inout_ sai_attribute_t **attr_list,_In_ sai_bulk_op_error_mode_t mode,_Out_ sai_status_t *object_statuses);


### Set/get bulk functions typedefs for oid objects (#1028) 
Following new SAI APIs are added for bulk object set/get attributes. 
sai_status_t (*sai_bulk_object_set_attribute_fn)(_In_ uint32_t object_count,_In_ const sai_object_id_t *object_id,_In_ const sai_attribute_t *attr_list, _In_ sai_bulk_op_error_mode_t mode, _Out_ sai_status_t *object_statuses);
sai_status_t (*sai_bulk_object_get_attribute_fn)( _In_ uint32_t object_count, _In_ const sai_object_id_t *object_id, _In_ const uint32_t *attr_count,  _Inout_ sai_attribute_t **attr_list, _In_ sai_bulk_op_error_mode_t mode, _Out_ sai_status_t *object_statuses);


### RO Attr (switch obj) to get a list of supported obj types (#989)
A new RO attribute to switch object that returns the list of supported object types that the underlying SAI adapter can support. This allows the clients of SAI to understand the abilities of the underlying silicon as well as the SAI adapter to support the SAI feature set.
SAI_SWITCH_ATTR_SUPPORTED_OBJECT_TYPE_LIST is added to the enum "sai_switch_attr_t" to specify the list of object types (sai_object_type_t) that the SAI adapter can support in saiswitch.h


### Improve debug counter enums (#1006)
 (a) Add START and END attributes for drop reason enums like SAI_IN_DROP_REASON_START & SAI_IN_DROP_REASON_END to enum sai_in_drop_reason_t in saidebugcounter.h
 (b) Add additional port stats for debug dropped packet counters like SAI_PORT_STAT_IN_CONFIGURED_DROP_REASONS_0_DROPPED_PKTS and SAI_PORT_STAT_OUT_CONFIGURED_DROP_REASONS_0_DROPPED_PKTS (index 0 to index 7) in sai_port_stat_t in saiport.h
 (c) Add additional switch stats for "in" and "out" debug counters like SAI_SWITCH_STAT_IN_CONFIGURED_DROP_REASONS_0_DROPPED_PKTS and SAI_SWITCH_STAT_OUT_CONFIGURED_DROP_REASONS_0_DROPPED_PKTS (index 0 to index 7) in sai_switch_stat_t.


### SERDES ATTRIBUTE APIs (#1002)
Defined new Serdes attributes. The new serdes range is reserved so that in future the attributes can be extended to include new settings in the future.
New object type SAI_OBJECT_TYPE_PORT_SERDES added to sai_object_type_t in saitypes.h
Added SAI_PORT_ATTR_PORT_SERDES_ID to sai_port_attr_t in saiport.h, created typedef for enum sai_port_serdes_attr_t and following new SAI APIs are added.
(a) typedef sai_status_t (*sai_create_port_serdes_fn)(_Out_ sai_object_id_t *port_serdes_id,_In_ sai_object_id_t switch_id,_In_ uint32_t attr_count,_In_ const sai_attribute_t *attr_list);
(b) typedef sai_status_t (*sai_remove_port_serdes_fn)(_In_ sai_object_id_t port_serdes_id);
(c) typedef sai_status_t (*sai_set_port_serdes_attribute_fn)(_In_ sai_object_id_t port_serdes_id,_In_ const sai_attribute_t *attr);
(d) typedef sai_status_t (*sai_get_port_serdes_attribute_fn)(_In_ sai_object_id_t port_serdes_id,_In_ uint32_t attr_count,_Inout_ sai_attribute_t *attr_list);


### Introduce buffer pool type SAI_BUFFER_POOL_TYPE_BOTH (#986)
SAI_BUFFER_POOL_TYPE_BOTH has been added to sai_buffer_pool_type_t in saibuffer.h. SAI_BUFFER_POOL_TYPE_BOTH indicates the buffer pool specification encompasses both ingress characterization and egress characterization.


### Add support for ACLs to match TAM/INT packets. (#1011)
SAI_ACL_TABLE_ATTR_FIELD_TAM_INT_TYPE is added to enum sai_acl_table_attr_t and SAI_ACL_ENTRY_ATTR_FIELD_TAM_INT_TYPE is added to enum sai_acl_entry_attr_t in saiacl.h


### Add link training failure status, prbs config, an status in saiport.h (#1019)
Enums sai_port_link_training_failure_status_t, sai_port_prbs_config_t added in saiport.h 
Enum sai_port_attr_t is enhanced with new attributes SAI_PORT_ATTR_LINK_TRAINING_FAILURE_STATUS, SAI_PORT_ATTR_PRBS_CONFIG, SAI_PORT_ATTR_PRBS_LOCK_STATUS, SAI_PORT_ATTR_PRBS_LOCK_LOSS_STATUS & SAI_PORT_ATTR_AUTO_NEG_STATUS
Enum sai_port_stat_t is enhanced to add new stat for SAI_PORT_STAT_PRBS_ERROR_COUNT


### SAI_PORT_ATTR_LINK_TRAINING_RX_STATUS attribute (#1027) 
Status to specify whether the receiver is trained or not trained to receive data has been added with object SAI_PORT_ATTR_LINK_TRAINING_RX_STATUS in saiport.h file


### Add nat type in sai_nat_entry (#1042) 
This change adds nat type in sai_nat_entry_t to distinguish between dnat pool and dnat entry. Its possible that for dnat pool and dnat entry all the key/attributes are same and in this case ASIC redis DB rejects the update as duplicate. NAT type will help distinguish two of them.
Added sai_nat_type_t to sai_nat_entry_t in sainat.h.


### Improved support for p2p tunnels by adding destination IP (#1025)
As of SAI version 1.5 the “tunnel” has a p2mp connotation. It holds the VTEP SIP whereas there is no DIP. The DIP is specified as part of the FDB entry or as part of Next Hop entry.As part of this change DIP is added to the sai_tunnel_attr_t structure as an optional parameter. 
Added SAI_TUNNEL_PEER_MODE_P2P, SAI_TUNNEL_PEER_MODE_P2MP in enum sai_tunnel_decap_ecn_mode_t and SAI_TUNNEL_ATTR_PEER_MODE and SAI_TUNNEL_ATTR_ENCAP_DST_IP in enum sai_tunnel_attr_t in saitunnel.h file.


### Enable/Disable decrement ttl support for port, rif and nexthop (#1050) 
This is to add attributes to port, RIF, nexthop and to ACL to support enabling and disabling ttl decrement to provide more granularity.
Added SAI_NEXT_HOP_ATTR_DECREMENT_TTL in enum  sai_next_hop_attr_t and SAI_PORT_ATTR_DECREMENT_TTL in enum sai_port_attr_t and SAI_ROUTER_INTERFACE_ATTR_DECREMENT_TTL in enum sai_router_interface_attr_t in sairouterinterface.h file.


### Add queue index to hostif packet attribute (#1049) 
This PR is to add an attribute to sai_hostif_packet_attr_t to set the egress queue index for callbacks and when the tx mode is set to TX_BYPASS.
Added SAI_HOSTIF_PACKET_ATTR_EGRESS_QUEUE_INDEX in enum sai_hostif_packet_attr_t in saihostif.h file.


### Fine-grained and ordered ECMP types (#1070) 
Currently, SAI_NEXT_HOP_GROUP_ATTR_NEXT_HOP_COUNT is a READ_ONLY attribute. To support this, it is modified for the property of the attribute.  Added SAI_NEXT_HOP_GROUP_TYPE_ECMP was removed and SAI_NEXT_HOP_GROUP_TYPE_DYNAMIC_UNORDERED_ECMP, SAI_NEXT_HOP_GROUP_TYPE_ECMP = SAI_NEXT_HOP_GROUP_TYPE_DYNAMIC_UNORDERED_ECMP, SAI_NEXT_HOP_GROUP_TYPE_DYNAMIC_ORDERED_ECMP, and SAI_NEXT_HOP_GROUP_TYPE_FINE_GRAIN_ECMP in enum sai_next_hop_group_type_t
SAI_NEXT_HOP_GROUP_ATTR_REAL_SIZE is added in enum sai_next_hop_group_attr_t and  SAI_NEXT_HOP_GROUP_MEMBER_ATTR_INDEX and SAI_NEXT_HOP_GROUP_MEMBER_ATTR_SEQUENCE_ID where added in enum sai_next_hop_group_member_attr_t for sainexthopgroup.h file.


### Support for static FDB Entries to allow MAC Move (#1024) 
This change is for the SAI attribute to allow the hardware to learn the MAC even though the MAC is programmed as static.
Added SAI_FDB_ENTRY_ATTR_ALLOW_MAC_MOVE in enum sai_fdb_entry_attr_t in saifdb.h file.


### Create/Set for Tunnel Attributes (#1086) 
Prior to the change, tunnel attributes were "create only". But tunnel attribues can change at run time and hence "set" operation support is added. 
Modified flags CREATE_AND_SET for SAI_TUNNEL_ATTR_ENCAP_TTL_MODE, SAI_TUNNEL_ATTR_ENCAP_DSCP_MODE and SAI_TUNNEL_ATTR_DECAP_TTL_MODE and SAI_TUNNEL_ATTR_DECAP_DSCP_MODE in enum sai_tunnel_attr_t in saitunnel.h file. 


### Add Enterprise Number for IPFIX Report Type (#1072) 
For SAI, Enterprise number is a configurable attribute for IPFIX reports.This is acheived by enabling checksum/enterprise number/transport mirror session. Modified  enum sai_tam_int_attr_t and enum sai_tam_report_attr_t and enum sai_tam_transport_type_t in saitam.h


### Add IPv6 NS and NA two new Traps (#1092) 
For IPv6 neighbor solicitation and advertisement with SAI_HOSTIF_TRAP_TYPE_IPV6_NEIGHBOR_SOLICITATION and SAI_HOSTIF_TRAP_TYPE_IPV6_NEIGHBOR_ADVERTISEMENT are addded in enum sai_hostif_trap_type_t in file saihostif.h


### ACL GRE key match (#1076) 
Support for matching the GRE key in ACL is added. GRE key is dedicated for GRE packets; the VNI key should not be used for matching on GRE packets or NVGRE packets. 
SAI_ACL_TABLE_ATTR_FIELD_GRE_KEY is added to enum _sai_acl_table_attr_t and SAI_ACL_ENTRY_ATTR_FIELD_GRE_KEY is added to enum _sai_acl_entry_attr_t in saiacl.h.


### TPID Port Attribute Support (#1089) 
Support to configure the TPID (Tag Protocol Identifier- vlan header) for matching it against the ingress packets and to add it for egress packets has been added. 
Attribute SAI_PORT_ATTR_TPID is added to enum sai_port_attr_t in saiport.h and SAI_LAG_ATTR_TPID is added to enum _sai_lag_attr_t in sailag.h.
