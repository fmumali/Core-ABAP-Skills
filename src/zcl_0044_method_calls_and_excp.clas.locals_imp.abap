*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.

* Attributes
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

* Methods
    METHODS get_carrier
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id  DEFAULT 'LH'
      RAISING
        cx_abap_invalid_value.


ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD get_carrier.

    IF i_carrier_id IS INITIAL..
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id    = i_carrier_id.

  ENDMETHOD.

ENDCLASS.
