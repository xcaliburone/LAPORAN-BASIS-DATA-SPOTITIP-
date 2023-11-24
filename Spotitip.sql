-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

CREATE DATABASE IF NOT EXISTS `spotitip`;
USE `spotitip`;

CREATE TABLE IF NOT EXISTS `album` (
  `id_album` varchar(50) NOT NULL,
  `nama_album` varchar(50) DEFAULT NULL,
  `jmlh_lagu_album` int(12) DEFAULT NULL,
  `durasi_album` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `album` (`id_album`, `nama_album`, `jmlh_lagu_album`, `durasi_album`) VALUES
	('AL01', 'mahagita', 4, '00hr 20min'),
	('AL02', 'saka agari', 10, '00hr 50min'),
	('AL03', 'seishun girls', 12, '01hr 00min');

CREATE TABLE IF NOT EXISTS `artis` (
  `email_artis` varchar(50) NOT NULL,
  `nama_artis` varchar(50) DEFAULT NULL,
  `password_artis` varchar(50) DEFAULT NULL,
  `pengikut` int(12) DEFAULT NULL,
  PRIMARY KEY (`email_artis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `artis` (`email_artis`, `nama_artis`, `password_artis`, `pengikut`) VALUES
	('florashafiq@gmail.com', 'flora shafiqa', 'florisen321', 14744),
	('siscasaras@gmail.com', 'sisca saras', 'phisisca123', 42000),
	('zeeshafa@gmail.com', 'azizi shafa', 'zee1234', 15257);

CREATE TABLE IF NOT EXISTS `berisikan` (
  `id_playlist` varchar(50) DEFAULT NULL,
  `id_lagu` varchar(50) DEFAULT NULL,
  KEY `FK_berisikan_playlist` (`id_playlist`),
  KEY `FK_berisikan_lagu` (`id_lagu`),
  CONSTRAINT `FK_berisikan_lagu` FOREIGN KEY (`id_lagu`) REFERENCES `lagu` (`id_lagu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_berisikan_playlist` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id_playlist`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `berisikan` (`id_playlist`, `id_lagu`) VALUES
	('PL01', 'LG02'),
	('PL01', 'LG01'),
	('PL02', 'LG09'),
	('PL01', 'LG03'),
	('PL01', 'LG04'),
	('PL01', 'LG05'),
	('PL02', 'LG06'),
	('PL02', 'LG07'),
	('PL02', 'LG08'),
	('PL02', 'LG11'),
	('PL02', 'LG10'),
	('PL03', 'LG17'),
	('PL03', 'LG13'),
	('PL03', 'LG14'),
	('PL03', 'LG15'),
	('PL03', 'LG16'),
	('PL03', 'LG18'),
	('PL03', 'LG12'),
	('PL04', 'LG19'),
	('PL04', 'LG06'),
	('PL04', 'LG20'),
	('PL04', 'LG21'),
	('PL04', 'LG22'),
	('PL04', 'LG23'),
	('PL04', 'LG24'),
	('PL04', 'LG25'),
	('PL04', 'LG26'),
	('PL04', 'LG27'),
	('PL04', 'LG28'),
	('PL04', 'LG29');

CREATE TABLE IF NOT EXISTS `dikelompokkan` (
  `id_lagu` varchar(50) DEFAULT NULL,
  `id_single` varchar(50) DEFAULT NULL,
  `id_album` varchar(50) DEFAULT NULL,
  KEY `FK__single` (`id_single`),
  KEY `FK_dikelompokkan_album` (`id_album`),
  KEY `FK_dikelompokkan_lagu` (`id_lagu`),
  CONSTRAINT `FK__single` FOREIGN KEY (`id_single`) REFERENCES `single` (`id_single`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dikelompokkan_album` FOREIGN KEY (`id_album`) REFERENCES `album` (`id_album`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_dikelompokkan_lagu` FOREIGN KEY (`id_lagu`) REFERENCES `lagu` (`id_lagu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `dikelompokkan` (`id_lagu`, `id_single`, `id_album`) VALUES
	('LG02', NULL, 'AL01'),
	('LG03', NULL, 'AL01'),
	('LG01', 'SL01', NULL),
	('LG04', NULL, 'AL01'),
	('LG05', NULL, 'AL01'),
	('LG06', 'SL02', NULL),
	('LG07', NULL, 'AL02'),
	('LG08', NULL, 'AL02'),
	('LG09', NULL, 'AL02'),
	('LG10', NULL, 'AL02'),
	('LG11', NULL, 'AL02'),
	('LG12', NULL, 'AL02'),
	('LG13', NULL, 'AL02'),
	('LG14', NULL, 'AL02'),
	('LG15', NULL, 'AL02'),
	('LG16', NULL, 'AL02'),
	('LG17', 'SL03', NULL),
	('LG18', NULL, 'AL03'),
	('LG19', NULL, 'AL03'),
	('LG20', NULL, 'AL03'),
	('LG21', NULL, 'AL03'),
	('LG22', NULL, 'AL03'),
	('LG23', NULL, 'AL03'),
	('LG24', NULL, 'AL03'),
	('LG25', NULL, 'AL03'),
	('LG26', NULL, 'AL03'),
	('LG27', NULL, 'AL03'),
	('LG28', NULL, 'AL03'),
	('LG29', NULL, 'AL03');

CREATE TABLE IF NOT EXISTS `lagu` (
  `id_lagu` varchar(50) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `jmlh_pendengar` int(12) DEFAULT NULL,
  `durasi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_lagu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `lagu` (`id_lagu`, `judul`, `genre`, `jmlh_pendengar`, `durasi`) VALUES
	('LG01', 'flying high', 'Indonesian pop', 6331243, '00hr 5min'),
	('LG02', 'better', 'Indonesian pop', 363495, '00hr 5min'),
	('LG03', 'ingin bertemu', 'Indonesian pop', 641686, '00hr 5min'),
	('LG04', 'jiwaru days', 'Indonesian pop', 742464, '00hr 5min'),
	('LG05', 'telapak tangan', 'Indonesian pop', 36885, '00hr 5min'),
	('LG06', 'ilusi', 'jazz', 486899, '00hr 5min'),
	('LG07', 'dewi theater', 'Indonesian pop', 131935, '00hr 5min'),
	('LG08', 'honest man', 'rock', 8332199, '00hr 5min'),
	('LG09', 'angin kita', 'Indonesian pop', 211957, '00hr 5min'),
	('LG10', 'rapsodi', 'Indonesian pop', 68973517, '00hr 5min'),
	('LG11', 'seifuku no me', 'jazz', 361065, '00hr 5min'),
	('LG12', 'migikata', 'Indonesian pop', 283056, '00hr 5min'),
	('LG13', 'only today', 'jazz', 6518832, '00hr 5min'),
	('LG14', 'first rabbit', 'Indonesian pop', 2936407, '00hr 5min'),
	('LG15', 'beach sandal', 'Indonesian pop', 177733, '00hr 5min'),
	('LG16', 'blue rose', 'Indonesian pop', 134599, '00hr 5min'),
	('LG17', 'punkish', 'rock', 77285, '00hr 5min'),
	('LG18', 'glory days', 'Indonesian pop', 280235, '00hr 5min'),
	('LG19', 'waiting room', 'Indonesian pop', 216, '00hr 5min'),
	('LG20', 'himawari', 'Indonesian pop', 1769249, '00hr 5min'),
	('LG21', 'rider', 'Indonesian pop', 337720, '00hr 5min'),
	('LG22', 'tsukimisou', 'Indonesian pop', 82222, '00hr 5min'),
	('LG23', 'hagavi', 'Indonesian pop', 1642821, '00hr 5min'),
	('LG24', 'pajama drive', 'rock', 459610, '00hr 5min'),
	('LG25', 'finland miracle', 'Indonesian pop', 13074, '00hr 5min'),
	('LG26', 'tentang suratku', 'Indonesian pop', 79971, '00hr 5min'),
	('LG27', 'sobakasu no kiss', 'Indonesian pop', 41632, '00hr 5min'),
	('LG28', 'yakusoku yo', 'Indonesian pop', 359515, '00hr 5min'),
	('LG29', 'seventeen', 'Indonesian pop', 1818290, '00hr 5min');

CREATE TABLE IF NOT EXISTS `membuat` (
  `id_playlist` varchar(50) DEFAULT NULL,
  `email_user` varchar(50) DEFAULT NULL,
  `tgl_pembuatan` timestamp NULL DEFAULT current_timestamp(),
  KEY `FK_membuat_playlist` (`id_playlist`),
  KEY `FK_membuat_user` (`email_user`),
  CONSTRAINT `FK_membuat_playlist` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id_playlist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_membuat_user` FOREIGN KEY (`email_user`) REFERENCES `pengguna` (`email_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `membuat` (`id_playlist`, `email_user`, `tgl_pembuatan`) VALUES
	('PL01', 'adzanashalila@gmail.com', '2023-10-30 16:00:00'),
	('PL02', 'marshalenathea@gmail.com', '2021-07-11 16:00:00'),
	('PL03', 'shaniindira@gmail.com', '2022-03-04 16:00:00'),
	('PL04', 'adhimrahaman@gmail.com', '2022-12-31 16:00:00');

CREATE TABLE IF NOT EXISTS `merilis` (
  `email_artis` varchar(50) DEFAULT NULL,
  `id_lagu` varchar(50) DEFAULT NULL,
  KEY `FK__artis` (`email_artis`),
  KEY `FK__lagu` (`id_lagu`),
  CONSTRAINT `FK__artis` FOREIGN KEY (`email_artis`) REFERENCES `artis` (`email_artis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__lagu` FOREIGN KEY (`id_lagu`) REFERENCES `lagu` (`id_lagu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `merilis` (`email_artis`, `id_lagu`) VALUES
	('zeeshafa@gmail.com', 'LG02'),
	('florashafiq@gmail.com', 'LG22'),
	('florashafiq@gmail.com', 'LG23'),
	('zeeshafa@gmail.com', 'LG03'),
	('zeeshafa@gmail.com', 'LG04'),
	('zeeshafa@gmail.com', 'LG05'),
	('zeeshafa@gmail.com', 'LG07'),
	('zeeshafa@gmail.com', 'LG08'),
	('zeeshafa@gmail.com', 'LG09'),
	('zeeshafa@gmail.com', 'LG10'),
	('zeeshafa@gmail.com', 'LG01'),
	('siscasaras@gmail.com', 'LG12'),
	('siscasaras@gmail.com', 'LG13'),
	('siscasaras@gmail.com', 'LG14'),
	('siscasaras@gmail.com', 'LG15'),
	('siscasaras@gmail.com', 'LG16'),
	('siscasaras@gmail.com', 'LG17'),
	('siscasaras@gmail.com', 'LG18'),
	('siscasaras@gmail.com', 'LG19'),
	('siscasaras@gmail.com', 'LG20'),
	('siscasaras@gmail.com', 'LG11'),
	('florashafiq@gmail.com', 'LG24'),
	('florashafiq@gmail.com', 'LG25'),
	('florashafiq@gmail.com', 'LG26'),
	('florashafiq@gmail.com', 'LG27'),
	('florashafiq@gmail.com', 'LG28'),
	('florashafiq@gmail.com', 'LG29'),
	('florashafiq@gmail.com', 'LG21');

CREATE TABLE IF NOT EXISTS `pengguna` (
  `email_user` varchar(50) NOT NULL,
  `nama_akun` varchar(50) DEFAULT NULL,
  `password_user` varchar(50) DEFAULT NULL,
  `mengikuti` int(12) DEFAULT NULL,
  PRIMARY KEY (`email_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `pengguna` (`email_user`, `nama_akun`, `password_user`, `mengikuti`) VALUES
	('adhimrahaman@gmail.com', 'dhimz', 'adhmrhmn00', 28),
	('adzanashalila@gmail.com', 'ashel', 'ashel1234', 30),
	('marshalenathea@gmail.com', 'pucciri', 'maeng3110', 60),
	('shaniindira@gmail.com', 'shn', 'indira2431', 10);

CREATE TABLE IF NOT EXISTS `playlist` (
  `id_playlist` varchar(50) NOT NULL,
  `nama_playlist` varchar(50) DEFAULT NULL,
  `jmlh_lagu_playlist` int(12) DEFAULT NULL,
  `durasi_playlist` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_playlist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `playlist` (`id_playlist`, `nama_playlist`, `jmlh_lagu_playlist`, `durasi_playlist`) VALUES
	('PL01', 'get you off', 5, '00hr 25min'),
	('PL02', 'the sky is pretty ins’t it', 6, '00hr 30min'),
	('PL03', 'sayonara crawl', 7, '00hr 35min'),
	('PL04', 'what for?', 12, '01hr 00min');

CREATE TABLE IF NOT EXISTS `single` (
  `id_single` varchar(50) NOT NULL,
  `nama_single` varchar(50) DEFAULT NULL,
  `jmlh_lagu_single` int(12) DEFAULT NULL,
  `durasi_single` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_single`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

REPLACE INTO `single` (`id_single`, `nama_single`, `jmlh_lagu_single`, `durasi_single`) VALUES
	('SL01', 'flying high', 1, '00hr 05min'),
	('SL02', 'ilusi', 1, '00hr 05min'),
	('SL03', 'punkish', 1, '00hr 05min');
