CLASS zcl_0044_atc_unused_variables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_atc_unused_variables IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:  connection_list TYPE TABLE OF /dmo/connection.

    SELECT FROM /dmo/connection
    FIELDS *
    INTO TABLE @DATA(connections).

    out->write( connections ).

  ENDMETHOD.
ENDCLASS.
