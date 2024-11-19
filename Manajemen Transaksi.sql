
CREATE TABLE stok
(
number INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
balance FLOAT
)ENGINE=INNODB;

INSERT INTO stok (balance) VALUES (0.0);
INSERT INTO stok (balance) VALUES (3000.0);
INSERT INTO stok (balance) VALUES (5000.0);
INSERT INTO stok (balance) VALUES (7000.0);
INSERT INTO stok (balance) VALUES (0.0);

SELECT* FROM stok;

SELECT *  FROM stok WHERE balance = 0;

BEGIN;
UPDATE stok SET balance = balance +4000 WHERE number =3;
COMMIT;

BEGIN;
UPDATE stok SET balance = balance -1000 WHERE number = 2;
ROLLBACK;

