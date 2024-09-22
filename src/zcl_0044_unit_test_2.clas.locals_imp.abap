*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_data definition create private.

  public section.
      CLASS-METHODS get_carrier
      IMPORTING i_carrier_id     TYPE /dmo/carrier_id
      RETURNING VALUE(r_carrier) TYPE /dmo/carrier
      RAISING   cx_abap_invalid_value.
  protected section.
  private section.

endclass.

class lcl_data implementation.

  METHOD get_carrier.

    SELECT SINGLE *
    FROM /DMO/carrier
    WHERE carrier_id = @i_carrier_id
    INTO @r_carrier.

    IF sy-subrc <> 0.

      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

  ENDMETHOD.

endclass.
