/* ======================== SELECT ile SUBQUERY ===========================
  SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sÃ¼tunlarÄ±(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satÄ±rlarÄ±(record) getirsin
  
 * Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
  * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
=> Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
kullanmaniz gerekir?
=========================================================================*/
/*----------------------------------------------------------------
 SORU 1- Her sirketin ismini, personel sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
Select sirket,personel_sayisi,(select avg(maas) from personel where sirketler.sirket=personel.sirket) from sirketler;
/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
select * from personel;
select * from sirketler;
select sirket,(select MAX(maas) from personel where sirketler.sirket=personel.sirket) from sirketler;
/*----------------------------------------------------------------
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde 
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select sirket_id,sirket,(select count(sehir) from personel where sirketler.sirket=personel.sirket) from sirketler;
/*----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select sirket_id,sirket,(select count(sehir) from personel where sirketler.sirket=personel.sirket) from sirketler where sirket_id>101;

/*----------------------------------------------------------------
SORU 5- Her sirketin ismini,personel sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/   
 select sirket,(select MAX(maas) from personel where sirketler.sirket=personel.sirket),(select MIN(maas) from personel where sirketler.sirket=personel.sirket) from sirketler;

/*----------------------------------------------------------------
SORU 6- Her sirketin ismini ve personel sayisini ve iscilere
odedigi toplam maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
select sirket,personel_sayisi,(select SUM(maas) from personel where sirketler.sirket=personel.sirket) as toplam_para from sirketler;
