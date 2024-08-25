CLASS zcl_0044_fibonacci_nums DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0044_fibonacci_nums IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    CONSTANTS max_count TYPE i VALUE 20.

    DATA numbers TYPE TABLE OF i.


    DO max_count TIMES.


      CASE sy-index.
        WHEN 1.
          APPEND 0 TO numbers.
        WHEN 2.
          APPEND 1 TO numbers.

        WHEN OTHERS.

          APPEND (  sy-index - 1  +  sy-index - 2 ) TO numbers.
      ENDCASE.


  DATA(counter) = 0.
  LOOP AT numbers INTO DATA(number).

     counter = counter + 1.

  ENDLOOP.



    ENDDO.





  ENDMETHOD.
ENDCLASS.
