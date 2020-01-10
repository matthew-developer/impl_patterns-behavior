CLASS ycl_rectangle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES: yif_graphic.
ENDCLASS.

CLASS ycl_rectangle IMPLEMENTATION.

  METHOD yif_graphic~displaywith.
        if_medium->display_rectangle( me ).
  ENDMETHOD.

ENDCLASS.
