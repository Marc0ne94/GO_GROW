*&---------------------------------------------------------------------*
*& Include          ZXUSRU01
*&---------------------------------------------------------------------*

DATA ls_systab TYPE ztsys_user_logon.


DATA lo_obj TYPE REF TO zcl_sys_user_information.

lo_obj = NEW #(  ).

lo_obj->get_computer_name( ).
lo_obj->get_user_name( ).
lo_obj->get_new_id( ).
lo_obj->execute( ).
