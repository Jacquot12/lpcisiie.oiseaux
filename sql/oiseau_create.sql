# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 127.0.0.1 (MySQL 5.6.22)
# Base de données: oiseau
# Temps de génération: 2015-03-02 15:19:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table orni_aide
# ------------------------------------------------------------

CREATE TABLE `orni_aide` (
  `Id_aide` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Titre_aide` varchar(255) NOT NULL,
  `Texte_aide` text NOT NULL,
  `Photo_aide` varchar(255) NOT NULL,
  `Sources_aide` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_aide`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table orni_espece
# ------------------------------------------------------------

CREATE TABLE `orni_espece` (
  `Id_Esp` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Class_Ssp` varchar(8) DEFAULT NULL,
  `Nom_Commun` varchar(60) DEFAULT NULL,
  `NC_S_Acc` varchar(60) DEFAULT NULL,
  `Ordre` varchar(25) DEFAULT NULL,
  `Famille` varchar(27) DEFAULT NULL,
  `Genre` varchar(25) DEFAULT NULL,
  `Espece` varchar(25) DEFAULT NULL,
  `Sous_Espece` varchar(25) DEFAULT NULL,
  `Nom_Anglais` varchar(45) DEFAULT NULL,
  `Fiches` varchar(16) DEFAULT NULL,
  `Photos` smallint(4) NOT NULL DEFAULT '0',
  `Dessins` tinyint(1) NOT NULL DEFAULT '0',
  `Cartes` tinyint(1) NOT NULL DEFAULT '0',
  `Sons` tinyint(2) NOT NULL DEFAULT '0',
  `Statut_Iucn` varchar(3) DEFAULT NULL,
  `TMmin` smallint(3) NOT NULL,
  `TMmax` smallint(3) NOT NULL,
  `TFmin` smallint(3) NOT NULL,
  `TFmax` smallint(3) NOT NULL,
  `EnvMin` smallint(3) NOT NULL,
  `EnvMax` smallint(3) NOT NULL,
  `PMmin` float(7,1) NOT NULL,
  `PMmax` float(7,1) NOT NULL,
  `PFmin` float(7,1) NOT NULL,
  `PFmax` float(7,1) NOT NULL,
  PRIMARY KEY (`Id_Esp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table orni_niveau
# ------------------------------------------------------------

CREATE TABLE `orni_niveau` (
  `Id_niveau` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `Classe_niveau` varchar(1) NOT NULL DEFAULT '',
  `Nom_niveau` varchar(255) NOT NULL DEFAULT '',
  `Description_niveau` varchar(255) NOT NULL,
  `Niveau_suivant` int(2) NOT NULL,
  PRIMARY KEY (`Id_niveau`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table orni_proposition
# ------------------------------------------------------------

CREATE TABLE `orni_proposition` (
  `Id_proposition` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `Note` tinyint(6) unsigned NOT NULL,
  `Espece_Ph` varchar(41) DEFAULT NULL,
  `Photographe` varchar(4) DEFAULT NULL,
  `Num_Img` tinyint(4) unsigned NOT NULL,
  `Sexe` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `Age` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0',
  `Plumage` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0',
  `Px1` smallint(4) NOT NULL DEFAULT '0',
  `Px2` smallint(4) NOT NULL DEFAULT '0',
  `Py1` smallint(4) NOT NULL DEFAULT '0',
  `Py2` smallint(4) NOT NULL DEFAULT '0',
  `L_Vignette` smallint(4) NOT NULL DEFAULT '0',
  `H_Vignette` smallint(4) NOT NULL DEFAULT '0',
  `L_Gformat` smallint(4) NOT NULL,
  `H_Gformat` smallint(4) NOT NULL,
  `La_Ph` smallint(4) DEFAULT '0',
  `Ha_Ph` smallint(4) DEFAULT '0',
  PRIMARY KEY (`Id_proposition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table orni_q2p
# ------------------------------------------------------------

CREATE TABLE `orni_q2p` (
  `Id_q2p` int(11) NOT NULL,
  `Id_question` int(11) NOT NULL,
  `Id_proposition` int(11) NOT NULL,
  `Reponse` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Id_q2p`),
  KEY `Id_question` (`Id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table orni_question
# ------------------------------------------------------------

CREATE TABLE `orni_question` (
  `Id_question` int(11) NOT NULL AUTO_INCREMENT,
  `Id_sous_niveau` int(11) NOT NULL,
  `Forme_Q` int(11) NOT NULL,
  `Type_Q` int(11) NOT NULL,
  `Nb_points` int(11) NOT NULL,
  `Temps_limite` int(11) NOT NULL,
  `Id_aide` int(11) NOT NULL,
  PRIMARY KEY (`Id_question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table orni_sous_niveau
# ------------------------------------------------------------

CREATE TABLE `orni_sous_niveau` (
  `Id_sous_niveau` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Id_niveau` int(11) NOT NULL,
  `Num_sous_niveau` tinyint(3) unsigned NOT NULL,
  `Nom_sous_niveau` text NOT NULL,
  `Description_sous_niveau` text NOT NULL,
  `Question_sous_niveau` text NOT NULL,
  `Nb_questions_justes` int(11) NOT NULL DEFAULT '5',
  `Score_validation` int(11) NOT NULL DEFAULT '80',
  `Sous_niveau_suivant` int(11) NOT NULL,
  PRIMARY KEY (`Id_sous_niveau`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
