CLASS ycl_terminal DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_medium.

    METHODS: compute.

  PRIVATE SECTION.
   DATA: mv_memory_size TYPE i,
         mo_memory TYPE REF TO YIF_MEMORY.

   METHODS: "main flow
            compute_line,
            add_memory
                IMPORTING iv_memory TYPE i,
            set_mv_memory_size
                IMPORTING i_mv_memory_size TYPE i,
            has_enough_memory
                RETURNING VALUE(rv_result) TYPE abap_bool,
            "Exceptional flows
            check_prerequests_of_memory,
            save_in_memory,
            is_enough_memory_space
                IMPORTING io_memory TYPE REF TO yif_memory
                RETURNING VALUE(rv_result) TYPE abap_bool.

ENDCLASS.

CLASS ycl_terminal IMPLEMENTATION.

  METHOD yif_medium~display.

  ENDMETHOD.

  METHOD yif_medium~display_oval.
  ENDMETHOD.

  METHOD yif_medium~display_rectangle.
  ENDMETHOD.
*
  METHOD set_mv_memory_size.
    me->mv_memory_size = i_mv_memory_size.
  ENDMETHOD.

  METHOD add_memory.
     mo_memory->add_memory( iv_memory ).
  ENDMETHOD.

  METHOD compute_line.

  ENDMETHOD.

  METHOD has_enough_memory.
    rv_result = mo_memory->has_enough_memory(  ).
  ENDMETHOD.

  METHOD check_prerequests_of_memory.
       IF has_enough_memory(  ).
        add_memory( 20 ).
       ENDIF.
  ENDMETHOD.

  METHOD save_in_memory.
    mo_memory->make_operation( 2 ).
  ENDMETHOD.

  METHOD is_enough_memory_space.
    rv_result = has_enough_memory( ).
  ENDMETHOD.

  METHOD compute.
    check_prerequests_of_memory( ).

    IF is_enough_memory_space( mo_memory ).
        compute_line(  ).
        save_in_memory(  ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
