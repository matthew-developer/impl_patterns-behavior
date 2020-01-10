CLASS ycl_oval DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_graphic.
ENDCLASS.



CLASS ycl_oval IMPLEMENTATION.


  METHOD yif_graphic~displaywith.
        if_medium->display_oval( me ).
  ENDMETHOD.

ENDCLASS.
