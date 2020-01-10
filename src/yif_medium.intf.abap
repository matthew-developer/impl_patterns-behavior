interface YIF_MEDIUM
  public .

  METHODS: display
                IMPORTING if_graphic TYPE REF TO yif_graphic,
           display_oval
                IMPORTING if_graphic TYPE REF TO yif_graphic,
           display_rectangle
                IMPORTING if_graphic TYPE REF TO yif_graphic.
endinterface.
