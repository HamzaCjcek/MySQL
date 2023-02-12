/*====================================== PRIMARY KEY ==============================================
1) Primary Key bir record'u tanimlayan bir field veya birden fazla field'in kombinasyonudur. 
2) Primary Key Unique'dir. 
3) Bir tabloda en fazla bir Primary Key olabilir .
4) Primary Key field'inda hic bir data NULL olamaz.
-----Syntax-----
 "id" field'ini "primary key" yapmak icin 2 yol var.
1) Data Type'dan sonra "PRIMARY KEY" yazarak.
 
 CREATE TABLE students_table 
(
 id int PRIMARY KEY,
 name varchar(50) NOT NULL,
 grade int,
 adres varchar(100),
 last_update date 
);
2) CONSTRAINT Keyword Kullanilarak Primary Key Tanimlanabilir; 
"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n)" 
CREATE TABLE students 
(
id int,
name varchar(50) NOT NULL,
grade int,
address varchar(100),
last_modification date, 
CONSTRAINT id_pk PRIMARY KEY (id) 
);
================================================================================================*/
Use sys;
Create Table sehirler
(
Alan_Kodu char(4) PRIMARY KEY,
isim varchar(50) not null,
nufüs INT
);
/*------------------------------------------------------------------------------
"ogretmenler" isimli bir Table olusturun.
Tabloda "id", "isim", "brans", "cinsiyet" field'lari olsun.
Id field'i tekrarli deger kabul etmesin.
2.Yontemi kullanarak "id ve isim" field'lerinin birlesimini "primary key" yapin
-------------------------------------------------------------------------------*/
CREATE TABLE ogretmenler
(
id INT UNIQUE,
isim VARCHAR(25),
brans VARCHAR(10),
cinsiyet VARCHAR(5),
CONSTRAINT id_isim_pk PRIMARY KEY (id,isim)
);
/*----------------------------------------------------------------
"universite_ogrenci_bilgi_sistemi" isimli bir Table olusturun. 
Tabloda "giris yili", "giris siralamasi", "isim", "bolum" field'lari olsun. 
isim field'i null deger kabul etmesin. 
2.Yontemi kullanarak "giris yili ve giris siralamasi" field'lerinin birlesimini
 "primary key" yapin 
------------------------------------------------------------------*/
Create table universite_ogrenci_bilgi_sistemi
(
giris_yili INT,
giris_siralamasi INT,
isim varchar(50) not null,
bolum varchar(50),
CONSTRAINT giris_yil_siralama PRIMARY KEY (giris_yili,giris_siralamasi)
);
select * from universite_ogrenci_bilgi_sistemi;
