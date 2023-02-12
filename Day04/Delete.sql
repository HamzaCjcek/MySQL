/*================================== DELETE ============================================
DELETE FROM table_name komutu tablodaki tum recordlari siler.
Eger tum kayitlar silindikten sonra tabloyu gormek isterseniz size sadece bos bir tablo
gosterir. 
DELETE komutu sadece datalari siler, tabloyu silmez.
=======================================================================================*/
DELETE FROM mart_satislar;
SELECT * FROM mart_satislar;

/*===============================================================================================
-- DELETE FROM tablo_adi;  Tablonun tum icerigini siler.
-- Bu komut bir DML komutudur. Dolayisiyla devaminda WHERE gibi cumlecikler
-- kullanilabilir.
    
    -- DELETE FROM tablo_adi
    -- WHERE field = veri;
    
--    DELETE FROM ogrenciler;     -- Tum verileri sil.
--    SAVEPOINT ABC;     -- Verilen konuma kodlari kaydeder.
--    ROLLBACK TO  ABC;  -- Silinen Verileri geri getir.
-- Bilgileri geri getirirken sikinti yasamamak icin ayarlar sql execution auto commit tiki kaldir
==================================================================================================*/ 

CREATE TABLE cucuklar
(
id char(3),
isim varchar(50),
veli_isim varchar(50),
yazili_notu int,
CONSTRAINT cocuklar_pk
PRIMARY KEY (id)
);
INSERT INTO cucuklar VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO cucuklar VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO cucuklar VALUES(125, 'Kemal Yasa', 'Ali',85);
SELECT * FROM cucuklar;
SAVEPOINT cicek;
Drop table cucuklar;
-- Veli Ismi Ali ya da Ayse olan kaydi siliniz
-- Yazili notu 84'ten buyuk olan cocuklari silin
-- Yazili notu 85'ten farkli olan cocuklari silin

Delete from cucuklar where veli_isim='Ali' or veli_isim='Veli';
Delete from cucuklar where veli_isim IN('ALİ','AYSE');
Delete from cucuklar where yazili_notu>84;
Delete from cucuklar where yazili_notu=85;
Delete from cucuklar where yazili_notu!=85;
Delete from cucuklar where yazili_notu<>85;

ROLLBACK TO cicek; 