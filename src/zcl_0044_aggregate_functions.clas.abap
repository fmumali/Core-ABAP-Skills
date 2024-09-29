CLASS zcl_0044_aggregate_functions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_aggregate_functions IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    SELECT FROM /dmo/connection
          FIELDS carrier_id,
                 connection_id,
                 airport_from_id,
                 distance
           WHERE carrier_id = 'LH'
            INTO TABLE @DATA(result_raw).


    out->write(
      EXPORTING
        data = result_raw
        name = 'RESULT_RAW'
    ).
  ENDMETHOD.
ENDCLASS.
