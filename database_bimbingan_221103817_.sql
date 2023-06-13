-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2023 pada 09.44
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_bimbingan(221103817)`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bimbingan`
--

CREATE TABLE `tb_bimbingan` (
  `sk_bimbingan` varchar(27) NOT NULL,
  `nosurat` varchar(35) DEFAULT NULL,
  `nim` varchar(9) DEFAULT NULL,
  `judul_skripsi` longtext DEFAULT NULL,
  `nidn1` varchar(12) DEFAULT NULL,
  `nidn2` varchar(12) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_berakhir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_dosen`
--

CREATE TABLE `tb_dosen` (
  `nidn` varchar(20) NOT NULL,
  `nama_dosen` varchar(60) DEFAULT NULL,
  `jk_dosen` varchar(15) DEFAULT NULL,
  `alamat_dosen` varchar(100) DEFAULT NULL,
  `kontak_dosen` varchar(20) DEFAULT NULL,
  `email_dosen` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mhs`
--

CREATE TABLE `tb_mhs` (
  `nim` varchar(9) NOT NULL,
  `nama_mhs` varchar(60) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `nomor_kontak` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `jenis_kelamin` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outline`
--

CREATE TABLE `tb_outline` (
  `nodaftar` varchar(10) NOT NULL,
  `nim` varchar(9) DEFAULT NULL,
  `judul_skripsi` longtext DEFAULT NULL,
  `objek` varchar(30) DEFAULT NULL,
  `tanggal_daftar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sidang_outline`
--

CREATE TABLE `tb_sidang_outline` (
  `nosurat` varchar(35) NOT NULL,
  `nodaftar` varchar(10) DEFAULT NULL,
  `tglsurat` date DEFAULT NULL,
  `nim` varchar(9) DEFAULT NULL,
  `ketua` varchar(20) DEFAULT NULL,
  `sekretaris` varchar(20) DEFAULT NULL,
  `pembahas` varchar(20) DEFAULT NULL,
  `tglsidang` date DEFAULT NULL,
  `jamsidang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bimbingan`
--
ALTER TABLE `tb_bimbingan`
  ADD PRIMARY KEY (`sk_bimbingan`);

--
-- Indeks untuk tabel `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`nidn`);

--
-- Indeks untuk tabel `tb_mhs`
--
ALTER TABLE `tb_mhs`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tb_outline`
--
ALTER TABLE `tb_outline`
  ADD PRIMARY KEY (`nodaftar`);

--
-- Indeks untuk tabel `tb_sidang_outline`
--
ALTER TABLE `tb_sidang_outline`
  ADD PRIMARY KEY (`nosurat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
