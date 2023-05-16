*&---------------------------------------------------------------------*
*& Report Z_SYS_USER_LOGON
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report z_sys_user_logon message-id /ocra/core.



select * from ZtSYS_USER_LOGON into table @data(x).

data go_alv type ref to cl_salv_table.

try.
    cl_salv_table=>factory(
*    EXPORTING
*      list_display   = if_salv_c_bool_sap=>false " ALV Displayed in List Mode
*      r_container    =                           " Abstract Container for GUI Controls
*      container_name =
     importing
       r_salv_table   = go_alv                        " Basis Class Simple ALV Tables
     changing
       t_table        = x
    ).

##NO_HANDLER  catch cx_salv_msg.  " ALV: General Error Class with Message

endtry.

*go_alv->display( ).

cl_salv_gui_table_ida=>create_for_cds_view( 'Z_Invoice_Items_XXX' )->fullscreen( )->display( ).
