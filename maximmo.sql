-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 04 juin 2021 à 13:12
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `maximmo`
--

-- --------------------------------------------------------

--
-- Structure de la table `attachement`
--

DROP TABLE IF EXISTS `attachement`;
CREATE TABLE IF NOT EXISTS `attachement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commune_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commune_id` (`commune_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attachement`
--

INSERT INTO `attachement` (`id`, `commune_id`) VALUES
(1, 1),
(2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `attachement_commune`
--

DROP TABLE IF EXISTS `attachement_commune`;
CREATE TABLE IF NOT EXISTS `attachement_commune` (
  `commune_id` int(11) NOT NULL,
  `attachement_id` int(11) NOT NULL,
  KEY `attachement_id` (`attachement_id`),
  KEY `commune_id` (`commune_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attachement_commune`
--

INSERT INTO `attachement_commune` (`commune_id`, `attachement_id`) VALUES
(1, 1),
(2, 1),
(4, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

DROP TABLE IF EXISTS `commune`;
CREATE TABLE IF NOT EXISTS `commune` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `superficie` float NOT NULL,
  `population` int(11) NOT NULL,
  `departement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `departement_id` (`departement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commune`
--

INSERT INTO `commune` (`id`, `nom`, `code_postal`, `superficie`, `population`, `departement_id`) VALUES
(1, 'Bordeaux', '33000', 49.36, 249712, 1),
(2, 'Ambes', '33810', 28.85, 3167, 1),
(3, 'Coutras', '33230', 33.69, 8545, 1),
(4, 'ANDERNOS LES BAINS', '33510', 20.01, 19194, 1),
(5, 'libourne', '33500', 20.65, 36610, 1);

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`id`, `code`, `nom`, `region_id`) VALUES
(1, 33, 'Gironde', 1);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fichier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logement_id` int(11) NOT NULL,
  `legende` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logement_id` (`logement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `fichier`, `logement_id`, `legende`, `is_main`) VALUES
(1, '\r\nApartment_Elizabetes_\r\n', 1, '22_Unique_Appartment_Riga_Latvia_-_Booking.com', 1),
(2, 'Tuzlaks_appartment_', 2, 'Tuzlaks_appartment_Entire_apartment_', 1),
(3, 'Unique_Hotel_in_San_Rafael', 3, '__Maison_Couturier_San_Rafael_a_', 1),
(4, 'maison', 4, 'maison', 1),
(5, 'maison1', 5, 'maison1', 1),
(6, 'How_to_Make_', 6, '_Beautiful_Terrain_in_Unity_2020__Beginner_Tutorial', 1),
(7, 'Ground_pearls_in_turf_-_GCMOnline.com\r\n', 7, '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `logement`
--

DROP TABLE IF EXISTS `logement`;
CREATE TABLE IF NOT EXISTS `logement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_interne` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surface_logement` int(11) NOT NULL,
  `surface_terrain` int(11) DEFAULT NULL,
  `pieces` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` int(11) NOT NULL,
  `bilan_energie` float NOT NULL,
  `bilan_ges` float NOT NULL,
  `commune_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commune_id` (`commune_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `logement`
--

INSERT INTO `logement` (`id`, `ref_interne`, `surface_logement`, `surface_terrain`, `pieces`, `description`, `prix`, `bilan_energie`, `bilan_ges`, `commune_id`, `type_id`) VALUES
(1, 'IhDx70N8TTAIv7bT', 85, 0, 4, 'Vous souhaitez investir ou vous êtes à la recherche de votre résidence principale dans du neuf ?N\'hésitez plus ! Venez découvrir ce nouveau programme idéalement situé, à deux pas du centre ville et des transports en communs. Nous vous proposons des appartements du 2 au 5 pièces à partir de 266 000 euros Eligible loi PINEL Livraison à partir du 4ème trimestre 2023 395000 euros Honoraires à la charge du vendeur.', 395000, 221, 76, 1, 1),
(2, 'rdlVFmA1YtSBYcXN', 40, NULL, 4, 'BORDEAUX - HYPER CENTRE Au pied de la place Camille Jullian, agréable appartement de type 2 pièces composé d\'une entrée, séjour avec cuisine ouverte, chambre et salle de bain. Parties communes et immeuble en parfait état. Copropriété de 3 lots Charges annuelles : 0 euros. 285000 euros Honoraires à la charge du vendeur.', 285000, 127, 13, 1, 1),
(3, 'y2ocxHGMT8W1y5wX', 90, 356, 4, 'Proche de la place Nansouty En seconde ligne, nous vous proposons une maison lumineuse de quatre pièces avec une jolie terrasse de 40 m2. Dans une petite copropriété, cette maison est composée de deux niveaux, au rez-de-chaussée un grand séjour donnant sur la terrasse, une cuisine entièrement équipée, une suite parentale avec salle d\'eau, WC. Au premier étage, un palier desservant deux chambres, une salle d\'eau avec WC et une buanderie. Climatisation, rangements, panneaux solaires? Parking privatif Proximité des transports et de toutes commodités. Copropriété de 20 lots Charges annuelles : 530 euros. 480000 euros Honoraires à la charge du vendeur.', 480000, 135, 35, 2, 2),
(4, 'xT5bvhMWyT0mtAFb', 156, 780, 6, 'Venez découvrir cette superbe maison contemporaine idéalement située, au calme et à quelques minutes à pied du centre-ville. Vous pourrez profiter immédiatement de cette maison de plain-pied où aucun travaux ne sont à prévoir : 4 chambres avec placards, un bureau, une cuisine neuve ouverte sur la vaste pièce de vie, une grande véranda et sa cuisine d\'été, le tout sur un terrain entièrement clôturé sans vis-à-vis ! Bien conçue et très bien entretenue, cette maison n\'attend plus que ses futurs propriétaires!', 256000, 176, 96, 3, 2),
(5, 'zgivCnw9DeclF4eQ', 141, 650, 5, 'Située en plein centre de la commune d\'Ambès (C.U.B.), à 20 mn du pont Chaban Delmas, venez découvrir, cette contemporaine spacieuse et lumineuse, aux matériaux de qualités, comprenant, entrée, une pièce à vire d\'environ 45 m², cuisine équipée semi-ouverte, 4 chambres, cellier et salle de bains avec douche à l\'talienne, terrasse carrelée et pergola, sur un terrain clos et piscinable d\'environ 800 m². Cette maison est équipée de panneaux photovoltaïques avec très bon rapport à l\'année, ce qui permet de couvrir l\'ensemble des charges annuelles. Coup de coeur assuré !', 320900, 202, 16, 2, 2),
(6, 'oOTbW9FfE1C4733n', 0, 385, 0, 'Superbe terrain à bâtir de 385 m² environ avec une emprise au sol de 30%, en première ligne, clôturé sur trois côtés et avec portail motorisé. Situé à 600 mètres de la plage, ce terrain n\'attend plus que votre résidence principale ou secondaire ! ', 290000, 0, 0, 4, 3),
(7, 'kl4csf7rMB9AmiUB\r\n', 0, 800, 0, 'Terrain viabilisé de 800 m², au coeur de Bordeaux, proche centre-ville.\r\n', 450000, 0, 0, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `logement_option`
--

DROP TABLE IF EXISTS `logement_option`;
CREATE TABLE IF NOT EXISTS `logement_option` (
  `logement_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  KEY `logement_id` (`logement_id`),
  KEY `option_id` (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `logement_option`
--

INSERT INTO `logement_option` (`logement_id`, `option_id`) VALUES
(1, 1),
(1, 2),
(1, 7),
(2, 3),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(3, 2),
(4, 2),
(4, 4),
(4, 5),
(5, 5),
(5, 2),
(5, 3),
(5, 8);

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id`, `nom`) VALUES
(1, 'parkin'),
(2, 'terrasse/balcon'),
(3, 'cuisine équipée'),
(4, 'cheminée'),
(5, 'garage'),
(6, 'piscine'),
(7, 'climatisation'),
(8, 'Séjour de plus de 30 mètres²\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id`, `nom`) VALUES
(1, 'Nouvelle Aquitaine');

-- --------------------------------------------------------

--
-- Structure de la table `type_de_bien`
--

DROP TABLE IF EXISTS `type_de_bien`;
CREATE TABLE IF NOT EXISTS `type_de_bien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_de_bien`
--

INSERT INTO `type_de_bien` (`id`, `nom`) VALUES
(1, 'appartement'),
(2, 'maison'),
(3, 'terrain');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `attachement`
--
ALTER TABLE `attachement`
  ADD CONSTRAINT `attachement_ibfk_1` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`);

--
-- Contraintes pour la table `attachement_commune`
--
ALTER TABLE `attachement_commune`
  ADD CONSTRAINT `attachement_commune_ibfk_1` FOREIGN KEY (`attachement_id`) REFERENCES `attachement` (`id`),
  ADD CONSTRAINT `attachement_commune_ibfk_2` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`);

--
-- Contraintes pour la table `commune`
--
ALTER TABLE `commune`
  ADD CONSTRAINT `commune_ibfk_1` FOREIGN KEY (`departement_id`) REFERENCES `departement` (`id`);

--
-- Contraintes pour la table `departement`
--
ALTER TABLE `departement`
  ADD CONSTRAINT `departement_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`logement_id`) REFERENCES `logement` (`id`);

--
-- Contraintes pour la table `logement`
--
ALTER TABLE `logement`
  ADD CONSTRAINT `logement_ibfk_1` FOREIGN KEY (`commune_id`) REFERENCES `commune` (`id`),
  ADD CONSTRAINT `logement_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type_de_bien` (`id`);

--
-- Contraintes pour la table `logement_option`
--
ALTER TABLE `logement_option`
  ADD CONSTRAINT `logement_option_ibfk_1` FOREIGN KEY (`logement_id`) REFERENCES `logement` (`id`),
  ADD CONSTRAINT `logement_option_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
