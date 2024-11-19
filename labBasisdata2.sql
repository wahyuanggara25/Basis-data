
CREATE TABLE film (
kd_film CHAR(5) NOT NULL PRIMARY KEY,
judul VARCHAR(30),
kategori VARCHAR(10),
jumlah INT,
tanggal_masuk DATE,
harga_sewa INT 
)ENGINE=INNODB;

CREATE TABLE member (
id_member CHAR(5) NOT NULL PRIMARY KEY,
no_telp VARCHAR(12),
nama VARCHAR(30)
)ENGINE=INNODB;

CREATE TABLE transaksi(
no_transaksi CHAR(3) NOT NULL PRIMARY KEY ,
kd_film CHAR(5),
id_member CHAR(5),
tgl_sewa DATE,
tgl_kembali DATE,
biaya_sewa INT,
CONSTRAINT kd_film FOREIGN KEY transaksi(kd_film) REFERENCES film(kd_film),
CONSTRAINT id_member FOREIGN KEY transaksi(id_member) REFERENCES member(id_member)
)ENGINE=INNODB;


SELECT judul, jumlah, tanggal_masuk FROM film;

SELECT id_member, nama FROM member;

SELECT * FROM member WHERE nama = "Andika";

SELECT id_member FROM member WHERE nama = "Andika";

SELECT id_member FROM transaksi WHERE tgl_sewa = "2014-05-03";

SELECT no_transaksi, kd_film FROM transaksi WHERE id_member = "mem02";

