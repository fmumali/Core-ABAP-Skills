CLASS zcl_0044_conversion_funcs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_conversion_funcs IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM /dmo/travel
         FIELDS lastchangedat,
                CAST( lastchangedat AS DEC( 15, 0 ) )     AS lastchanged_short,

                tstmp_to_dats( tstmp = CAST( lastchangedat AS DEC( 15, 0 ) ),
                               tzone = CAST( 'EST' AS CHAR( 6 ) )
                             ) AS date_est,
                tstmp_to_tims( tstmp = CAST( lastchangedat AS DEC( 15, 0 ) ),
                               tzone = CAST( 'EST' AS CHAR( 6 ) )
                             ) AS time_est
          WHERE customer_id = '000001'
          INTO TABLE @DATA(result_date_time).

    out->write( EXPORTING data = result_date_time
                          name = 'RESULT_DATE_TIME' ).

**********************************************************************

    DATA(today) = cl_abap_context_info=>get_system_date(  ).

    SELECT FROM /dmo/travel
         FIELDS total_price,
                currency_code,

                currency_conversion( amount = total_price,
                                     source_currency = currency_code,
                                     target_currency = 'EUR',
                                     exchange_rate_date = @today
                                     ) AS total_price_EUR

          WHERE customer_id = '000001' AND currency_code <> 'EUR'
          INTO TABLE @DATA(result_currency).


    out->write( EXPORTING data = result_currency
                          name = 'RESULT_CURRENCY' ).


**********************************************************************

  ENDMETHOD.
ENDCLASS.
