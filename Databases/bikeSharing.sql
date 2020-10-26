-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 27 Iun 2019 la 10:10
-- Versiune server: 5.6.31
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikeSharing`
--

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `nume` varchar(64) COLLATE utf8_bin NOT NULL,
  `prenume` varchar(64) COLLATE utf8_bin NOT NULL,
  `parola` varchar(255) COLLATE utf8_bin NOT NULL,
  `cnp` varchar(13) COLLATE utf8_bin NOT NULL,
  `functie` enum('admin') COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `nume`, `prenume`, `parola`, `cnp`, `functie`) VALUES
(1, 'm.ion', 'matei', 'ion', 'qazaq', '1770404160701', 'admin'),
(2, 'v.andrei', 'velos', 'andrei', 'qazaq', '1800504160701', 'admin');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL,
  `motiv` varchar(255) COLLATE utf8_bin NOT NULL,
  `oferta_aleasa` int(11) NOT NULL,
  `durata` enum('1 luna','3 luni','6 luni','12 luni') COLLATE utf8_bin NOT NULL,
  `experienta_bic` enum('Da','Nu') COLLATE utf8_bin NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `application`
--

INSERT INTO `application` (`id`, `motiv`, `oferta_aleasa`, `durata`, `experienta_bic`, `id_user`) VALUES
(5, 'Placere', 3, '1 luna', 'Da', 1),
(6, 'Delegatie', 1, '3 luni', 'Nu', 7);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `bikes`
--

CREATE TABLE IF NOT EXISTS `bikes` (
  `id` int(11) NOT NULL,
  `firma` varchar(255) COLLATE utf8_bin NOT NULL,
  `model` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `bikes`
--

INSERT INTO `bikes` (`id`, `firma`, `model`) VALUES
(1, 'Pegas', 'urban ukII'),
(2, 'DHS', '2k300');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_card` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_app` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `documents`
--

INSERT INTO `documents` (`id`, `photo`, `id_card`, `id_user`, `id_app`) VALUES
(4, 'D:/NetBeansProjects/Upload/ich.jpg', 'D:/NetBeansProjects/Upload/cd402.jpg', 1, 5),
(5, 'D:/NetBeansProjects/Upload/icons.png', 'D:/NetBeansProjects/Upload/prolife.jpg', 7, 6);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `flux`
--

CREATE TABLE IF NOT EXISTS `flux` (
  `id_flux` int(11) NOT NULL,
  `docid` int(11) NOT NULL,
  `uploader` varchar(64) COLLATE utf8_bin NOT NULL,
  `status` enum('In aprobare','Aprobat','Respins') COLLATE utf8_bin NOT NULL DEFAULT 'In aprobare',
  `aprobat` enum('Da','Nu') COLLATE utf8_bin NOT NULL DEFAULT 'Nu',
  `moderator` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `mesaj` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `flux`
--

INSERT INTO `flux` (`id_flux`, `docid`, `uploader`, `status`, `aprobat`, `moderator`, `mesaj`) VALUES
(1, 4, 'popescu marian', 'Aprobat', 'Da', 'matei ion', 'Aprobat');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `oferte`
--

CREATE TABLE IF NOT EXISTS `oferte` (
  `id` int(11) NOT NULL,
  `titlu` int(11) NOT NULL,
  `pret` int(11) NOT NULL,
  `moneda` enum('ron','euro','dolari') COLLATE utf8_bin NOT NULL,
  `detalii` varchar(255) COLLATE utf8_bin NOT NULL,
  `constrangeri` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `oferte`
--

INSERT INTO `oferte` (`id`, `titlu`, `pret`, `moneda`, `detalii`, `constrangeri`) VALUES
(1, 1, 100, 'ron', 'Bicicleta pegas e ideala pentru deplasarile prin oras. ', 'Taxa se percepe per luna.'),
(3, 2, 89, 'ron', 'Bicicletele DHS sunt ideale pentru incepatori', 'Taxa se percepe per luna');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_bin DEFAULT 'unknown',
  `parola` varchar(64) COLLATE utf8_bin DEFAULT 'unknown',
  `nume` varchar(64) COLLATE utf8_bin NOT NULL,
  `prenume` varchar(64) COLLATE utf8_bin NOT NULL,
  `CNP` varchar(13) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `user`
--

INSERT INTO `user` (`userid`, `username`, `parola`, `nume`, `prenume`, `CNP`) VALUES
(1, 'p.marian', 'qazaq', 'popescu', 'marian', '1870922141033'),
(2, 'gigel', 'qazaq123', 'gheorghe', 'ionel', '1870202662211'),
(3, 'aladin', 'tester', 'aladin', 'naidin', '1770103131218'),
(4, 'test', 'test', 'test', 'test', '1870202662215'),
(5, 'marco.tuna', 'qazaq', 'Tuna', 'Marco', '1920707331415'),
(6, 'tester', 'tester', 'tester', 'tester', '1870202662211'),
(7, 'ettitest', 'qwerty', 'etti', 'test', '1870202662233');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user_address`
--

