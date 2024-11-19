USE db1_wahyuanggara

CREATE TABLE barang(  
  kode_barang VARCHAR(10),
  nama_barang VARCHAR(50),
  stok INT
)ENGINE=INNODB;

SELECT * FROM barang;

CREATE TABLE detail_barang(  
  kode_barang VARCHAR(10),
  stok INT,
  waktu DATETIME,
  kejadian VARCHAR(25)
)ENGINE=INNODB;

CREATE TRIGGER edit_data AFTER UPDATE ON barang
FOR EACH ROW
INSERT INTO detail_barang VALUES
(new.kode_barang, new.stok, NOW(), 'Edit Data');

CREATE TRIGGER hapus_data AFTER DELETE ON barang
FOR EACH ROW
INSERT INTO detail_barang VALUES
(old.kode_barang, old.stok, NOW(), 'Hapus Data');

UPDATE barang SET stok = '10' WHERE kode_barang = '112';

DELETE FROM barang WHERE kode_barang ='112';

SELECT * FROM detail_barang;

DROP TABLE barang

DROP TABLE detail_barang