USE mysql;
SHOW TABLES;


SELECT USER,HOST,PASSWORD FROM USER;

CREATE USER 'wahyuanggara' @'localhost' IDENTIFIED BY '123456';
FLUSH PRIVILEGES;

CREATE DATABASE wahyuanggara

SHOW GRANTS FOR 'wahyuanggara' @'localhost';

GRANT SELECT,INSERT ON wahyuanggara.`mahasiswa` TO'wahyuanggara' @'localhost';
GRANT UPDATE(nama) ON wahyuanggara.`mahasiswa` TO 'wahyuanggara' @'localhost';

