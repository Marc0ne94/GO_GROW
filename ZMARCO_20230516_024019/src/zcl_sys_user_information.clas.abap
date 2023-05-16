CLASS zcl_sys_user_information DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS get_new_id.
    METHODS get_computer_name.
    METHODS get_user_name.
    METHODS execute.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA s_systab TYPE ztsys_user_logon.

ENDCLASS.



CLASS ZCL_SYS_USER_INFORMATION IMPLEMENTATION.


  METHOD get_new_id.

    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr             = '01'
        object                  = 'ZSYS'
        quantity                = '1'
      IMPORTING
        number                  = s_systab-access_id
      EXCEPTIONS
        interval_not_found      = 1
        number_range_not_intern = 2
        object_not_found        = 3
        quantity_is_0           = 4
        quantity_is_not_1       = 5
        interval_overflow       = 6
        buffer_overflow         = 7
        OTHERS                  = 8.
    IF sy-subrc <> 0.
      MESSAGE '' TYPE 'S'.
    ENDIF.

  ENDMETHOD.


  METHOD get_computer_name.

    DATA lv_string TYPE string.

    cl_gui_frontend_services=>get_computer_name(
      CHANGING
        computer_name        = lv_string                 " Frontend Operating System Computer Name
      EXCEPTIONS
        cntl_error           = 1                " Control error
        error_no_gui         = 2                " No GUI available
        not_supported_by_gui = 3                " GUI does not support this
        OTHERS               = 4
    ).
    IF sy-subrc <> 0.
*      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
    CALL METHOD cl_gui_cfw=>update_view.
    s_systab-device = lv_string.

  ENDMETHOD.


  METHOD get_user_name.
    DATA lv_string TYPE string.
    cl_gui_frontend_services=>get_user_name(
      CHANGING
        user_name            =  lv_string                " User Name
      EXCEPTIONS
        cntl_error           = 1                " Control error
        error_no_gui         = 2                " No GUI available
        not_supported_by_gui = 3                " GUI does not support this
        OTHERS               = 4
    ).
    IF sy-subrc <> 0.
*      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
    CALL METHOD cl_gui_cfw=>update_view.
    s_systab-sysuname = lv_string.

  ENDMETHOD.


  METHOD execute.
    s_systab-username = sy-uname.
    s_systab-erdat = sy-datum.
    s_systab-erzet = sy-uzeit.
    MODIFY ztsys_user_logon FROM s_systab.
  ENDMETHOD.
ENDCLASS.
