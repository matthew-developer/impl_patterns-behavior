CLASS ycl_client DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
    "Choosing Message
     display_graphic
                IMPORTING if_graphic TYPE REF TO yif_graphic
                          if_medium  TYPE REF TO yif_medium,
    "Double Dispatcher
     display_grahpic_advanced
                IMPORTING if_graphic TYPE REF TO yif_graphic
                          if_medium  TYPE REF TO yif_medium.

 ENDCLASS.


CLASS ycl_client IMPLEMENTATION.

  METHOD display_graphic.
        if_medium->display( if_graphic ).
  ENDMETHOD.

  METHOD display_grahpic_advanced.
        if_graphic->displayWith( if_medium ).
  ENDMETHOD.

ENDCLASS.
