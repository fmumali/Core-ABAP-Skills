CLASS zcl_0044_inner_outter_joins DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_inner_outter_joins IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  SELECT FROM /dmo/Agency as a
*   INNER JOIN /dmo/customer as c
   LEFT OUTER JOIN /dmo/customer as c
*   INNER JOIN /dmo/customer as c
           ON a~city = c~city

      FIELDS agency_id,
             name AS Agency_name,
             a~city AS Agency_city,
             c~city AS customer_city,
             customer_id,
             last_name AS customer_name

       WHERE ( c~customer_id < '000010' OR c~customer_id IS NULL )
         AND ( a~agency_id < '070010' OR a~agency_id  IS NULL )

         INTO TABLE @DATA(result_join).

 out->write(
    EXPORTING
        data = result_join
        name = 'RESULT_JOIN'
     ).


  ENDMETHOD.

ENDCLASS.
