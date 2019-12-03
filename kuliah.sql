-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Nov 2019 pada 08.04
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuliah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id` int(15) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `no_hp_lama` varchar(25) NOT NULL,
  `no_hp_baru` varchar(25) NOT NULL,
  `tgl_diubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id`, `nim`, `no_hp_lama`, `no_hp_baru`, `tgl_diubah`) VALUES
(1, '161240000523', '0895603611731', '0895603611754', '2019-11-11 11:27:52'),
(6, '123', '0987', '098700', '2019-11-11 11:59:38'),
(1, '161240000523', '0895603611754', '0895603611754', '2019-11-11 12:14:10'),
(2, '161240000482', '0852256789008', '0852256789008', '2019-11-11 12:14:15'),
(4, '161240000523', '089560567456', '089560567456', '2019-11-11 12:14:20'),
(4, '161240000523', '089560567456', '089560567456', '2019-11-11 12:14:26'),
(3, '161240000509', '082225678908', '082225678908', '2019-11-11 12:14:30'),
(5, '161240000510', '089560123456', '089560123456', '2019-11-11 12:14:38'),
(4, '161240000523', '089560567456', '089560567456', '2019-11-11 12:14:59'),
(4, '161240000523', '089560567456', '089560567456', '2019-11-11 12:15:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(15) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jk` varchar(25) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jk`, `no_hp`, `alamat`) VALUES
(1, '161240000523', 'Ananda Rizqi Winantasya', 'Perempuan', '0895603611754', 'Srobyong RT 4/RW 2, Mlonggo, Jepara'),
(2, '161240000482', 'Ana Nurul Ftmawati', 'Perempuan', '0852256789008', 'Bndengan RT 28/RW 7, Jepara, Jepara'),
(3, '161240000509', 'Sigma Luxvian', 'Perempuan', '082225678908', 'Cepogo RT 3/RW 3, Kembang, Jepara'),
(4, '161240000523', 'Catur Juliaming Rizqi', 'Laki-laki', '089560567456', 'Pengkol RT 24/RW 2, Jepara, Jepara'),
(5, '161240000510', 'Qorinul Hikam Ihsanillah', 'Laki-laki', '089560123456', 'Kauman RT 34/RW 2, Jepara, Jepara');

--
-- Trigger `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `update_nomor` BEFORE UPDATE ON `mahasiswa` FOR EACH ROW BEGIN
	INSERT INTO log
    SET id = OLD.id,
    nim = OLD.nim,
    no_hp_lama = OLD.no_hp,
    no_hp_baru = new.no_hp,
    tgl_diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tampil`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tampil` (
`id` int(15)
,`nim` varchar(15)
,`nama` varchar(25)
,`jk` varchar(25)
,`no_hp` varchar(15)
,`alamat` varchar(50)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `tampil`
--
DROP TABLE IF EXISTS `tampil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil`  AS  (select `mahasiswa`.`id` AS `id`,`mahasiswa`.`nim` AS `nim`,`mahasiswa`.`nama` AS `nama`,`mahasiswa`.`jk` AS `jk`,`mahasiswa`.`no_hp` AS `no_hp`,`mahasiswa`.`alamat` AS `alamat` from `mahasiswa`) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
