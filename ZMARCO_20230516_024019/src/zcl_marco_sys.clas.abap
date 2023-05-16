class ZCL_MARCO_SYS definition
  public
  final
  create public .

public section.
TYPES : BEGIN OF ty_bapi_epm_product_header,
          productid     TYPE c LENGTH 10,
          typecode      TYPE c LENGTH 2,
          category      TYPE c LENGTH 40,
          name          TYPE c LENGTH 255,
          description   TYPE c LENGTH 255,
          supplierid    TYPE c LENGTH 10,
          suppliername  TYPE c LENGTH 80,
          taxtarifcode  TYPE int1,
          measureunit   TYPE c LENGTH 3,
          weightmeasure TYPE p LENGTH 7 DECIMALS 3,
          weightunit    TYPE c LENGTH 3,
          price         TYPE p LENGTH 12 DECIMALS 4,
          currencycode  TYPE c LENGTH 5,
          width         TYPE p LENGTH 7 DECIMALS 3,
          depth         TYPE p LENGTH 7 DECIMALS 3,
          height        TYPE p LENGTH 7 DECIMALS 3,
          dimunit       TYPE c LENGTH 3,
          productpicurl TYPE c LENGTH 255,
        END OF ty_bapi_epm_product_header.
  interfaces IF_OO_ADT_CLASSRUN .
protected section.
private section.
ENDCLASS.



CLASS ZCL_MARCO_SYS IMPLEMENTATION.
  METHOD IF_OO_ADT_CLASSRUN~MAIN.

TRY.
*DATA(lo_destination) = cl_rfc_destination_provider=>create_by_cloud_destination(
*                         i_name                  =
**                         i_service_instance_name =
*                       ).
*                       catch cx_rfc_dest_provider_error.
*DATA(lo_destination) = cl_rfc_destination_provider=>create_by_comm_arrangement(
*                        comm_scenario          = Z_OUTBOUND_RFC_000_CS     " Communication scenario
*                        service_id             = Z_OUTBOUND_HANA_000       " Outbound service
*                        comm_system_id         = Z_OUTBOUND_HANA_CS_000    " Communication system
*
*                       ).

*DATA(lv_destination) = lo_destination->get_destination_name( ).

*CALL FUNCTION 'BAPI_EPM_PRODUCT_GET_LIST'
*  DESTINATION lv_destination
**   EXPORTING
**     max_rows              = 25
*    TABLES
*      headerdata            = lt_product
*    EXCEPTIONS
*      system_failure        = 1 MESSAGE msg
*      communication_failure = 2 MESSAGE msg
*      OTHERS                = 3.


CATCH cx_root INTO DATA(lx_root).
  out->write(  lx_root->get_longtext( ) ).

ENDTRY.



  ENDMETHOD.

ENDCLASS.
