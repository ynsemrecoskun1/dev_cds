@AbapCatalog.sqlViewName: 'ZYEC_V_CDS_003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Fatura Kalem 2'
define view ZYEC_CDS_003
  as select from ZYEC_CDS_002
{
  vbeln,
  sum(conversion_netwr)                                                                           as toplam_net_deger,
  kunnrAd                                                                                         as musteri_ad,
  count(*)                                                                                        as toplam_fatura_adedi,
  division(cast( sum(conversion_netwr) as abap.curr( 15, 2 ) ), cast( count(*) as abap.int1 ), 2) as ortalama_tutar,
  left(fkdat,4)                                                                                   as faturalama_yili,
  substring(fkdat,5,2)                                                                            as faturalama_ayi,
  substring(fkdat,7,2)                                                                            as faturalama_gunu,
  substring(inco2_l,1,3)                                                                          as incoterm_yeri
}
group by
  vbeln,
  kunnrAd,
  fkdat,
  inco2_l
