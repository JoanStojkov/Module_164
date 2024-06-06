-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour module_164
DROP DATABASE IF EXISTS `module_164`;
CREATE DATABASE IF NOT EXISTS `module_164` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `module_164`;

-- Listage de la structure de table module_164. t_adresse
DROP TABLE IF EXISTS `t_adresse`;
CREATE TABLE IF NOT EXISTS `t_adresse` (
  `ID_adresse` int NOT NULL AUTO_INCREMENT,
  `Rue` varchar(50) DEFAULT NULL,
  `NPA` int DEFAULT NULL,
  `NO_Rue` int DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table module_164.t_adresse : ~1 rows (environ)
DELETE FROM `t_adresse`;
INSERT INTO `t_adresse` (`ID_adresse`, `Rue`, `NPA`, `NO_Rue`, `Ville`) VALUES
	(16, 'Rue du Château', 1000, 12, 'Lausanne'),
	(17, 'Avenue des Alpes', 1201, 45, 'Genève'),
	(18, 'Chemin des Cèdres 8 ', 1260, 8, 'Nyon'),
	(19, 'Rue de la Gare', 1110, 3, 'Morges'),
	(20, 'Rue de l\'église ', 1800, 31, 'Vevey');

-- Listage de la structure de table module_164. t_clients
DROP TABLE IF EXISTS `t_clients`;
CREATE TABLE IF NOT EXISTS `t_clients` (
  `ID_clients` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(40) DEFAULT NULL,
  `Prenom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Date_De_Naissance` date DEFAULT NULL,
  PRIMARY KEY (`ID_clients`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table module_164.t_clients : ~0 rows (environ)
DELETE FROM `t_clients`;
INSERT INTO `t_clients` (`ID_clients`, `Nom`, `Prenom`, `Date_De_Naissance`) VALUES
	(22, 'Dubois', 'Sophie ', '1999-12-24'),
	(23, 'Dupont', 'Laura', '2004-06-08'),
	(24, 'Rey', 'Julien', '2000-02-28'),
	(25, 'Perrin', 'Nicolas', '1998-10-07'),
	(26, 'Rochat ', 'Aline', '2006-04-15');

-- Listage de la structure de table module_164. t_clients_adresse
DROP TABLE IF EXISTS `t_clients_adresse`;
CREATE TABLE IF NOT EXISTS `t_clients_adresse` (
  `id_clients_adresse` int NOT NULL AUTO_INCREMENT,
  `fk_clients` int DEFAULT NULL,
  `fk_adresse` int DEFAULT NULL,
  PRIMARY KEY (`id_clients_adresse`),
  KEY `fk_clients` (`fk_clients`) USING BTREE,
  KEY `fk_adresse` (`fk_adresse`) USING BTREE,
  CONSTRAINT `fk_t_clients_adresse_t_adresse` FOREIGN KEY (`fk_clients`) REFERENCES `t_clients` (`ID_clients`),
  CONSTRAINT `fk_t_clients_adresse_t_clients` FOREIGN KEY (`fk_adresse`) REFERENCES `t_adresse` (`ID_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table module_164.t_clients_adresse : ~0 rows (environ)
DELETE FROM `t_clients_adresse`;
INSERT INTO `t_clients_adresse` (`id_clients_adresse`, `fk_clients`, `fk_adresse`) VALUES
	(16, 22, 16),
	(17, 23, 17),
	(18, 24, 18),
	(19, 25, 19),
	(20, 26, 20);

-- Listage de la structure de table module_164. t_clients_commande
DROP TABLE IF EXISTS `t_clients_commande`;
CREATE TABLE IF NOT EXISTS `t_clients_commande` (
  `id_clients_commande` int NOT NULL AUTO_INCREMENT,
  `fk_clients` int DEFAULT NULL,
  `fk_commande` int DEFAULT NULL,
  PRIMARY KEY (`id_clients_commande`),
  KEY `fk_t_clients` (`fk_clients`) USING BTREE,
  KEY `fk_t_commande` (`fk_commande`) USING BTREE,
  CONSTRAINT `fk_t_clients_commande_t_clients` FOREIGN KEY (`fk_clients`) REFERENCES `t_clients` (`ID_clients`),
  CONSTRAINT `fk_t_clients_commande_t_commande` FOREIGN KEY (`fk_commande`) REFERENCES `t_commande` (`ID_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table module_164.t_clients_commande : ~0 rows (environ)
DELETE FROM `t_clients_commande`;
INSERT INTO `t_clients_commande` (`id_clients_commande`, `fk_clients`, `fk_commande`) VALUES
	(4, 26, 4);

-- Listage de la structure de table module_164. t_commande
DROP TABLE IF EXISTS `t_commande`;
CREATE TABLE IF NOT EXISTS `t_commande` (
  `ID_commande` int NOT NULL AUTO_INCREMENT,
  `Date_commande` timestamp NOT NULL,
  PRIMARY KEY (`ID_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table module_164.t_commande : ~1 rows (environ)
DELETE FROM `t_commande`;
INSERT INTO `t_commande` (`ID_commande`, `Date_commande`) VALUES
	(4, '2024-06-03 08:38:00');

-- Listage de la structure de table module_164. t_commande_habits
DROP TABLE IF EXISTS `t_commande_habits`;
CREATE TABLE IF NOT EXISTS `t_commande_habits` (
  `id_commande_habits` int NOT NULL AUTO_INCREMENT,
  `fk_commande` int DEFAULT NULL,
  `fk_habits` int DEFAULT NULL,
  PRIMARY KEY (`id_commande_habits`),
  KEY `fk_t_commande_habits_t_commande` (`fk_commande`) USING BTREE,
  KEY `fk_t_commande_habits_t_habits` (`fk_habits`) USING BTREE,
  CONSTRAINT `FK_t_commande_habits_module_164.t_habits` FOREIGN KEY (`fk_habits`) REFERENCES `t_habits` (`ID_habits`),
  CONSTRAINT `fk_t_commande_habits_t_commande` FOREIGN KEY (`fk_commande`) REFERENCES `t_commande` (`ID_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table module_164.t_commande_habits : ~0 rows (environ)
DELETE FROM `t_commande_habits`;
INSERT INTO `t_commande_habits` (`id_commande_habits`, `fk_commande`, `fk_habits`) VALUES
	(4, 4, 8);

-- Listage de la structure de table module_164. t_habits
DROP TABLE IF EXISTS `t_habits`;
CREATE TABLE IF NOT EXISTS `t_habits` (
  `ID_habits` int NOT NULL AUTO_INCREMENT,
  `Marque` varchar(20) DEFAULT NULL,
  `Model` varchar(30) DEFAULT NULL,
  `Taille` varchar(50) DEFAULT NULL,
  `Type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Prix` int DEFAULT NULL,
  PRIMARY KEY (`ID_habits`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table module_164.t_habits : ~4 rows (environ)
DELETE FROM `t_habits`;
INSERT INTO `t_habits` (`ID_habits`, `Marque`, `Model`, `Taille`, `Type`, `Prix`) VALUES
	(2, 'Supreme', 'MM6', 'M', 'Vetement', 130),
	(3, 'Nike', 'TECH', 'L', 'Vetement', 100),
	(6, 'Adidas', 'ZX8000', 'S', 'Chaussure', 150),
	(7, 'Puma', 'RS-X	', 'M', 'Chaussure ', 150),
	(8, 'Levi\'s', '501', 'L', 'Jeans', 80);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
