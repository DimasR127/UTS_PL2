-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2021 at 03:06 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uts`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_spp_kelas`
--

CREATE TABLE `tb_spp_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL,
  `kompetensi_keahlian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_spp_kelas`
--

INSERT INTO `tb_spp_kelas` (`id_kelas`, `nama_kelas`, `kompetensi_keahlian`) VALUES
(1, 'C', 'Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `tb_spp_pembayaran`
--

CREATE TABLE `tb_spp_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `nisn` int(11) NOT NULL,
  `tgl_bayar` int(2) NOT NULL,
  `bulan_bayar` varchar(10) NOT NULL,
  `tahun_bayar` int(4) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_spp_pembayaran`
--

INSERT INTO `tb_spp_pembayaran` (`id_pembayaran`, `id_petugas`, `nisn`, `tgl_bayar`, `bulan_bayar`, `tahun_bayar`, `id_spp`, `jumlah_bayar`) VALUES
(1, 1, 1233442343, 24, '09', 2021, 1, 2100000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_spp_petugas`
--

CREATE TABLE `tb_spp_petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_petugas` varchar(20) NOT NULL,
  `level` enum('Administrator','Petugas','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_spp_petugas`
--

INSERT INTO `tb_spp_petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
(1, 'admin', 'admin123', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_spp_siswa`
--

CREATE TABLE `tb_spp_siswa` (
  `nisn` int(20) NOT NULL,
  `nis` int(10) NOT NULL,
  `nama` char(20) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `id_spp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_spp_siswa`
--

INSERT INTO `tb_spp_siswa` (`nisn`, `nis`, `nama`, `id_kelas`, `alamat`, `no_telp`, `id_spp`) VALUES
(1233442343, 11505044, 'Nano', 1, 'Jalan Dexas No 24', '089612342269', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_spp_spp`
--

CREATE TABLE `tb_spp_spp` (
  `id_spp` int(11) NOT NULL,
  `tahun` int(4) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_spp_spp`
--

INSERT INTO `tb_spp_spp` (`id_spp`, `tahun`, `nominal`) VALUES
(1, 2021, 50000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_spp_kelas`
--
ALTER TABLE `tb_spp_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_spp_pembayaran`
--
ALTER TABLE `tb_spp_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_spp` (`id_spp`),
  ADD KEY `id_spp_2` (`id_spp`);

--
-- Indexes for table `tb_spp_petugas`
--
ALTER TABLE `tb_spp_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tb_spp_siswa`
--
ALTER TABLE `tb_spp_siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_spp` (`id_spp`);

--
-- Indexes for table `tb_spp_spp`
--
ALTER TABLE `tb_spp_spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_spp_kelas`
--
ALTER TABLE `tb_spp_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_spp_pembayaran`
--
ALTER TABLE `tb_spp_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_spp_petugas`
--
ALTER TABLE `tb_spp_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_spp_siswa`
--
ALTER TABLE `tb_spp_siswa`
  MODIFY `nisn` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1233442344;

--
-- AUTO_INCREMENT for table `tb_spp_spp`
--
ALTER TABLE `tb_spp_spp`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_spp_pembayaran`
--
ALTER TABLE `tb_spp_pembayaran`
  ADD CONSTRAINT `tb_spp_pembayaran_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `tb_spp_petugas` (`id_petugas`),
  ADD CONSTRAINT `tb_spp_pembayaran_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `tb_spp_siswa` (`nisn`),
  ADD CONSTRAINT `tb_spp_pembayaran_ibfk_3` FOREIGN KEY (`id_spp`) REFERENCES `tb_spp_siswa` (`id_spp`);

--
-- Constraints for table `tb_spp_siswa`
--
ALTER TABLE `tb_spp_siswa`
  ADD CONSTRAINT `tb_spp_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_spp_kelas` (`id_kelas`),
  ADD CONSTRAINT `tb_spp_siswa_ibfk_2` FOREIGN KEY (`id_spp`) REFERENCES `tb_spp_spp` (`id_spp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
