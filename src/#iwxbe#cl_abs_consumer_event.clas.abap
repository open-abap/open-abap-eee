CLASS /iwxbe/cl_abs_consumer_event DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES /iwxbe/if_consumer_event.

    METHODS constructor
      IMPORTING
        io_event TYPE REF TO /iwxbe/if_consumer_event.

  PROTECTED SECTION.
    DATA mo_event TYPE REF TO /iwxbe/if_consumer_event.
ENDCLASS.

CLASS /iwxbe/cl_abs_consumer_event IMPLEMENTATION.

  METHOD constructor.
    mo_event = io_event.
  ENDMETHOD.

  METHOD /iwxbe/if_consumer_event~get_arrival_timestamp.
    rv_timestamp = mo_event->get_arrival_timestamp( ).
  ENDMETHOD.

  METHOD /iwxbe/if_consumer_event~get_business_data.
    mo_event->get_business_data( IMPORTING es_business_data = es_business_data ).
  ENDMETHOD.

  METHOD /iwxbe/if_consumer_event~get_cloud_event_source.
    rv_source = mo_event->get_cloud_event_source( ).
  ENDMETHOD.

  METHOD /iwxbe/if_consumer_event~get_cloud_event_type.
    rv_type = mo_event->get_cloud_event_type( ).
  ENDMETHOD.

  METHOD /iwxbe/if_consumer_event~get_cloud_event_id.
    rv_id = mo_event->get_cloud_event_id( ).
  ENDMETHOD.

  METHOD /iwxbe/if_consumer_event~get_cloud_event_timestamp.
    rv_timestamp = mo_event->get_cloud_event_timestamp( ).
  ENDMETHOD.

  METHOD /iwxbe/if_consumer_event~get_custom_ext_attr_value.
    mo_event->get_custom_ext_attr_value(
      EXPORTING
        iv_name                  = iv_name
      IMPORTING
        ev_custom_extension_attr = ev_custom_extension_attr ).
  ENDMETHOD.

ENDCLASS.
