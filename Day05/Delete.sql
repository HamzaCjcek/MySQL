/* ============================= DELETE - TRUNCATE - DROP ================================   
  
  => TRUNCATE TABLE komutu tablodaki tum datalari kalici olarak siler
  => Truncate ve Delete komutlarinin ikisi de bir tabloda bulunan recordlari silmek icin kullanilir.
  => Iki komut da sadece belirtilen tablodaki kayitlari siler.
  => En belirgin farki ise Delete komutu ile belirli bir araligi silebilirken,
  => Truncate komutu tablodaki tum verileri siler.
  
  1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamini siler.
    Ancak, secmeli silme yapamaz. Cunku Truncate komutu DML degil DDL komutudur.*/ 
    
       TRUNCATE TABLE ogrenciler; -- dogru yazim
       drop table ogrenciler;
       delete from ogrenciler;
    
   /* 2-) DELETE komutu beraberinde WHERE cumlecigi kullanilabilir. TRUNCATE ile 
    kullanilmaz.
    
        TRUNCATE TABLE ogrenciler
        WHERE veli_isim='Hasan';  .....yanlis yazim
        
-- TRUNCATE komutu tablo yapisini degistirmeden, 
-- tablo icinde yer alan tum verileri tek komutla silmenizi saglar.
        
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylikla geri 
    alinabilir.
    
    4-) Truncate ile silinen veriler geri alinmasi daha zordur. Ancak
    Transaction yontemi ile geri alinmasi mumkun olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. 
    
    -- Tablodaki kayitlari silmek ile tabloyu silmek farkli islemlerdir.
    -- Silme komutlari da iki basamaklidir, biz genelde geri getirilebilecek sekilde sileriz. 
    -- Ancak bazen guvenlik gibi sebeplerle geri getirilmeyecek sekilde silinmesi istenebilir.
==============================================================================*/ 
use sys;
TRUNCATE cocuklar;
SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;
select * from cocuklar;

INSERT INTO cocuklar VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO cocuklar VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO cocuklar VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO cocuklar VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO cocuklar VALUES(127, 'Mustafa Bak', 'Can',99);
	SAVEPOINT KIRAZ;
    delete from cocuklar;
    SET SQL_SAFE_UPDATES = 0;
    rollback to KIRAZ;
    
    -- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*============================== ON DELETE CASCADE ================================
  Her defasinda once child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme ozelligini aktif hale getirebiliriz.
  
  Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
===================================================================================*/
CREATE TABLE talebeler
    (
        id CHAR(3) primary key,
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int
    );
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);
     CREATE TABLE dereceler
    (
    talebe_id char(3),
	ders_adi varchar(30),
	yazili_notu int,
	CONSTRAINT notlar_fk FOREIGN KEY (talebe_id)
	REFERENCES talebeler(id) ON DELETE cascade
	);
	INSERT INTO dereceler VALUES ('123','Kimya',75);
    INSERT INTO dereceler VALUES ('124', 'Fizik',65);
    INSERT INTO dereceler VALUES ('125', 'Tarih',90);
	INSERT INTO dereceler VALUES ('126', 'Matematik',90);
	INSERT INTO dereceler VALUES ('127', 'Matematik',23);
    SELECT * FROM talebeler;
    SELECT * FROM dereceler;
    drop table talebeler;
    drop table dereceler;
    Delete from talebeler where id>125;
     Delete from dereceler where talebe_id>125;