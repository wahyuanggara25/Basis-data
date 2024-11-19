-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 19, 2018 at 10:15 
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `akademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE IF NOT EXISTS `borrower` (
  `costumer_name` VARCHAR(30) NOT NULL,
  `loan_number` CHAR(6) DEFAULT NULL,
  PRIMARY KEY (`costumer_name`),
  KEY `FK_borrower` (`loan_number`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`costumer_name`, `loan_number`) VALUES
('HAYES', 'L-155'),
('JONES', 'L-170'),
('SMITH', 'L-230');

-- --------------------------------------------------------

--
-- Table structure for table `contohenum`
--

CREATE TABLE IF NOT EXISTS `contohenum` (
  `nik` INT(11) DEFAULT NULL,
  `status` ENUM('kawin','belum kawin') DEFAULT NULL
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contohenum`
--


-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE IF NOT EXISTS `dosen` (
  `kd_dosen` CHAR(5) NOT NULL,
  `nama` VARCHAR(20) DEFAULT NULL,
  `alamat` VARCHAR(20) DEFAULT NULL,
  `tgl_lahir` DATE DEFAULT NULL,
  PRIMARY KEY (`kd_dosen`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kd_dosen`, `nama`, `alamat`, `tgl_lahir`) VALUES
('dos01', 'Andika', 'jl.utama', '1950-12-12'),
('dos02', 'Budi', 'jl.nenas', '1980-01-12'),
('dos03', 'agus', 'jl.rambutan', '1981-10-08'),
('dos04', 'Anton', 'jl. marpoyan', '1981-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `es`
--

CREATE TABLE IF NOT EXISTS `es` (
  `C` CHAR(1) NOT NULL,
  `D` INT(1) DEFAULT NULL,
  `E` INT(1) DEFAULT NULL
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `es`
--

INSERT INTO `es` (`C`, `D`, `E`) VALUES
('a', 10, 0),
('b', 10, 0),
('B', 20, 0),
('C', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `kd_mk` CHAR(5) DEFAULT NULL,
  `kd_dosen` CHAR(5) DEFAULT NULL,
  `hari` CHAR(10) DEFAULT NULL,
  `jam` CHAR(10) DEFAULT NULL,
  `ruang` CHAR(5) DEFAULT NULL,
  KEY `FK_jadwal` (`kd_mk`),
  KEY `FK_jadwal2` (`kd_dosen`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kd_mk`, `kd_dosen`, `hari`, `jam`, `ruang`) VALUES
('se001', 'dos01', 'senin', '10-12', '312'),
('se002', 'dos02', 'selasa', '13-15', '312'),
('se003', 'dos03', 'senin', '08-10', '315');

-- --------------------------------------------------------

--
-- Table structure for table `kuliah`
--

CREATE TABLE IF NOT EXISTS `kuliah` (
  `kd_mk` CHAR(5) NOT NULL,
  `nama` VARCHAR(20) DEFAULT NULL,
  `sks` INT(2) DEFAULT NULL,
  `sem` INT(2) DEFAULT NULL,
  `jenjang` CHAR(2) DEFAULT NULL,
  PRIMARY KEY (`kd_mk`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kuliah`
--

INSERT INTO `kuliah` (`kd_mk`, `nama`, `sks`, `sem`, `jenjang`) VALUES
('se001', 'basis data', 2, 4, 's1'),
('se002', 'struktur data', 3, 5, 's1'),
('se003', 'matematika', 3, 4, 's1'),
('se004', 'basis data 2', 2, 4, 'd3'),
('se005', 'statistik', 3, 2, 'd3');

-- --------------------------------------------------------

--
-- Table structure for table `kuliah_d3`
--

CREATE TABLE IF NOT EXISTS `kuliah_d3` (
  `kd_mk` CHAR(5) NOT NULL,
  `nama_mk` VARCHAR(20) DEFAULT NULL,
  `sks` INT(1) DEFAULT NULL,
  `semester` INT(1) DEFAULT NULL,
  PRIMARY KEY (`kd_mk`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuliah_d3`
--

INSERT INTO `kuliah_d3` (`kd_mk`, `nama_mk`, `sks`, `semester`) VALUES
('SE001', 'BASIS DATA', 2, 2),
('SE002', 'ALPRO 2', 3, 3),
('SE003', 'STATISTIKA', 3, 3),
('SE004', 'PEMROGRAMAN WEB', 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `kuliah_s1`
--

CREATE TABLE IF NOT EXISTS `kuliah_s1` (
  `kd_mk` CHAR(5) NOT NULL,
  `nama_mk` VARCHAR(20) DEFAULT NULL,
  `sks` INT(1) DEFAULT NULL,
  `semester` INT(1) DEFAULT NULL,
  PRIMARY KEY (`kd_mk`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuliah_s1`
--

INSERT INTO `kuliah_s1` (`kd_mk`, `nama_mk`, `sks`, `semester`) VALUES
('SE001', 'BASIS DATA', 2, 2),
('SE002', 'ALPRO 2', 3, 2),
('SE003', 'MADIS', 3, 3),
('SE004', 'TBO', 3, 5),
('SE005', 'PEMROGRAMAN WEB', 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE IF NOT EXISTS `loan` (
  `loan_number` CHAR(10) NOT NULL,
  `branch_name` VARCHAR(30) DEFAULT NULL,
  `amount` INT(6) DEFAULT NULL,
  PRIMARY KEY (`loan_number`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_number`, `branch_name`, `amount`) VALUES
('L-170', 'DOWNTOWN', 3000),
('L-230', 'REDWOOD', 4000),
('L-260', 'perryridge', 1700);

-- --------------------------------------------------------

--
-- Table structure for table `mhs`
--

CREATE TABLE IF NOT EXISTS `mhs` (
  `nim` CHAR(9) NOT NULL,
  `nama` VARCHAR(20) DEFAULT NULL,
  `alamat` VARCHAR(25) DEFAULT NULL,
  `tgl_lahir` DATE DEFAULT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mhs`
--

INSERT INTO `mhs` (`nim`, `nama`, `alamat`, `tgl_lahir`) VALUES
('99523001', 'Budi', 'jl.utama', '1995-12-12'),
('99523002', 'lita', 'jl.nenas', '1995-01-12'),
('99523003', 'Andi', 'jl.nenas', '1995-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `mhs_triger`
--

CREATE TABLE IF NOT EXISTS `mhs_triger` (
  `nim` CHAR(9) NOT NULL,
  `nama` VARCHAR(20) DEFAULT NULL,
  `alamat` VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mhs_triger`
--

INSERT INTO `mhs_triger` (`nim`, `nama`, `alamat`) VALUES
('99523001', 'Budi', 'jl.Durian'),
('99523002', 'Lita', 'jl.kuali'),
('99520330', 'Andi', 'jl.nenas'),
('99523004', 'Dita', 'jl.karya'),
('99523005', 'Desi', 'jl.Nangka');

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE IF NOT EXISTS `penilaian` (
  `nim` CHAR(9) DEFAULT NULL,
  `kd_mk` CHAR(5) DEFAULT NULL,
  `nilai` CHAR(1) DEFAULT NULL,
  KEY `FK_nilai` (`nim`),
  KEY `FK_nilai2` (`kd_mk`)
) ENGINE=INNODB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `penilaian`
--

INSERT INTO `penilaian` (`nim`, `kd_mk`, `nilai`) VALUES
('99523001', 'se001', 'A'),
('99523001', 'se002', 'B'),
('99523002', 'se002', 'C'),
('99523003', 'se003', 'A'),
('99523002', 'se001', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `r`
--

CREATE TABLE IF NOT EXISTS `r` (
  `A` CHAR(1) NOT NULL,
  `B` INT(1) DEFAULT NULL
) ENGINE=MYISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `r`
--

INSERT INTO `r` (`A`, `B`) VALUES
('a', 1),
('a', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `FK_jadwal` FOREIGN KEY (`kd_mk`) REFERENCES `kuliah` (`kd_mk`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_jadwal2` FOREIGN KEY (`kd_dosen`) REFERENCES `dosen` (`kd_dosen`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `FK_nilai` FOREIGN KEY (`nim`) REFERENCES `mhs` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_nilai2` FOREIGN KEY (`kd_mk`) REFERENCES `kuliah` (`kd_mk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT nama FROM dosen, jadwal WHERE dosen.`kd_dosen` = jadwal.`kd_dosen` AND jadwal.`hari`="selasa";

SELECT nama FROM dosen INNER JOIN jadwal ON dosen.`kd_dosen`=jadwal.`kd_dosen` WHERE jadwal.`hari`="selasa";

SELECT nama FROM dosen, jadwal WHERE dosen.`kd_dosen`= jadwal.`kd_dosen` AND jadwal.`hari`="senin" AND jadwal.`jam`="08.00" AND jadwal.`ruang`="301";

SELECT COUNT(kd_mk) AS jumlah FROM penilaian WHERE nim ="143510100";

SELECT mhs.nama FROM mhs, penilaian, kuliah WHERE mhs.`nim` = penilaian.`nim` AND kuliah.`kd_mk`= penilaian.`kd_mk` AND kuliah.`nama`="BASIS DATA" 
AND penilaian.`nilai`="A";

SELECT dosen.`nama` FROM dosen LEFT OUTER JOIN jadwal ON dosen.`kd_dosen`=jadwal.`kd_dosen` WHERE hari !="jum'at";

CREATE DATABASE uir_production;



