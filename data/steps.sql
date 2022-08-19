SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `steps`
--
CREATE DATABASE IF NOT EXISTS `steps` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `steps`;

-- --------------------------------------------------------
CREATE USER IF NOT EXISTS 'root_fswd' @'localhost' IDENTIFIED BY 'root_fswd';
GRANT ALL PRIVILEGES ON *.* TO 'root_fswd' @'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

--
-- Tabelstructuur voor tabel `tblAbonnement`
--

DROP TABLE IF EXISTS `tblAbonnement`;
CREATE TABLE `tblAbonnement` (
  `idAbonnement` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `omschrijving` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `tblAbonnement`
--

INSERT INTO `tblAbonnement` (`idAbonnement`, `naam`, `omschrijving`) VALUES
(1, 'All you can drive', 'Betaal een vaste prijs per maand, je mag zoveel rijden als je wilt'),
(2, 'Pay as you go', 'Betaal voor elke rit afzonderlijk. Je betaalt 1,5 voor elke 15 minuten');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tblDropOffZone`
--

DROP TABLE IF EXISTS `tblDropOffZone`;
CREATE TABLE `tblDropOffZone` (
  `idDropOffZone` int(11) NOT NULL,
  `omschrijving` varchar(50) NOT NULL,
  `straat` varchar(45) DEFAULT NULL,
  `huisnr` varchar(45) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `tblDropOffZone`
--

INSERT INTO `tblDropOffZone` (`idDropOffZone`, `omschrijving`, `straat`, `huisnr`, `latitude`, `longitude`) VALUES
(1, 'Howest Campus Weide', 'Sint-Martens-Latemlaan', '1B', '50.82230600', '3.25103670'),
(2, 'Grote Markt', 'Grote Markt', '1', '50.82673780', '3.26506160'),
(3, 'Station', 'Stationsplein', '8', '50.82264220', '3.26103380');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tblHuurstep`
--

DROP TABLE IF EXISTS `tblHuurstep`;
CREATE TABLE `tblHuurstep` (
  `idHuurstep` int(11) NOT NULL,
  `serienummer` varchar(45) DEFAULT NULL,
  `kleur` varchar(45) DEFAULT NULL,
  `isdefect` tinyint(4) DEFAULT NULL,
  `idDropOffZone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `tblHuurstep`
--

INSERT INTO `tblHuurstep` (`idHuurstep`, `serienummer`, `kleur`, `isdefect`, `idDropOffZone`) VALUES
(1, 'JH4KB16697C347175', 'Orange', 1, 1),
(2, '1GYUKFEJ4AR834926', 'Orange', 0, 1),
(3, '4T1BF1FK9CU909496', 'Red', 0, 1),
(4, '1C4RJEAG5FC348901', 'Blue', 0, NULL),
(5, '2LNBL8CV7AX960663', 'Maroon', 0, 3),
(6, 'JM3TB2BV3E0744931', 'Goldenrod', 1, 1),
(7, '2HNYD18283H480902', 'Maroon', 0, 1),
(8, 'WBA3B5C53FP301662', 'Green', 0, 3),
(9, 'WAUEFAFLXFA432042', 'Fuscia', 0, 1),
(10, 'WAUVT68E53A734919', 'Violet', 0, 2),
(11, '19XFB2E57EE584027', 'Crimson', 0, NULL),
(12, 'WAUKH78E08A458277', 'Teal', 1, 2),
(13, 'WAUJC58E62A304954', 'Turquoise', 0, 2),
(14, '3N1CE2CP8EL275325', 'Maroon', 0, 1),
(15, 'ZFBCFADH9FZ833501', 'Goldenrod', 0, 2),
(16, 'WVWBB7AJ1DW245878', 'Fuscia', 0, 1),
(17, '1N4AL2EP6DC946448', 'Crimson', 0, 1),
(18, 'SCBET9ZA4F8005759', 'Purple', 0, 2),
(19, '2HKRM3H53FH479023', 'Puce', 0, 1),
(20, '19UUA56762A880913', 'Turquoise', 0, 2),
(21, 'WBAKP9C59FD871106', 'Violet', 0, 2),
(22, 'WAUEFAFL4EN359757', 'Green', 0, NULL),
(23, '2HNYD2H37CH719175', 'Blue', 0, 2),
(24, 'SCBLC47J89C274636', 'Aquamarine', 0, 2),
(25, '1N6AD0CW2FN081570', 'Red', 0, 3),
(26, 'JTDKN3DP8D3803954', 'Maroon', 0, 3),
(27, 'WP0CB2A84FS875053', 'Green', 0, 2),
(28, 'YV1612FS5E2656566', 'Khaki', 0, 3),
(29, 'JTHBE1BL0FA240268', 'Fuscia', 0, 3),
(30, 'SCBDC47L57C529794', 'Orange', 1, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tblKlant`
--

DROP TABLE IF EXISTS `tblKlant`;
CREATE TABLE `tblKlant` (
  `idKlant` int(11) NOT NULL,
  `voornaam` varchar(50) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `visanummer` varchar(20) DEFAULT NULL,
  `idAbonnement` int(11) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `tblKlant`
--

INSERT INTO `tblKlant` (`idKlant`, `voornaam`, `naam`, `visanummer`, `idAbonnement`, `email`) VALUES
(1, 'Anselma', 'Duigenan', '4017950613711067', 2, 'aduigenan0@livejournal.com'),
(2, 'Anselma', 'Duigenan', '4017950613711067', 2, 'aduigenan0@livejournal.com'),
(3, 'Rosabelle', 'Boreham', NULL, 2, 'rboreham1@nyu.edu'),
(4, 'Celle', 'Mancktelow', '4041595731340', 1, 'cmancktelow2@mit.edu'),
(5, 'Ursola', 'Cluely', '4041377591185', 1, 'ucluely3@nymag.com'),
(6, 'Garrott', 'Giottoi', '4041371978883', 1, 'ggiottoi4@blogtalkradio.com'),
(7, 'Geri', 'Janicki', '4391366921228', 1, 'gjanicki5@vistaprint.com'),
(8, 'Dahlia', 'Roan', '4245734974389455', 2, 'droan6@aboutads.info'),
(9, 'Chantalle', 'Grissett', '4017956096750936', 1, 'cgrissett7@mtv.com'),
(10, 'Iona', 'Ringham', '4305119133253', 1, 'iringham8@intel.com'),
(11, 'Daren', 'O\'Hannigan', '4017955179438880', 2, 'dohannigan9@ibm.com'),
(12, 'Lynn', 'Prydden', '4041591905209152', 2, 'lpryddena@people.com.cn'),
(13, 'Mozelle', 'Lowndsbrough', '4041377746344238', 2, 'mlowndsbroughb@mozilla.org'),
(14, 'Simeon', 'Lucien', '4217983934528', 1, 'slucienc@github.io'),
(15, 'Kendall', 'Rebillard', '4517310825799068', 2, 'krebillardd@qq.com'),
(16, 'Berte', 'Dumbell', '4041374885580', 2, 'bdumbelle@themeforest.net'),
(17, 'Agace', 'Duckinfield', '4772419110069', 2, 'aduckinfieldf@hexun.com'),
(18, 'Nariko', 'Bevis', '4041596418533295', 2, 'nbevisg@cloudflare.com'),
(19, 'Giusto', 'Beat', '4041378973085', 2, 'gbeath@usnews.com'),
(20, 'Claudelle', 'Parkhouse', '4716840504074556', 2, 'cparkhousei@facebook.com'),
(21, 'Floria', 'Leatherborrow', NULL, 2, 'fleatherborrowj@rambler.ru');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tblRit`
--

DROP TABLE IF EXISTS `tblRit`;
CREATE TABLE `tblRit` (
  `idRit` int(11) NOT NULL,
  `startuur` datetime DEFAULT NULL,
  `einduur` datetime DEFAULT NULL,
  `idHuurstep` int(11) NOT NULL,
  `idKlant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `tblRit`
--

INSERT INTO `tblRit` (`idRit`, `startuur`, `einduur`, `idHuurstep`, `idKlant`) VALUES
(1, '2022-08-17 09:00:03', '2022-08-17 09:15:04', 19, 8),
(2, '2022-08-17 09:02:05', '2022-08-17 10:25:10', 18, 12),
(3, '2022-08-17 11:02:05', '2022-08-17 11:54:10', 5, 4),
(4, '2022-08-17 11:02:05', '2022-08-17 12:15:08', 2, 2),
(5, '2022-08-17 15:02:05', '2022-08-17 16:05:10', 7, 1),
(6, '2022-08-17 17:02:05', '2022-08-17 17:22:10', 3, 2),
(7, '2022-08-17 17:02:05', '2022-08-17 17:33:10', 6, 9),
(8, '2022-08-17 19:02:05', '2022-08-17 19:15:10', 18, 5),
(9, '2022-08-17 22:02:05', '2022-08-17 22:03:55', 12, 9),
(10, '2022-08-17 20:22:04', '2022-08-17 20:41:55', 13, 1),
(11, '2022-08-18 09:08:05', '2022-08-18 09:22:08', 15, 2),
(12, '2022-08-18 12:02:05', '2022-08-18 13:05:10', 30, 6),
(13, '2022-08-18 17:22:00', '2022-08-18 17:33:10', 3, 2),
(14, '2022-08-18 19:02:05', '2022-08-18 19:22:10', 23, 5),
(15, '2022-08-23 09:09:07', NULL, 22, 13),
(16, '2022-08-23 09:11:07', NULL, 11, 4),
(17, '2022-08-23 08:55:02', '2022-08-23 09:15:05', 20, 9),
(18, '2022-08-23 09:11:07', NULL, 4, 16);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `tblAbonnement`
--
ALTER TABLE `tblAbonnement`
  ADD PRIMARY KEY (`idAbonnement`);

--
-- Indexen voor tabel `tblDropOffZone`
--
ALTER TABLE `tblDropOffZone`
  ADD PRIMARY KEY (`idDropOffZone`);

--
-- Indexen voor tabel `tblHuurstep`
--
ALTER TABLE `tblHuurstep`
  ADD PRIMARY KEY (`idHuurstep`),
  ADD KEY `huidigeLocatieID` (`idDropOffZone`);

--
-- Indexen voor tabel `tblKlant`
--
ALTER TABLE `tblKlant`
  ADD PRIMARY KEY (`idKlant`),
  ADD KEY `idabonnement` (`idAbonnement`);

--
-- Indexen voor tabel `tblRit`
--
ALTER TABLE `tblRit`
  ADD PRIMARY KEY (`idRit`),
  ADD KEY `idHuurstep` (`idHuurstep`),
  ADD KEY `idKlant` (`idKlant`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `tblAbonnement`
--
ALTER TABLE `tblAbonnement`
  MODIFY `idAbonnement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `tblDropOffZone`
--
ALTER TABLE `tblDropOffZone`
  MODIFY `idDropOffZone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `tblHuurstep`
--
ALTER TABLE `tblHuurstep`
  MODIFY `idHuurstep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT voor een tabel `tblKlant`
--
ALTER TABLE `tblKlant`
  MODIFY `idKlant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT voor een tabel `tblRit`
--
ALTER TABLE `tblRit`
  MODIFY `idRit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `tblHuurstep`
--
ALTER TABLE `tblHuurstep`
  ADD CONSTRAINT `tblhuurstep_ibfk_1` FOREIGN KEY (`idDropOffZone`) REFERENCES `tblDropOffZone` (`idDropOffZone`);

--
-- Beperkingen voor tabel `tblKlant`
--
ALTER TABLE `tblKlant`
  ADD CONSTRAINT `tblklant_ibfk_1` FOREIGN KEY (`idAbonnement`) REFERENCES `tblAbonnement` (`idAbonnement`);

--
-- Beperkingen voor tabel `tblRit`
--
ALTER TABLE `tblRit`
  ADD CONSTRAINT `tblrit_ibfk_1` FOREIGN KEY (`idKlant`) REFERENCES `tblKlant` (`idKlant`),
  ADD CONSTRAINT `tblrit_ibfk_2` FOREIGN KEY (`idHuurstep`) REFERENCES `tblHuurstep` (`idHuurstep`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
