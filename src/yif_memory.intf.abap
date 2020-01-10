interface YIF_MEMORY
  public .

  METHODS: make_operation
                IMPORTING iv_id TYPE i,
           add_memory
                IMPORTING iv_size TYPE i,
           has_enough_memory
                RETURNING VALUE(rv_result) TYPE abap_bool.


endinterface.
