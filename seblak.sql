-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2025 at 02:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seblak`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `stok` int(100) NOT NULL,
  `harga` float(10,2) NOT NULL,
  `status` enum('Tersedia','Habis') DEFAULT 'Tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `stok`, `harga`, `status`) VALUES
(15241, 'Sosis Mozzarella', 30, 3000.00, 'Tersedia'),
(15315, 'Kerupuk Seblak', 14, 2000.00, 'Tersedia'),
(15522, 'Dumpling Keju', 66, 3000.00, 'Tersedia'),
(15722, 'Sayuran', 0, 2000.00, 'Habis'),
(15852, 'Bakso', 21, 2000.00, 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `nik`, `jenis_kelamin`, `alamat`, `no_hp`, `email`) VALUES
(87625, 'Izra R. R.', '8723521932783282', 'Laki-laki', 'Jl. Suka No. 29', '08175175991', 'izra@gmail.com'),
(98715, 'Rizky', '2882832938482684', 'Laki-laki', 'Jl. Tanah 200', '088373462858', 'rizky@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id_pemasukan` varchar(20) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `jumlah` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemasukan`
--

INSERT INTO `pemasukan` (`id_pemasukan`, `tanggal`, `jumlah`) VALUES
('PMSK-20250620', '2025-06-20 12:54:00', 73000.00),
('PMSK-20250622', '2025-06-22 16:40:00', 60000.00);

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` varchar(20) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `deskripsi` varchar(255) DEFAULT NULL,
  `jumlah` int(20) NOT NULL,
  `kategori` enum('bahan baku','gaji','sewa','listrik','lain-lain') DEFAULT 'lain-lain'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `tanggal`, `deskripsi`, `jumlah`, `kategori`) VALUES
('PNG-250622-144459', '2025-06-22 14:45:14', '-', 1000000, 'gaji'),
('PNG-250623-164258', '2025-06-23 16:43:10', 'semua menu', 2000000, 'bahan baku');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(25) NOT NULL,
  `nama_pembeli` varchar(100) NOT NULL,
  `topping` varchar(3000) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `tanggal_transaksi` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_transaksi` enum('baru','diproses','selesai','batal') DEFAULT 'baru',
  `metode_pembayaran` enum('cash','transfer','e-wallet') DEFAULT 'cash'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `nama_pembeli`, `topping`, `total_harga`, `tanggal_transaksi`, `status_transaksi`, `metode_pembayaran`) VALUES
('250620-2106-03679', 'izra', 'Bakso                     2                 4000.0\n', 4000.00, '2025-06-20 14:06:15', 'selesai', 'cash'),
('250620-2108-41298', 'izraRR', 'Bakso                     6                12000.0\nDumpling Keju             9                27000.0\n', 39000.00, '2025-06-20 14:09:22', 'selesai', 'e-wallet'),
('250620-2129-03394', 'izraaaa', 'Sosis Mozzarella          2                 6000.0\nKerupuk Seblak            2                 4000.0\n', 10000.00, '2025-06-20 14:29:27', 'selesai', 'e-wallet'),
('250620-2142-19516', 'izr', 'Sosis Mozzarella          2                 6000.0\nKerupuk Seblak            2                 4000.0\n', 10000.00, '2025-06-20 14:42:46', 'selesai', 'cash'),
('250620-2144-05366', 'izzz', 'Dumpling Keju             2                 6000.0\nKerupuk Seblak            2                 4000.0\n', 10000.00, '2025-06-20 14:44:20', 'selesai', 'cash'),
('250622-0946-07945', 'izzrraa', 'Level Pedas: Level 5\n----------------------------------\nDumpling Keju             2                 6000.0\nKerupuk Seblak            5                10000.0\n', 16000.00, '2025-06-22 02:47:04', 'selesai', 'transfer'),
('250622-1110-46505', 'iiiizz', 'Level Pedas: Level 3\n----------------------------------\nDumpling Keju             2                 6000.0\nSosis Mozzarella          2                 6000.0\n', 12000.00, '2025-06-22 04:11:04', 'selesai', 'cash'),
('250622-1112-57951', 'ia', 'Level Pedas: Level 4\n----------------------------------\nKerupuk Seblak            3                 6000.0\nSosis Mozzarella          2                 6000.0\n', 12000.00, '2025-06-22 04:14:27', 'selesai', 'transfer'),
('250622-1121-14582', 'izr', 'Level Pedas: Level 2\n----------------------------------\nBakso                     2                 4000.0\nKerupuk Seblak            2                 4000.0\n', 8000.00, '2025-06-22 04:21:52', 'selesai', 'cash'),
('250622-1516-46449', 'ii', 'Level Pedas: Level 3\n----------------------------------\nSosis Mozzarella          2                 6000.0\nBakso                     3                 6000.0\n', 12000.00, '2025-06-22 08:17:00', 'selesai', 'transfer'),
('250623-1645-12498', 'Rizky', 'Level Pedas: Level 2\n----------------------------------\nDumpling Keju             4                12000.0\nSosis Mozzarella          2                 6000.0\n', 18000.00, '2025-06-23 09:45:29', 'selesai', 'cash'),
('250623-1659-45548', 'Raya', 'Level Pedas: Level 4\n------------------------------------------------------\nKerupuk Seblak            2                 4000.0\nSosis Mozzarella          3                 9000.0\n', 13000.00, '2025-06-23 10:00:14', 'selesai', 'transfer'),
('250623-1702-35500', 'Sama', 'Level Pedas: Level 3\n------------------------------------------------------\nDumpling Keju             2                 6000.0\nSosis Mozzarella          1                 3000.0\n', 9000.00, '2025-06-23 10:02:51', 'selesai', 'e-wallet'),
('250623-1705-46950', 'Salx', 'Level Pedas: Level 1\n------------------------------------------------------\nBakso                     2                 4000.0\n', 4000.00, '2025-06-23 10:06:22', 'selesai', 'transfer'),
('250701-1943-06507', 'andre', 'Level Pedas: Level 4\n------------------------------------------------------\nBakso                     2                 4000.0\nDumpling Keju             2                 6000.0\nKerupuk Seblak            4                 8000.0\n', 18000.00, '2025-07-01 12:43:59', 'selesai', 'cash');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(3000) DEFAULT NULL,
  `akses` enum('Pegawai','Admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `akses`) VALUES
(2, 'izra', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'Admin'),
(3, 'rizky', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'Pegawai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17592;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98716;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
