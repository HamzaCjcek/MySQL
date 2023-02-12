CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
  use sys  ;
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 7);
    
    
SELECT * FROM kelimeler;

-- Q5 : h ile baslayip t ile biten 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
    -- NOT : [!-~] = [a-zA-Z0-9]
    
SELECT kelime 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 'h[!-~]t','c');
SELECT kelime 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t','c');
SELECT kelime 
FROM kelimeler 
WHERE REGEXP_LIKE(kelime, 'h[A-Z]t','c'); -- 
    
SELECT kelime
FROM kelimeler
WHERE kelime LIKE 'h_t';

-- Q6 : 2. harfi O olan 3 harfli kelimeleri (o harfi buyuk olanlari) listeleyiniz
select kelime
 from kelimeler
 where regexp_like(kelime,'[!-~]O[!-~]','c');

select kelime,id
 from kelimeler
 where regexp_like(kelime,'[a-zA-Z0-9]O[a-zA-Z0-9]'); 
 
 select kelime
from kelimeler
where regexp_like(kelime,'[a-zA-Z0-9]oo[a-zA-Z0-9]');