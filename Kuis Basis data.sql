DELIMITER//
CREATE PROCEDURE jumlah_film (a VARCHAR(5),OUT b INT)
BEGIN
  SELECT COUNT(kd_film) INTO b FROM film WHERE kategori = a;
  END//

CALL jumlah_film('action',@b);

SELECT @b AS jumlah_film;


SELECT kd_film,
CASE
WHEN jumlah<=5 THEN 'cukup diminati'
WHEN jumlah>5 && jumlah<=10 THEN 'diminati'
WHEN jumlah>10 THEN 'sangat diminati'
ELSE '-'
END AS 'status' FROM film;

CREATE TABLE log_film(
 kd_film VARCHAR (10),
 jumlah_lama INT(10),
 jumlah_baru INT (10),
 tgl_kejadian DATE
)ENGINE=INNODB;

CREATE TRIGGER perubahan_jumlah AFTER UPDATE ON film
FOR EACH ROW 
INSERT INTO log_film VALUES
(new.kd_film,old.jumlah,new.jumlah,NOW());

UPDATE film SET jumlah ='5' WHERE kd film = 'FM001';

select * from film;
