# SAI 1.10.2 Release Notes

The Switch Abstraction Interface(SAI) defines the APIs to provide a vendor-independent way of controlling forwarding elements, such as a switching ASIC, an NPU or a software switch in a uniform manner. This release document covers the SAI API changes from SAI tag 1.9.1 to SAI tag 1.10.2. The previous release notes corresponding to SAI tag 1.9.1 is available at [SAI 1.9.1 release notes](https://github.com/opencomputeproject/SAI/blob/master/doc/SAI_1.9.1_ReleaseNotes.md) 

This document explains the new SAI features as well as the enhancements and the bug fixes on existing features. 


### PFC Deadlock SAI attribute additions

This attribute represents the queue internal hardware PFC deadlock state. It is an aggregation of all HW state used to determine if a queue is in PFC deadlock. This attribute should only be queried as part of the PFC deadlock and recovery detection processing. This attribute returns an enum indicating that the queue is not PFC paused, is PFC pause or is PFC paused but not for the whole polling interval time.  This is different from the SAI_QUEUE_ATTR_PAUSE_STATUS which only provides an instantaneous status of PFC on a queue. 

````````````````
saiport.h

 /**
     * @brief  PFC Deadlock Detection timer interval range
     *
     * @type sai_u32_range_t
     * @flags READ_ONLY
     */
    SAI_PORT_ATTR_PFC_TC_DLD_INTERVAL_RANGE,

    /**
     * @brief PFC Deadlock Detection timer interval in milliseconds.
     *
     * If the monitored queue is in XOFF state for more than this duration then
     * its considered to be in a PFC deadlock state and recovery process is kicked off.
     * Note: Use TC (Traffic Class) value as key and timer interval as value.
     *
     * @type sai_map_list_t
     * @flags CREATE_AND_SET
     * @default empty
     */
    SAI_PORT_ATTR_PFC_TC_DLD_INTERVAL,

    /**
     * @brief  PFC Deadlock Recovery timer interval range
     *
     * @type sai_u32_range_t
     * @flags READ_ONLY
     */
    SAI_PORT_ATTR_PFC_TC_DLR_INTERVAL_RANGE,

    /**
     * @brief PFC Deadlock Recovery timer interval in milliseconds.
     *
     * The PFC deadlock recovery process will run for this amount of time and then normal
     * state will resume. If the system remains in a deadlock state then the detection and
     * recovery will resume again after the configured detection timer interval.
     * Note: Use TC (Traffic Class) value as key and timer interval as value.
     *
     * @type sai_map_list_t
     * @flags CREATE_AND_SET
     * @default empty
     */
    SAI_PORT_ATTR_PFC_TC_DLR_INTERVAL,
	
````````````````	
````````````````	

saiqueue.h

/**
 * @brief Enum defining queue PFC continuous deadlock state.
 */
typedef enum _sai_queue_pfc_continuous_deadlock_state_t
{
    /**
     * @brief PFC continuous deadlock state not paused.
     *
     * H/w queue PFC state is not paused.
     * Queue can forward packets.
     */
    SAI_QUEUE_PFC_CONTINUOUS_DEADLOCK_STATE_NOT_PAUSED = 0x00000000,

    /**
     * @brief PFC continuous deadlock state paused.
     *
     * H/w queue is paused off and has not resumed or
     * forwarded packets since the last time the
     * SAI_QUEUE_ATTR_PFC_CONTINUOUS_DEADLOCK_STATE
     * attribute for this queue was polled.
     */
    SAI_QUEUE_PFC_CONTINUOUS_DEADLOCK_STATE_PAUSED = 0x00000001,

    /**
     * @brief PFC continuous deadlock state paused, but not continuously.
     *
     * H/w queue is paused off, but was not paused
     * off for the full interval that the
     * SAI_QUEUE_ATTR_PFC_CONTINUOUS_DEADLOCK_STATE
     * attribute for this queue was last polled.
     */
    SAI_QUEUE_PFC_CONTINUOUS_DEADLOCK_STATE_PAUSED_NOT_CONTINUOUS = 0x00000002

} sai_queue_pfc_continuous_deadlock_state_t;



/**
     * @brief Control for buffered and incoming packets on a queue undergoing PFC Deadlock Recovery.
     *
     * This control applies to all packets on the queue.
     *
     * @type sai_packet_action_t
     * @flags CREATE_AND_SET
     * @default SAI_PACKET_ACTION_DROP
     */
    SAI_QUEUE_ATTR_PFC_DLR_PACKET_ACTION,

    /**
     * @brief Queue PFC continuous deadlock state
     *
     * This attribute represents the queue's internal hardware PFC
     * continuous deadlock state. It is an aggregation of all HW state used
     * to determine if a queue is in PFC deadlock based on state
     * cached/maintained by the SDK. Consecutive queries of this
     * attribute provide the PFC state for the queue for the interval
     * period between the queries.
     *
     * This attribute should only be queried as part of the PFC deadlock
     * and recovery detection processing.
     *
     * @type sai_queue_pfc_continuous_deadlock_state_t
     * @flags READ_ONLY
     */
    SAI_QUEUE_ATTR_PFC_CONTINUOUS_DEADLOCK_STATE,

    /**

````````````````
The PR related to this feature is available at PR#[1332](https://github.com/opencomputeproject/SAI/pull/1332)


### Get Bulk Stats API

This API introduces ability to query bulk stats for an object list. Return counter buffer is populated in the same order as the counter id for each object in a list. Since same counter ids are applicable to all objects in the list, objects in the object list need to be of the same type. This is consistent with other bulk APIs. 

````````````````
saiobject.h

/**
 * @brief Bulk objects get statistics.
 *
 * @param[in] switch_id SAI Switch object id
 * @param[in] object_type Object type
 * @param[in] object_count Number of objects to get the stats
 * @param[in] object_key List of object keys
 * @param[in] number_of_counters Number of counters in the array
 * @param[in] counter_ids Specifies the array of counter ids
 * @param[in] mode Statistics mode
 * @param[inout] object_statuses Array of status for each object. Length of the array should be object_count. Should be looked only if API return is not SAI_STATUS_SUCCESS.
 * @param[out] counters Array of resulting counter values.
 *    Length of counters array should be object_count*number_of_counters.
 *    Counter value of I object and J counter_id = counter[I*number_of_counters + J]
 *
 * @return #SAI_STATUS_SUCCESS on success, failure status code on error
 
 */
sai_status_t sai_bulk_object_get_stats(
        _In_ sai_object_id_t switch_id,
        _In_ sai_object_type_t object_type,
        _In_ uint32_t object_count,
        _In_ const sai_object_key_t *object_key,
        _In_ uint32_t number_of_counters,
        _In_ const sai_stat_id_t *counter_ids,
        _In_ sai_stats_mode_t mode,
	    _Inout_ sai_status_t *object_statuses,
        _Out_ uint64_t *counters);
		
	/**
 * @brief Bulk objects clear statistics.
 *
 * @param[in] switch_id SAI Switch object id
 * @param[in] object_type Object type
 * @param[in] object_count Number of objects to get the stats
 * @param[in] object_key List of object keys
 * @param[in] number_of_counters Number of counters in the array
 * @param[in] counter_ids Specifies the array of counter ids
 * @param[in] mode Statistics mode
 * @param[inout] object_statuses Array of status for each object. Length of the array should be object_count. Should be looked only if API return is not SAI_STATUS_SUCCESS.
 *
 * @return #SAI_STATUS_SUCCESS on success, failure status code on error
 */
sai_status_t sai_bulk_object_clear_stats(
        _In_ sai_object_id_t switch_id,
        _In_ sai_object_type_t object_type,
        _In_ uint32_t object_count,
        _In_ const sai_object_key_t *object_key,
        _In_ uint32_t number_of_counters,
        _In_ const sai_stat_id_t *counter_ids,
        _In_ sai_stats_mode_t mode,
		_Inout_ sai_status_t *object_statuses);

/**

````````````````
````````````````

saitypes.h

 /**
     * @brief Bulk read statistics
     */
    SAI_STATS_MODE_BULK_READ = 1 << 2,
	
    /**
     * @brief Bulk clear statistics
     */

    /**
     * @brief Bulk read and clear after reading
     */
    SAI_STATS_MODE_BULK_READ_AND_CLEAR = 1 << 4,

````````````````
The PR related to this feature is available at PR#[1352](https://github.com/opencomputeproject/SAI/pull/1352)


### Add SAI_MIRROR_SESSION_ATTR_COUNTER_ID

Adding New Attribute SAI_MIRROR_SESSION_ATTR_COUNTER_ID. This attribute allows us to use the existing SAI_OBJECT_TYPE_COUNTER with mirror sessions. This is the same functionality that exists for various other SAI types - saineighbor, sainexthop, etc.

````````````````

saimirror.h

/**
     * @brief Attach a counter
     *
     * SAI_COUNTER_STAT_PACKETS reflects the total number of packets mirrored.
     *
     * SAI_COUNTER_STAT_BYTES reflects the total number of bytes mirrored, after
     * truncation, including headers.
     *
     * @type sai_object_id_t
     * @flags CREATE_AND_SET
     * @objects SAI_OBJECT_TYPE_COUNTER
     * @allownull true
     * @default SAI_NULL_OBJECT_ID
     */
    SAI_MIRROR_SESSION_ATTR_COUNTER_ID,

    /**
	
````````````````

The PR related to this feature is available at PR#[1352](https://github.com/opencomputeproject/SAI/pull/1354)


### SAI NAT aging notification

In the Hit Bit query mechanism described in [SAI NAT API](https://github.com/opencomputeproject/SAI/blob/master/doc/NAT/SAI-NAT-API.md), the NOS periodically polls the NAT entries for aging out unused entries. In a highly scaled environment with tens of thousands of NAT entries programmed, the frequent polling for aging out is not performant. An alternative is to use a callback from SAI to notify NOS about the NAT entries that are aged out after a certain time.

The NOS registers a callback named sai_nat_event_notification_fn through the switch attribute SAI_SWITCH_ATTR_NAT_EVENT_NOTIFY.

The NOS then create/sets the NAT entry with the optional attribute SAI_NAT_ENTRY_ATTR_AGING_TIME.

nat_entry_attr[0].id = SAI_NAT_ENTRY_ATTR_AGING_TIME;
nat_entry_attr[0].value.u32 = aging_time; // in seconds

If the attribute is not added the NAT entry does not age out. If the aging time is specified as 0, the NAT entry does not age out. The aging time configured can be queried using a GET request of this attribute.

Once the NAT entry ages out, SAI notifies NOS using sai_nat_event_notification_fn callback. This callback provides events of type sai_nat_event_notification_data_t which has information about the specific NAT entries that got aged out. The NOS uses the NAT entry information to delete these NAT entries.

````````````````
sainat.h

/**
     * @brief NAT entry aging time in seconds
     *
     * Zero means aging is disabled.
     *
     * @type sai_uint32_t
     * @flags CREATE_AND_SET
     * @default 0
     */
    SAI_NAT_ENTRY_ATTR_AGING_TIME,

    /**
	
/**
 * @brief NAT event type
 */
typedef enum _sai_nat_event_t
{
    /** NAT entry event none */
    SAI_NAT_EVENT_NONE,

    /** NAT entry event aged */
    SAI_NAT_EVENT_AGED,

} sai_nat_event_t;

/**
 * @brief Notification data format received from SAI NAT callback
 *
 * @count attr[attr_count]
 */
typedef struct _sai_nat_event_notification_data_t
{
    /** Event type */
    sai_nat_event_t event_type;

    /** NAT entry */
    sai_nat_entry_t nat_entry;

} sai_nat_event_notification_data_t;

/**

/**
 * @brief NAT notifications
 *
 * @count data[count]
 *
 * @param[in] count Number of notifications
 * @param[in] data Pointer to NAT event notification data array
 */
typedef void (*sai_nat_event_notification_fn)(
        _In_ uint32_t count,
        _In_ const sai_nat_event_notification_data_t *data);

/**

````````````````
````````````````
saiswitch.h

    /**
     * @brief NAT event notification callback function passed to the adapter.
     *
     * Use sai_nat_event_notification_fn as notification function.
     *
     * @type sai_pointer_t sai_nat_event_notification_fn
     * @flags CREATE_AND_SET
     * @default NULL
     */
    SAI_SWITCH_ATTR_NAT_EVENT_NOTIFY,

    /**

````````````````

The PR related to this feature is available at PR#[1365](https://github.com/opencomputeproject/SAI/pull/1365)

### Add new attribute types

New attributes types for the below files have been added

````````````````

saitypes.h

typedef struct _sai_u16_range_t
{
    uint16_t min;
    uint16_t max;
} sai_u16_range_t;

typedef struct _sai_u16_range_list_t
{
    uint32_t count;
    sai_u16_range_t *list;
} sai_u16_range_list_t;

/** @validonly meta->attrvaluetype == SAI_ATTR_VALUE_TYPE_UINT16_RANGE_LIST */
    sai_u16_range_list_t u16rangelist;
	
````````````````
The PR related to this feature is available at PR#[1399](https://github.com/opencomputeproject/SAI/pull/1399)

### Support for experimental entries 

This commit adds support for non object ID entries in experimental directory. Test generation will need further improvements to include experimental entries.

````````````````
saiobject.h

/* new experimental object type includes */
#include "../experimental/saiexperimentalbmtor.h"

/**

````````````````
The PR related to this feature is available at PR#[1401](https://github.com/opencomputeproject/SAI/pull/1401)

