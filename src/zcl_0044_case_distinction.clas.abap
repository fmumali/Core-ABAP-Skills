CLASS zcl_0044_case_distinction DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_case_distinction IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/customer
         FIELDS customer_id,
                title,
                CASE title
                    WHEN 'Mr.'  THEN 'Mister'
                    WHEN 'Mrs.' THEN 'Mistres'
                    ELSE             ' '
                END AS title_long

          WHERE country_code = 'AT'
          INTO TABLE @DATA(result_simple).

    out->write( EXPORTING data = result_simple
                          name = 'RESULT_SIMPLE' ).



  ENDMETHOD.
ENDCLASS.
