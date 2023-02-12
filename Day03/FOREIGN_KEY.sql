/*====================================== FOREIGN KEY ==============================================
=> Foreign Key iki tablo arasinda Relation olusturmak icin kullanilir. 
=> Foreign Key baska bir tablonun Primary Key'ine baglidir. 
=> Referenced table (baglanilan tablo, Primary Key'in oldugu Tablo) parent table olarak adlandirilir. 
   Foreign Key'in oldugu tablo ise child table olarak adlandirilir. 
=> Bir Tabloda birden fazla Foreign Key olabilir. 
=> Foreign Key NULL degeri alabilir. 
Note 1: "Parent Table" olmayan bir id'ye sahip datayi "Child Table"'a ekleyemezsiniz 
Note 2: Child Table'i silmeden Parent Table'i silemezsiniz. Once "Child Table" silinir, sonra "Parent Table" silinir.
        
-----Syntax-----
CONSTRAINT constraintName FOREIGN KEY(table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
CREATE TABLE table_name
(
id char(10),
name char(10),
CONSTRAINT constraint_name 
FOREIGN KEY (table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
);
        
==================================================================================================*/
/*------------------------------------------------------------------------
"tedarikci" isimli bir tablo olusturun. 
Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" field'lari olsun 
ve "tedarikci_id" yi Primary Key yapin.
 "urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id"
 field'lari olsun ve "tedarikci_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
CREATE TABLE tedarikci
(
tedarikci_id INT,
tedarikci_ismi VARCHAR(15),
iletisim_isim VARCHAR(20),
CONSTRAINT tedarikci_pk PRIMARY KEY (tedarikci_id)
);
CREATE TABLE urunler
(
tedarikci_id INT,
urun_id INT,
CONSTRAINT urunler_fk FOREIGN KEY (tedarikci_id)
REFERENCES tedarikci (tedarikci_id)
);
SELECT * FROM tedarikci;
SELECT * FROM urunler;
/*------------------------------------------------------------------------
"bebeler" isimli bir tablo olusturun. 
Tabloda "id", "isim", "iletisim" field'lari olsun 
ve "id" yi Primary Key yapin.
 "notlar" isminde baska bir tablo olusturun "bebe_id" ve "puan"
 field'lari olsun ve "bebe_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
CREATE TABLE bebeler
(
id INT,
isim VARCHAR(10),
iletisim VARCHAR(10),
CONSTRAINT bebeler_pk PRIMARY KEY (id)
);
CREATE TABLE notlar
(
bebe_id INT,
puan INT,
CONSTRAINT notlar_fk FOREIGN KEY (bebe_id)
REFERENCES bebeler (id)
);
