CLASS zcl_0044_struc_data_types DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_struc_data_types IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Example 1 : Motivation for Structured Variables
**********************************************************************

    DATA: connection_full TYPE /DMO/I_Connection.

    SELECT SINGLE
    FROM /DMO/I_Connection
    FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport, DepartureTime, ArrivalTime, Distance, DistanceUnit
    WHERE AirlineID = 'LH'
    AND ConnectionID = '0400'
    INTO @connection_full.

    out->write(  `--------------------------------------` ).
    out->write(  `Example 1: CDS View as Structured Type` ).
    out->write( connection_full ).

* Example 2: Global Structured Type
**********************************************************************
    TYPES: BEGIN OF ty_CONNECTION,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF ty_connection.

    DATA: ls_connection TYPE ty_connection.

    SELECT SINGLE
    FROM /dmo/i_connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
    WHERE AirlineID = 'LH'
    AND ConnectionID = '0400'
    INTO @ls_connection.

    out->write(  `---------------------------------------` ).
    out->write(  `Example 3: Local Structured Type` ).
    out->write( ls_connection ).


* Example 3 : Local Structured Type
**********************************************************************

    TYPES: BEGIN OF ty_nested,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             message         TYPE symsg,
             carrier_name    TYPE /dmo/carrier_name,
           END OF ty_nested.

    DATA ls_connection_nested TYPE ty_nested.

    out->write(  `---------------------------------` ).
    out->write(  `Example 4: Nested Structured Type` ).
    out->write( ls_connection_nested ).

* Example 4 : Nested Structured Type
**********************************************************************



  ENDMETHOD.
ENDCLASS.
