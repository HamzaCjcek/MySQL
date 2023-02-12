/*------------------------------------------------------------------------
Mart_satislar isimli bir tablo olusturun, 
icinde urun_id, musteri_isim, urun_isim ve urun_fiyat field'lari olsun
1) Ismi hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin 
2) Toyota marka araclara %10 indirim yapin 
3) Ismi Ali olanlarin urun_fiyatlarini %15 artirin 
4) Honda araclarin urun id'sini 50 yapin.
--------------------------------------------------------------------------*/
CREATE TABLE mart_satislar
(
 urun_id int,
 musteri_isim varchar(20),
 urun_isim varchar(10),
 urun_fiyat int
);
INSERT INTO mart_satislar VALUES (10, 'Ali', 'Honda',75000);
INSERT INTO mart_satislar VALUES (10, 'Ayse', 'Honda',95200);
INSERT INTO mart_satislar VALUES (20, 'Hasan', 'Toyota',107500);
INSERT INTO mart_satislar VALUES (30, 'Mehmet', 'Ford', 112500);
INSERT INTO mart_satislar VALUES (20, 'Ali', 'Toyota',88000);
INSERT INTO mart_satislar VALUES (10, 'Hasan', 'Honda',150000);
INSERT INTO mart_satislar VALUES (40, 'Ayse', 'Hyundai',140000);
INSERT INTO mart_satislar VALUES (20, 'Hatice', 'Toyota',60000);

select * from mart_satislar;
-- 1) Ismi hatice olan musterinin urun_id'sini 30,urun_isim'ini Ford yapin
Update mart_satislar
set urun_id =30, urun_isim='Ford'
where musteri_isim='hatice';
-- 2) Toyota marka araclara %10 indirim yapin
update mart_satislar
set urun_fiyat=urun_fiyat*0.9
where urun_isim='Toyota' ;
-- 3) Ismi Ali olanlarin urun_fiyatlarini %15 artirin
update mart_satislar
set urun_fiyat=urun_fiyat*1.15
where musteri_isim='ali' ;
-- 4) Honda araclarin urun id'sini 50 yapin.
update mart_satislar
set urun_id=50
where urun_isim='Honda' ;