CLASS zcl_0044_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_0044_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.

    agencies_upd = VALUE #( ( agencyid = '070044' name = `Some fancy new name` ) ).

    MODIFY ENTITIES OF /DMO/I_AgencyTP
    ENTITY /dmo/agency
    UPDATE FIELDS ( name )
    WITH agencies_upd.

    out->write( `Method execution finished` ).


  ENDMETHOD.

ENDCLASS.
