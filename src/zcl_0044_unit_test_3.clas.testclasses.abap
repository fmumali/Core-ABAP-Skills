*"* use this source file for your ABAP unit test classes

CLASS ltcl_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA carrier TYPE REF TO lcl_carrier.

    METHODS:
      test_get_name FOR TESTING RAISING cx_static_check,
      setup,
      get_test_currency FOR TESTING.


ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD test_get_name.

    " cl_abap_unit_assert=>fail( 'Implement your first test here' ).
    DATA(name) =  me->carrier->get_name(  ).

    cl_abap_unit_assert=>assert_not_initial(
      act  = name
      msg  = `Result of method get_name( )`
      quit = if_abap_unit_constant=>quit-no
    ).

* Compact alternative (no helper variables)
**********************************************************************
*
*    cl_abap_unit_assert=>assert_not_initial(
*      act  = me->carrier->get_name( )
*      msg  = `Result of method get_name( )`
*      quit = if_abap_unit_constant=>quit-no
*    ).

  ENDMETHOD.


  METHOD setup.
    "read arbitrary carrier_id from DB table
    SELECT
     FROM /dmo/carrier FIELDS carrier_id ORDER BY PRIMARY KEY
     INTO @DATA(carrier_id)
     UP TO 1 ROWS .
    ENDSELECT.

    IF sy-subrc <> 0.

      cl_abap_unit_assert=>skip(
        msg    = `No data in /DMO/CARRIER`
        detail = `Test requires at least one entry in DB table /DMO/CARRIER` ).
    ENDIF.

    "then create the instance to be tested
    TRY.
        me->carrier = NEW lcl_carrier( carrier_id ).
      CATCH cx_abap_invalid_value.

        cl_abap_unit_assert=>fail(
          msg    = `Cannot create instance of lcl_carrier`
          detail = `TConstructor of lcl_carrier raises an exception when it should not` ).

    ENDTRY.

    cl_abap_unit_assert=>assert_bound(
      EXPORTING
        act = me->carrier
        msg = `Cannot create instance of lcl_carrier` ).


  ENDMETHOD.


  METHOD get_test_currency.

    cl_abap_unit_assert=>assert_not_initial(
      act  = me->carrier->get_currency( )
      msg  = `Result of method get_currency( )`
      quit = if_abap_unit_constant=>quit-no ).

  ENDMETHOD.


ENDCLASS.
