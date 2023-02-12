use sys;
Select * from personel;
Create Table personel
(
id char(5),
isim varchar(50),
maas int
);

insert into personel values('10001','Ahmet Aslan',7000);
insert into personel values('10002','Mehmet Yilmaz',12000);
insert into personel values('10003','Meryem',7215);
insert into personel values('10004','Veli Han',5000);
insert into personel values('10005','Mustafa Ali',5500);
insert into personel values('10006','Ayse Can',5600);
insert into personel values('10010','Ayse',4700);
insert into personel values('10009','Ayse Cemile',4000);
insert into personel values('10008','Ayse Cano',4300);
insert into personel values('10007','Can Ayse',7700);
insert into personel values('10011','Yeliz Alina',12700);

/*-------------------------------------------------------------------------
Q7: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

Select * from personel where id between '10005' and'10009'; 
Select * from personel where id>10004 and id<10010;

/*-------------------------------------------------------------------------
Q8: Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
Select * from personel where isim between 'Mehmet Yilmaz' and 'Veli';

/*-------------------------------------------------------------------------
Q9: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
Select * from personel where isim between 'Ahmet' and 'Ayse Cano';

/*-------------------------------------------------------------------------
Q10: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/
select id from personel where maas=7000 or isim='Ayse';

/*-------------------------------------------------------------------------
Q11: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
select isim from personel where id='10001' or id='10005' or id='10008';
select isim from personel where id IN ('10001','10005','10008');
/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/

/*-------------------------------------------------------------------------
Q13: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/
select id,isim,maas from personel where maas='7000' or maas='12000';

/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/
/*-------------------------------------------------------------------------
Q14: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/
select id,isim,maas from personel where isim LIKE 'a%';

/*-------------------------------------------------------------------------
Q15: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/
select id,isim,maas from personel where isim like '%Ayse%';
/*-------------------------------------------------------------------------
Q16: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/
select id,isim,maas from personel where isim like '%n';
/*-------------------------------------------------------------------------
Q17: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select id,isim,maas from personel where isim like '_e%';
/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select id,isim,maas from personel where isim like '_e%' and isim like '%y%';
/*-------------------------------------------------------------------------
Q19: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/
select * from personel where isim not like '%a%';
/*-------------------------------------------------------------------------
Q20: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select * from personel where maas like '%_____%';
/*-------------------------------------------------------------------------
Q21: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select * from personel where isim like 'a_____a%' ;