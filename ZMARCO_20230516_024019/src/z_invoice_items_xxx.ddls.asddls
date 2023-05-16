@AbapCatalog.sqlViewName: 'ZINVOICEITEMS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '${ddl_source_description}'
define view Z_INVOICE_ITEMS_XXX
  as select from ztsys_user_logon
{
  key ztsys_user_logon.access_id,
      @EndUserText.quickInfo: 'Hostname Device'
      @EndUserText.label: 'Computer Name'
      ztsys_user_logon.device,
      @EndUserText.quickInfo: 'Date Logon'
      @EndUserText.label:     'Date Logon'
      ztsys_user_logon.erdat,
      @EndUserText.quickInfo: 'Time Logon'
      @EndUserText.label:     'Time Logon'
      ztsys_user_logon.erzet,
      @EndUserText.quickInfo: 'UserName'
      @EndUserText.label:     'UserName'
      ztsys_user_logon.sysuname,
      @EndUserText.quickInfo: 'Sap Username'
      @EndUserText.label:     'Sap Username'
      ztsys_user_logon.username,

      @EndUserText.quickInfo: 'Device is know'
      @EndUserText.label: 'Reg. Status'
      case device
       when '' then 'Not Found'
       else 'Allowed'
       end as device_registration

}
