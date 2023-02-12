use sys;
/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.
-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;
========================================================================================*/
/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
Id ve isim'i beraber Primary Key yapin.
---------------------------------------------------------------------------------------*/

Create table firmalar
(
id INT,
isim varchar(50),
iletisim_isim varchar(50),
CONSTRAINT firmalar_pk primary KEY (id,isim)
);
 
INSERT INTO firmalar(id,isim,iletisim_isim) values
(1,'ACB','ALİ CAN'),
(2,'RDB','Veli Gul'),
(3,'KMN','Ayse Gulmez');

select * from firmalar;
Update firmalar set isim='KRM' where id=3;
Update firmalar SET id=4 where iletisim_isim='Veli Gul';