-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2020 at 08:23 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan_hp`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_akun`
--

CREATE TABLE `db_akun` (
  `no_akun` int(11) NOT NULL,
  `nm_akun` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `db_barang`
--

CREATE TABLE `db_barang` (
  `kd_brg` int(11) NOT NULL,
  `nm_brg` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_barang`
--

INSERT INTO `db_barang` (`kd_brg`, `nm_brg`, `harga`, `stock`) VALUES
(1, 'Xiaomi redmi note 5', 2000000, 12);

-- --------------------------------------------------------

--
-- Table structure for table `db_detailreturn`
--

CREATE TABLE `db_detailreturn` (
  `no_return` int(11) NOT NULL,
  `kd_brg` int(11) NOT NULL,
  `qty_return` int(11) NOT NULL,
  `sub_return` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `db_jurnal`
--

CREATE TABLE `db_jurnal` (
  `no_jurnal` int(11) NOT NULL,
  `no_akun` int(11) NOT NULL,
  `debet` int(11) NOT NULL,
  `kredit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `db_pembelian`
--

CREATE TABLE `db_pembelian` (
  `no_beli` int(11) NOT NULL,
  `tgl_beli` date NOT NULL,
  `no_faktur` int(11) NOT NULL,
  `total_beli` int(11) NOT NULL,
  `no_pesan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `db_pesanan`
--

CREATE TABLE `db_pesanan` (
  `no_pesanan` varchar(11) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `total` int(11) NOT NULL,
  `kd_supp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `db_return`
--

CREATE TABLE `db_return` (
  `no_return` int(8) NOT NULL,
  `tgl_return` date NOT NULL,
  `total_return` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `db_supplier`
--

CREATE TABLE `db_supplier` (
  `kd_supp` int(11) NOT NULL,
  `nm_supp` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `tlp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `db_user`
--

CREATE TABLE `db_user` (
  `id_user` int(11) NOT NULL,
  `nm_user` int(11) NOT NULL,
  `hak_akses` int(11) NOT NULL,
  `pass` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `no_pesanan` int(11) NOT NULL,
  `kd_brg` int(11) NOT NULL,
  `qty_pesan` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurnal`
--

CREATE TABLE `tbl_jurnal` (
  `no_jurnal` int(11) NOT NULL,
  `tgl_jurnal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_akun`
--
ALTER TABLE `db_akun`
  ADD PRIMARY KEY (`no_akun`);

--
-- Indexes for table `db_barang`
--
ALTER TABLE `db_barang`
  ADD PRIMARY KEY (`kd_brg`);

--
-- Indexes for table `db_pembelian`
--
ALTER TABLE `db_pembelian`
  ADD PRIMARY KEY (`no_beli`);

--
-- Indexes for table `db_pesanan`
--
ALTER TABLE `db_pesanan`
  ADD PRIMARY KEY (`no_pesanan`);

--
-- Indexes for table `db_return`
--
ALTER TABLE `db_return`
  ADD PRIMARY KEY (`no_return`);

--
-- Indexes for table `db_supplier`
--
ALTER TABLE `db_supplier`
  ADD PRIMARY KEY (`kd_supp`);

--
-- Indexes for table `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD KEY `no_pesanan` (`no_pesanan`,`kd_brg`),
  ADD KEY `no_pesanan_3` (`no_pesanan`),
  ADD KEY `no_pesanan_2` (`no_pesanan`,`kd_brg`) USING BTREE,
  ADD KEY `no_pesanan_4` (`no_pesanan`,`kd_brg`) USING BTREE;

--
-- Indexes for table `tbl_jurnal`
--
ALTER TABLE `tbl_jurnal`
  ADD PRIMARY KEY (`no_jurnal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_akun`
--
ALTER TABLE `db_akun`
  MODIFY `no_akun` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_barang`
--
ALTER TABLE `db_barang`
  MODIFY `kd_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_pembelian`
--
ALTER TABLE `db_pembelian`
  MODIFY `no_beli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_return`
--
ALTER TABLE `db_return`
  MODIFY `no_return` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_supplier`
--
ALTER TABLE `db_supplier`
  MODIFY `kd_supp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