CREATE TABLE IF NOT EXISTS `user_address` (
  `id` int(11) NOT NULL,
  `adresa` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `oras` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tara` varchar(255) COLLATE utf8_bin NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `user_address`
--

INSERT INTO `user_address` (`id`, `adresa`, `oras`, `tara`, `id_user`) VALUES
(1, 'str lunga', 'bucuresti', 'Romania', 4),
(2, 'aleea pascuta', 'Bucuresti', 'Romania', 3),
(3, 'str lunga', 'Iasi', 'Romania', 5),
(4, 'Blv.Soimului', 'Cluj', 'Romania', 1),
(5, 'Blv.Soimului', 'Iasi', 'Romania', 2),
(6, 'etti', 'Bucuresti', 'Romania', 7);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `user_contacts`
--

CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL,
  `telefon` int(12) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Salvarea datelor din tabel `user_contacts`
--

INSERT INTO `user_contacts` (`id`, `telefon`, `email`, `id_user`) VALUES
(2, 740594483, 'testt@yahoo.com', 4),
(3, 723456789, 'testt22@yahoo.com', 3),
(4, 723456777, 'waffle@yahoo.com', 5),
(5, 723456766, 'tester@test.com', 1),
(6, 740594483, 'tester@test.com', 2),
(7, 740594488, 'etti@etti.ro', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oferta_aleasa` (`oferta_aleasa`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_oferta` (`id_app`);

--
-- Indexes for table `flux`
--
ALTER TABLE `flux`
  ADD PRIMARY KEY (`id_flux`),
  ADD KEY `docid` (`docid`),
  ADD KEY `uploader` (`uploader`),
  ADD KEY `id_status` (`status`),
  ADD KEY `was_sign` (`aprobat`),
  ADD KEY `id_mesaj` (`mesaj`);

--
-- Indexes for table `oferte`
--
ALTER TABLE `oferte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `titlu` (`titlu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `bikes`
--
ALTER TABLE `bikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `flux`
--
ALTER TABLE `flux`
  MODIFY `id_flux` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oferte`
--
ALTER TABLE `oferte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_contacts`
--
ALTER TABLE `user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Restrictii pentru tabele sterse
--

--
-- Restrictii pentru tabele `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `fk_appoferta` FOREIGN KEY (`oferta_aleasa`) REFERENCES `oferte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appuser` FOREIGN KEY (`id_user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrictii pentru tabele `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_doc` FOREIGN KEY (`id_app`) REFERENCES `application` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documente` FOREIGN KEY (`id_user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrictii pentru tabele `flux`
--
ALTER TABLE `flux`
  ADD CONSTRAINT `fk_flux1` FOREIGN KEY (`docid`) REFERENCES `documents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrictii pentru tabele `oferte`
--
ALTER TABLE `oferte`
  ADD CONSTRAINT `fk_bikes` FOREIGN KEY (`titlu`) REFERENCES `bikes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrictii pentru tabele `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `fk_adrese` FOREIGN KEY (`id_user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrictii pentru tabele `user_contacts`
--
ALTER TABLE `user_contacts`
  ADD CONSTRAINT `fk_contacte` FOREIGN KEY (`id_user`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
