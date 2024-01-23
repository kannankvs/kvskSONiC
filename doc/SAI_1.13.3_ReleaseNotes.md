# SAI 1.13.3 Release Notes

The Switch Abstraction Interface(SAI) defines the APIs to provide a vendor-independent way of controlling forwarding elements, such as a switching ASIC, an NPU or a software switch in a uniform manner. This release document covers the SAI API changes from SAI tag 1.12.0 to SAI tag 1.13.3. The previous release notes corresponding to SAI tag 1.12.0 is available at [SAI 1.12.0 release notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.12.0_ReleaseNotes.md) 

This document explains the new SAI features as well as the enhancements and the bug fixes on existing features. 


### List of enhancements added in this release: 

CRM for DASH - [1785](https://github.com/opencomputeproject/SAI/pull/1785) <br> 
Add hostif trap for HTTP - [1789](https://github.com/opencomputeproject/SAI/pull/1789) <br> 
Fix experimental header files not found issue when building libsaithrift-dev - [1794](https://github.com/opencomputeproject/SAI/pull/1794) <br> 
udpate sai<>thrift conversion and sanity cehck with u16range list and ip prefix list  - [1797](https://github.com/opencomputeproject/SAI/pull/1797) <br> 
WRED values for large buffer size systems - [1791](https://github.com/opencomputeproject/SAI/pull/1791) <br> 
Chained ACL - [1787](https://github.com/opencomputeproject/SAI/pull/1787) <br> 
Add api for clear buffer pool watermark - [1804](https://github.com/opencomputeproject/SAI/pull/1804) <br> 
Fixed includes in experimental headers - [1805](https://github.com/opencomputeproject/SAI/pull/1805) <br> 
Notification NOS running SAI and SDK, about HW/FW failures - [1777](https://github.com/opencomputeproject/SAI/pull/1777) <br> 
Add OPER_FEC attribute - [1801](https://github.com/opencomputeproject/SAI/pull/1801) <br> 
Add bulk Nexthop APIs. - [1798](https://github.com/opencomputeproject/SAI/pull/1798) <br> 
Fixes for running DASH PTF tests - [1813](https://github.com/opencomputeproject/SAI/pull/1813) <br> 
ACL Chain Capability Attribute - [1815](https://github.com/opencomputeproject/SAI/pull/1815) <br> 
VoQ Switch Isolation - [1793](https://github.com/opencomputeproject/SAI/pull/1793) <br> 
Fix serialize/deseralize functions in SAI meta - [1807](https://github.com/opencomputeproject/SAI/pull/1807) <br> 
DASH metering policies - [1819](https://github.com/opencomputeproject/SAI/pull/1819) <br> 
Tunnel Term Attributes validation fixed for all MP2P and MP2MP attributes - [1799](https://github.com/opencomputeproject/SAI/pull/1799) <br> 
Update .gitignore - [1835](https://github.com/opencomputeproject/SAI/pull/1835) <br> 
support independent module - [1824](https://github.com/opencomputeproject/SAI/pull/1824) <br> 
Add inner src and dst mac fields to ACL - [1828](https://github.com/opencomputeproject/SAI/pull/1828) <br> 
Tunnel Term Types - [](fixed the description for types and validity checks for mask attributes - [1848](https://github.com/opencomputeproject/SAI/pull/1848) <br> 
Add Priority for Tunnel Term Table Entries - [1849](https://github.com/opencomputeproject/SAI/pull/1849) <br> 
SAI attributes for path tracing for midpoint node . - [1841](https://github.com/opencomputeproject/SAI/pull/1841) <br> 
Support for reading RX_FREQUENCY_OFFSET_PPM, RX_SNR and FEC_CORRECTED_BITS with SAI - [1847](https://github.com/opencomputeproject/SAI/pull/1847) <br> 
Use meta Doxygen file to generate documentation - [1874](https://github.com/opencomputeproject/SAI/pull/1874) <br> 
Modified the base class to fix the function issue. Function was adding all port as untag ports when passed tag mode = tagged - [1877](https://github.com/opencomputeproject/SAI/pull/1877) <br> 
Added file for Marvell specific functions - [1871](https://github.com/opencomputeproject/SAI/pull/1871) <br> 
Modified the file to fix KeyError: 'None' issue - [1872](https://github.com/opencomputeproject/SAI/pull/1872) <br> 
update test/saithriftv2/Makefile - [1825](https://github.com/opencomputeproject/SAI/pull/1825) <br> 
Build meta rpc via az pipeline - [1875](https://github.com/opencomputeproject/SAI/pull/1875) <br> 
Add support for TWAMP-LIGHT API - [1786](https://github.com/opencomputeproject/SAI/pull/1786) <br> 
CRM for ECMP and VOQ System - [1883](https://github.com/opencomputeproject/SAI/pull/1883) <br> 
PCS data-path select attribute added - [1816](https://github.com/opencomputeproject/SAI/pull/1816) <br> 
Refactor saithriftv2 Makefile - [1881](https://github.com/opencomputeproject/SAI/pull/1881) <br> 
Fix permissions on executable and non executable files - [1884](https://github.com/opencomputeproject/SAI/pull/1884) <br> 
Revert "Tunnel Term Attributes validation fixed for all MP2P and MP2MP attributes" - [1890](https://github.com/opencomputeproject/SAI/pull/1890) <br> 
Allow null on SAI_PORT_ATTR_PORT_SERDES_ID - [1914](https://github.com/opencomputeproject/SAI/pull/1914) <br> 
Added saithrift support to return sai_object_id for a given system_port_id and read VOQ counters for system port - [1931](https://github.com/opencomputeproject/SAI/pull/1931)