CLASS zcl_0044_string_process DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_string_process IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/customer
         FIELDS customer_id,

         street && ',' && ' ' && postal_code && ' ' && city AS address_expr,

         concat( street,
                 concat_with_space(  ',',
                                      concat_with_space( postal_code,
                                                         upper( city ),
                                                         1
                                                          ),
                                       1
                                    )
                               ) AS address_func

     WHERE country_code = 'ES'
     INTO TABLE @DATA(result_concat).

    out->write( EXPORTING data = result_concat
                          name = 'RESULT_CONCAT' ).


  ENDMETHOD.
ENDCLASS.
