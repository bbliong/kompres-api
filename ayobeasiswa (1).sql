-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Agu 2018 pada 19.28
-- Versi server: 10.1.32-MariaDB
-- Versi PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ayobeasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `caa`
--

CREATE TABLE `caa` (
  `id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `caa`
--

INSERT INTO `caa` (`id`) VALUES
('R001'),
('R002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `judul` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_gambar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `judul`, `konten`, `alamat_gambar`, `created_at`, `updated_at`) VALUES
(1, 'komputer', 'Beasiswa komputer merupakan suatu beasiswa yang diberikan kepada siapa saja yang memiiki minat dalam hal  yang menyangkut komputer', '/img/cat/computer.jpeg', NULL, NULL),
(2, 'luar negeri', 'beasiswa luar negeri', '/img/cat/luar.jpeg', NULL, NULL),
(3, 'mahasiswa', 'beasiswa mahasiswa', '/img/cat/studeng.jpeg', NULL, NULL),
(4, 'yayasan', 'beasiswa yayasan', '/img/cat/yayasan.jpg', NULL, NULL),
(5, 'bantuan', 'beasiswa bantuan', '/img/cat/help.jpeg', NULL, NULL),
(6, 'penghargaan', 'beasiswa penghargaan merupakan suatu beasiswa yang diberikan kepada para siswa atau mahasiswa yang memiliki penghargaan dalam bidang apapun', '/img/cat/award.jpeg', NULL, NULL),
(7, 'penelitian', 'beasiswa penelitian', '/img/cat/penelitian.jpeg', NULL, NULL),
(8, 'olahraga', 'beasiswa olahraga', '/img/cat/olharaga.jpg', NULL, NULL),
(9, 'swasta', 'beasiswa swasta', '/img/cat/swasta.jpeg', NULL, NULL),
(10, 'dalam negeri', 'beasiswa dalam negeri', '/img/cat/dalam.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_scholarships`
--

CREATE TABLE `category_scholarships` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `scholarship_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `category_scholarships`
--

INSERT INTO `category_scholarships` (`id`, `category_id`, `scholarship_id`, `created_at`, `updated_at`) VALUES
(353, 2, 30, NULL, NULL),
(378, 1, 29, NULL, NULL),
(379, 2, 29, NULL, NULL),
(380, 3, 29, NULL, NULL),
(381, 4, 29, NULL, NULL),
(382, 5, 29, NULL, NULL),
(383, 6, 29, NULL, NULL),
(415, 1, 31, NULL, NULL),
(416, 2, 31, NULL, NULL),
(417, 3, 31, NULL, NULL),
(418, 4, 31, NULL, NULL),
(419, 5, 31, NULL, NULL),
(420, 6, 31, NULL, NULL),
(421, 7, 31, NULL, NULL),
(422, 8, 31, NULL, NULL),
(423, 9, 31, NULL, NULL),
(424, 10, 31, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `facilitator_id` int(10) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `emails`
--

INSERT INTO `emails` (`id`, `facilitator_id`, `subject`, `email`, `konten`, `status`, `created_at`, `updated_at`) VALUES
(7, 33, 'Selamat', '[\"lolitrack97@gmail.com\"]', 'Selamat anda diterima', 1, '2018-07-25 22:16:53', '2018-07-25 22:18:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `facilitators`
--

CREATE TABLE `facilitators` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_instansi` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi_instansi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` int(2) DEFAULT NULL,
  `berkas_pendukung` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token_facilitator` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `str_slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `no_tempat` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_jalan` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kecamatan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelurahan` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provinsi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_pos` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `facilitators`
--

INSERT INTO `facilitators` (`id`, `nama_instansi`, `deskripsi_instansi`, `kategori`, `berkas_pendukung`, `img_url`, `user_id`, `token_facilitator`, `status`, `str_slug`, `created_at`, `updated_at`, `alamat`, `no_tempat`, `nama_jalan`, `kecamatan`, `kelurahan`, `provinsi`, `kota`, `kode_pos`, `lat`, `lng`) VALUES
(28, 'admin', 'admin', 1, '', '', 70, 'AYeqUeyMmNdU57CyThjk', 1, 'admin', '2018-07-23 09:45:53', '2018-07-23 10:00:15', 'Perumahan taman melati, Jalan Taman Melati, Pengasinan, Kota Depok, Jawa Barat, Indonesia', '39', 'Jalan Taman Melati tirta ', 'Sawangan', 'Bojong Sari', 'West Java', 'Depok City', '16517', '-6.4164534', '106.75369109999997'),
(33, 'Hacktiv8', 'perusahaan yang bergerak dalam bidang komputer', 1, 'public/facilitators/Y4rSUeRPRP7JNNkcksRD/profile.png', 'public/facilitators/Y4rSUeRPRP7JNNkcksRD/profile.png', 77, 'Y4rSUeRPRP7JNNkcksRD', 1, 'hacktiv8', '2018-07-25 22:02:14', '2018-08-23 09:10:13', 'Hacktiv8 Indonesia, RT.5/RW.9, Kebayoran Lama Selatan, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta, Indonesia', NULL, NULL, 'Kebayoran Lama', 'Kebayoran Lama Selatan', 'Daerah Khusus Ibukota Jakarta', 'Kota Jakarta Selatan', '12240', '-6.2607187', '106.78161620000003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2018_03_02_091221_create_users_table', 1),
(3, '2018_03_02_091945_create_scholarships_table', 1),
(4, '2018_03_02_092026_create_categories_table', 1),
(5, '2018_03_02_160221_create_beasiswa_kategori_table', 1),
(6, '2018_03_02_163024_create_facilitator_table', 1),
(7, '2018_03_02_160132_create_users_beasiswa_table', 2),
(8, '2018_03_03_121800_create_facilitator_scholarship', 3),
(9, '2018_05_15_071016_update_slug_user', 4),
(10, '2018_05_16_092847_updateUserAddress', 5),
(12, '2018_05_19_054343_createaBerkas', 6),
(13, '2018_07_23_025741_create_emails_table', 7),
(14, '2018_07_25_024354_create_jobs_table', 8),
(15, '2018_07_25_024422_create_failed_jobs_table', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `scholarships`
--

CREATE TABLE `scholarships` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama_beasiswa` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quota` int(11) NOT NULL,
  `konten` longtext COLLATE utf8mb4_unicode_ci,
  `alamat_gambar` text COLLATE utf8mb4_unicode_ci,
  `masa_berlaku` date NOT NULL,
  `prioritas` tinyint(1) NOT NULL DEFAULT '0',
  `str_slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `facilitator_id` int(10) UNSIGNED NOT NULL,
  `berkas_diri` int(11) NOT NULL DEFAULT '0',
  `ijazah` int(11) NOT NULL DEFAULT '0',
  `organisasi` int(11) NOT NULL DEFAULT '0',
  `sp_beasiswa` int(11) NOT NULL DEFAULT '0',
  `berkas_keluarga` int(11) NOT NULL DEFAULT '0',
  `berkas_lain` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `scholarships`
--

INSERT INTO `scholarships` (`id`, `nama_beasiswa`, `quota`, `konten`, `alamat_gambar`, `masa_berlaku`, `prioritas`, `str_slug`, `status`, `facilitator_id`, `berkas_diri`, `ijazah`, `organisasi`, `sp_beasiswa`, `berkas_keluarga`, `berkas_lain`, `created_at`, `updated_at`) VALUES
(29, 'Kudo Scholarship Programming', 100, '<p>                <span style=\"color: rgb(128, 128, 128); font-family: Lato, Verdana, Helvetica, sans-serif; font-size: 16.8px; text-align: justify;\">Hacktiv8 merupakan lembaga pendidikan informal di bidang teknologi yang percaya bahwa setiap orang memiliki potensi untuk menjadi programmer kelas dunia jika diberikan wadah pengembangan diri yang sesuai. Hacktiv8 memberikan coding bootcamp yang dapat mentransformasi seseorang menjadi programmer dengan skill mumpuni. Saat ini lulusan dari Hacktiv8 berhasil mendapatkan pekerjaan sebagai programmer berbagai perusahaan teknologi selama kurang dari 90 hari. Kamu dapat mengetahui programnya melalui video di samping kiri ini.</span></p>', 'public/facilitators/Y4rSUeRPRP7JNNkcksRD/beasiswa/kudo-scholarship-programming.jpg', '2017-09-07', 0, 'kudo-scholarship-programming', 1, 33, 1, 1, 1, 0, 0, '0', '2018-07-25 22:08:13', '2018-08-23 10:13:41'),
(30, 'HALO', 100, 'Tuliskan deskripsi anda disiniSSSS', 'public/facilitators/Y4rSUeRPRP7JNNkcksRD/beasiswa/halo.jpg', '2017-09-07', 0, 'halo', 1, 33, 0, 0, 0, 0, 1, NULL, '2018-07-29 19:27:30', '2018-07-29 19:42:16'),
(31, 'asdasd', 1212, 'asdasdasdasdasdadasda', 'public/facilitators/Y4rSUeRPRP7JNNkcksRD/beasiswa/asdasd.jpg', '2017-09-19', 0, 'asdasd', 1, 33, 0, 1, 0, 0, 0, 'asdasd', '2018-08-23 10:15:45', '2018-08-23 10:22:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendidikan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `img_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `str_slug` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_kelamin` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'L',
  `tanggal_lahir` date DEFAULT NULL,
  `nama_depan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_belakang` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_panggilan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp_hp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_1` text COLLATE utf8mb4_unicode_ci,
  `alamat_2` text COLLATE utf8mb4_unicode_ci,
  `provinsi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kota` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_pos` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aktifitas_terakhir` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `berkas_diri` text COLLATE utf8mb4_unicode_ci,
  `ijazah` text COLLATE utf8mb4_unicode_ci,
  `organisasi` text COLLATE utf8mb4_unicode_ci,
  `sp_beasiswa` text COLLATE utf8mb4_unicode_ci,
  `berkas_keluarga` text COLLATE utf8mb4_unicode_ci,
  `berkas_pendukung` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `pendidikan`, `telp`, `role`, `status`, `img_url`, `token`, `remember_token`, `created_at`, `updated_at`, `str_slug`, `jenis_kelamin`, `tanggal_lahir`, `nama_depan`, `nama_belakang`, `nama_panggilan`, `telp_hp`, `alamat_1`, `alamat_2`, `provinsi`, `kota`, `kode_pos`, `aktifitas_terakhir`, `berkas_diri`, `ijazah`, `organisasi`, `sp_beasiswa`, `berkas_keluarga`, `berkas_pendukung`) VALUES
(70, 'superadmin', 'ariaelhamidy@gmail.com', '$2y$10$EiYYI7w5hNNE93fqaZwEauAuhXILkRg2L4WestTXkac0hM95ot56.', NULL, NULL, 99, 1, 'public/users/aMuMCxH2L9ugZk7alaRB/profile.png', 'aMuMCxH2L9ugZk7alaRB', 'kyIthG01KBayOMrcomRqu1X3mONXnoeeLyE9RdDPDMD9mMAgDoUL0zD1wnNX', '2018-07-23 07:24:40', '2018-08-23 06:36:22', 'superadmin', 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 13:36:21', NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'ariaelhamidy', 'aria.samudera97@gmail.com', '$2y$10$9A4xjDBvtqR4icARD1AWF.KakT/cnHii5RU4zquOTMoPNA0AmBy/O', 'Kuliah', '(021)-111111', 2, 1, NULL, 'iZ3nc5wOAIpAEG5NqwgI', '0cILXYa3OY3q8Bf56BYkIiIKiNvahbnBvyWD7WdnWGVJ5TP4UUF4eNpbfe5E', '2018-07-25 21:59:05', '2018-08-23 08:14:12', 'ariaelhamidy', 'L', NULL, 'aria', 'samudera', 'ase', '0896-3455-5083', 'taman', NULL, 'Jawa Barat', 'Kota Depok', '16517', '2018-08-23 15:14:12', NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'ical', 'frfariz9@gmail.com', '$2y$10$V81wfrBWpel0tOAqXZJ5re03o9Ta1SCsr/fPGmZpCunlC9fYMKa/a', NULL, NULL, 1, 1, NULL, '8b6BTCAnYB9a7VgBuNuZ', 'a0xpv1tWzzNeW8IDReHbHeASPfB83i9IIBS66gONQWxjlGRDiA7AlbQvzIcK', '2018-07-28 03:16:11', '2018-07-28 03:30:42', 'ical', 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-28 10:30:42', NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'agungse', 'realaingjurig@gmail.com', '$2y$10$MA03TfN4EjNU/0rVQlzOneH0OcQxgICkpv4pEo6VNxL4AFTbwb8/6', NULL, NULL, 1, 1, 'public/users/E2ahLY1WfoZHx9m6Cbat/profile.png', 'E2ahLY1WfoZHx9m6Cbat', NULL, '2018-08-23 09:13:05', '2018-08-23 09:27:02', 'agungse', 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 16:13:05', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/berkas_diri_AkXCKxE0eT.png', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/ijazah_MAA0WCDGUn.jpg', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/organisasi_unEUeX8Dar.png', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/sp_beasiswa_8gJDofu3Mu.jpg', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/berkas_keluarga_RNCqMQYpv1.jpg', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/berkas_pendukung_RjqL2VuYpC.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_scholarship`
--

CREATE TABLE `user_scholarship` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `scholarship_id` int(10) UNSIGNED NOT NULL,
  `berkas_diri` text COLLATE utf8mb4_unicode_ci,
  `ijazah` text COLLATE utf8mb4_unicode_ci,
  `organisasi` text COLLATE utf8mb4_unicode_ci,
  `sp_beasiswa` text COLLATE utf8mb4_unicode_ci,
  `berkas_keluarga` text COLLATE utf8mb4_unicode_ci,
  `berkas_pendukung` text COLLATE utf8mb4_unicode_ci,
  `berkas_lain` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_scholarship`
--

INSERT INTO `user_scholarship` (`id`, `user_id`, `scholarship_id`, `berkas_diri`, `ijazah`, `organisasi`, `sp_beasiswa`, `berkas_keluarga`, `berkas_pendukung`, `berkas_lain`, `status`, `created_at`, `updated_at`) VALUES
(28, 78, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Tolak', '2018-07-28 04:30:25', '2018-07-28 04:30:25'),
(30, 79, 29, 'public/users/E2ahLY1WfoZHx9m6Cbat/files/berkas_diri_AkXCKxE0eT.png', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/ijazah_MAA0WCDGUn.jpg', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/organisasi_unEUeX8Dar.png', NULL, NULL, 'public/users/E2ahLY1WfoZHx9m6Cbat/files/berkas_pendukung_RjqL2VuYpC.png', 'public/facilitators/Y4rSUeRPRP7JNNkcksRD/files/79/29_4GZtUUo7Dq.jpg', 'Terima', '2018-08-23 09:22:30', '2018-08-23 10:13:52'),
(31, 79, 30, NULL, NULL, NULL, NULL, 'public/users/E2ahLY1WfoZHx9m6Cbat/files/berkas_keluarga_RNCqMQYpv1.jpg', 'public/users/E2ahLY1WfoZHx9m6Cbat/files/berkas_pendukung_RjqL2VuYpC.png', NULL, 'Menunggu', '2018-08-23 09:35:47', '2018-08-23 09:35:59'),
(32, 79, 31, NULL, 'public/users/E2ahLY1WfoZHx9m6Cbat/files/ijazah_MAA0WCDGUn.jpg', NULL, NULL, NULL, NULL, 'public/facilitators/Y4rSUeRPRP7JNNkcksRD/files/79/31_mo3wgfz83C.jpg', 'Menunggu', '2018-08-23 10:17:26', '2018-08-23 10:25:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category_scholarships`
--
ALTER TABLE `category_scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `beasiswa_kategori_category_id_foreign` (`category_id`),
  ADD KEY `beasiswa_kategori_scholarship_id_foreign` (`scholarship_id`);

--
-- Indeks untuk tabel `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emails_facilitator_id_foreign` (`facilitator_id`);

--
-- Indeks untuk tabel `facilitators`
--
ALTER TABLE `facilitators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facilitators_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_facilitator_id_foreign` (`facilitator_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `user_scholarship`
--
ALTER TABLE `user_scholarship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_scholarship_user_id_foreign` (`user_id`),
  ADD KEY `user_scholarship_scholarship_id_foreign` (`scholarship_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `category_scholarships`
--
ALTER TABLE `category_scholarships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT untuk tabel `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `facilitators`
--
ALTER TABLE `facilitators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT untuk tabel `user_scholarship`
--
ALTER TABLE `user_scholarship`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `category_scholarships`
--
ALTER TABLE `category_scholarships`
  ADD CONSTRAINT `beasiswa_kategori_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `beasiswa_kategori_scholarship_id_foreign` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_facilitator_id_foreign` FOREIGN KEY (`facilitator_id`) REFERENCES `facilitators` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `facilitators`
--
ALTER TABLE `facilitators`
  ADD CONSTRAINT `facilitators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `scholarships`
--
ALTER TABLE `scholarships`
  ADD CONSTRAINT `scholarships_facilitator_id_foreign` FOREIGN KEY (`facilitator_id`) REFERENCES `facilitators` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_scholarship`
--
ALTER TABLE `user_scholarship`
  ADD CONSTRAINT `user_scholarship_scholarship_id_foreign` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarships` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_scholarship_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
