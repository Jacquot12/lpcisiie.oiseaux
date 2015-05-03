# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 127.0.0.1 (MySQL 5.6.22)
# Base de données: oiseau
# Temps de génération: 2015-05-01 13:15:46 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table ois_biometrie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ois_biometrie`;

CREATE TABLE `ois_biometrie` (
  `Id_Tempo` mediumint(9) NOT NULL,
  `Id_Bio` smallint(6) NOT NULL,
  `NomCommun` varchar(45) DEFAULT NULL,
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
  `TailleMin` smallint(3) NOT NULL DEFAULT '0',
  `TailleMax` smallint(3) NOT NULL DEFAULT '0',
  `Envergure` varchar(50) DEFAULT NULL,
  `Poids` varchar(60) DEFAULT NULL,
  `Son` tinyint(1) NOT NULL DEFAULT '0',
  `Blanc` tinyint(1) NOT NULL DEFAULT '0',
  `Noir` tinyint(1) NOT NULL DEFAULT '0',
  `Gris` tinyint(1) NOT NULL DEFAULT '0',
  `Beige` tinyint(1) NOT NULL DEFAULT '0',
  `Brun` tinyint(1) NOT NULL DEFAULT '0',
  `Roux` tinyint(1) NOT NULL DEFAULT '0',
  `Rouge` tinyint(1) NOT NULL DEFAULT '0',
  `Orange` tinyint(1) NOT NULL DEFAULT '0',
  `Jaune` tinyint(1) NOT NULL DEFAULT '0',
  `Vert` tinyint(1) NOT NULL DEFAULT '0',
  `Bleu` tinyint(1) NOT NULL DEFAULT '0',
  `EspProt` varchar(10) DEFAULT NULL,
  `Vulne` mediumtext,
  `Longevite` tinyint(3) NOT NULL DEFAULT '0',
  `AuteurModif` varchar(4) DEFAULT NULL,
  `DateModif` datetime NOT NULL DEFAULT '2008-01-01 00:00:59'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ois_espece
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ois_espece`;

CREATE TABLE `ois_espece` (
  `Id_Esp` smallint(5) unsigned NOT NULL,
  `Class_Ssp` varchar(8) DEFAULT NULL,
  `Tempo` tinyint(1) NOT NULL,
  `Ioc` smallint(5) unsigned NOT NULL,
  `Fiches` varchar(16) DEFAULT NULL,
  `Photos` smallint(4) NOT NULL DEFAULT '0',
  `Dessins` tinyint(1) NOT NULL DEFAULT '0',
  `Cartes` tinyint(1) NOT NULL DEFAULT '0',
  `Sons` tinyint(2) NOT NULL DEFAULT '0',
  `Iucn` int(11) NOT NULL,
  `new_iucn` int(11) NOT NULL,
  `birdlife` int(8) unsigned NOT NULL DEFAULT '0',
  `Hbw_Id` mediumint(6) NOT NULL,
  `Hbw_Url` varchar(100) DEFAULT NULL,
  `Avibase` varchar(20) DEFAULT NULL,
  `Num_Sous_Espece` smallint(5) NOT NULL DEFAULT '0',
  `Ordre` varchar(25) DEFAULT NULL,
  `Famille` varchar(27) DEFAULT NULL,
  `Genre` varchar(25) DEFAULT NULL,
  `Espece` varchar(25) DEFAULT NULL,
  `Sous_Espece` varchar(25) DEFAULT NULL,
  `Auteur_Lat` varchar(200) DEFAULT NULL,
  `Nom_Latin` varchar(45) DEFAULT NULL,
  `Nom_Commun` varchar(60) DEFAULT NULL,
  `NC_S_Acc` varchar(60) DEFAULT NULL,
  `Nom_Anglais` varchar(45) DEFAULT NULL,
  `Nom_Allemand` varchar(80) DEFAULT NULL,
  `Nom_Espagnol` varchar(80) DEFAULT NULL,
  `Nom_Hongrois` varchar(100) DEFAULT NULL,
  `Nom_Portugais` varchar(50) DEFAULT NULL,
  `Nom_Neerlandais` varchar(100) DEFAULT NULL,
  `Nom_Estonien` varchar(100) DEFAULT NULL,
  `Nom_Italien` varchar(70) DEFAULT NULL,
  `Nom_Suedois` varchar(70) DEFAULT NULL,
  `Nom_Russe` varchar(120) DEFAULT NULL,
  `Nom_Afrikaans` varchar(50) DEFAULT NULL,
  `Nom_Chinois` varchar(100) DEFAULT NULL,
  `Nom_Tcheque` varchar(100) DEFAULT NULL,
  `Nom_Danois` varchar(100) DEFAULT NULL,
  `Nom_Finnois` varchar(100) DEFAULT NULL,
  `Nom_Japonais` varchar(100) DEFAULT NULL,
  `Nom_Lituanien` varchar(200) DEFAULT NULL,
  `Nom_Norvegien` varchar(100) DEFAULT NULL,
  `Nom_Polonais` varchar(100) DEFAULT NULL,
  `Nom_Slovaque` varchar(100) DEFAULT NULL,
  `Liv_Esp_Fr` varchar(60) DEFAULT NULL,
  `Liv_Esp_En` varchar(60) DEFAULT NULL,
  `Liv_Fam_Fr` varchar(60) DEFAULT NULL,
  `Liv_Fam_En` varchar(60) DEFAULT NULL,
  `Liv_Ord_Fr` varchar(60) DEFAULT NULL,
  `Liv_Ord_En` varchar(60) DEFAULT NULL,
  `Statut_Iucn` varchar(3) DEFAULT NULL,
  `Criteres_Iucn` varchar(55) DEFAULT NULL,
  `Tendance_Iucn` enum('unknown','decreasing','increasing','stable') NOT NULL,
  `Region` varchar(200) DEFAULT NULL,
  `Sous_Region` text,
  `Pays` text,
  `Commentaire` text,
  `AuteurModif` varchar(4) DEFAULT NULL,
  `DateModif` datetime NOT NULL DEFAULT '2008-01-01 00:00:59'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ois_famille
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ois_famille`;

CREATE TABLE `ois_famille` (
  `Class_Famille` smallint(3) NOT NULL,
  `Nom_Famille_Fr` varchar(30) NOT NULL DEFAULT '',
  `Famille_Fr` varchar(100) DEFAULT NULL,
  `Famille_En` varchar(40) DEFAULT NULL,
  `Esp_Famille_Fr` varchar(50) DEFAULT NULL,
  `Desc_Famille_Fr` text,
  `Ordre_Famille` varchar(25) DEFAULT NULL,
  `Groupe` varchar(50) DEFAULT NULL,
  `Groupe_En` varchar(200) DEFAULT NULL,
  `Nom_Famille_Latin` varchar(20) DEFAULT NULL,
  `Nom_Famille_En` varchar(20) DEFAULT NULL,
  `Desc_Famille_En` text,
  `Note_ioc` text,
  `Nom_Famille_Hu` varchar(50) DEFAULT NULL,
  `Desc_Famille_Hu` text,
  `AuteurModif` varchar(4) DEFAULT NULL,
  `DateModif` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ois_membres
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ois_membres`;

CREATE TABLE `ois_membres` (
  `Id_Ph` smallint(4) NOT NULL,
  `Id_forum` smallint(4) NOT NULL,
  `Lang` varchar(30) DEFAULT 'Fr',
  `Dessin` tinyint(1) NOT NULL DEFAULT '0',
  `Photo` tinyint(1) NOT NULL DEFAULT '1',
  `Texte` tinyint(1) NOT NULL DEFAULT '0',
  `Dossier` tinyint(1) NOT NULL DEFAULT '0',
  `Jeux` tinyint(1) NOT NULL DEFAULT '0',
  `Son` tinyint(1) NOT NULL DEFAULT '0',
  `Aide_Id` tinyint(1) NOT NULL DEFAULT '0',
  `Distrib` tinyint(1) NOT NULL DEFAULT '0',
  `Val_Form` tinyint(1) NOT NULL DEFAULT '0',
  `Val_Fond` tinyint(1) NOT NULL DEFAULT '0',
  `Stats` int(1) NOT NULL DEFAULT '0',
  `Initiale_Ph` varchar(4) DEFAULT NULL,
  `Prenom_Ph` varchar(50) DEFAULT NULL,
  `Nom_ph` varchar(50) DEFAULT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Pays_Ph` varchar(4) DEFAULT NULL,
  `Codepostal` varchar(10) DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `Url_Ph` varchar(100) DEFAULT NULL,
  `NomUrl_Ph` varchar(100) DEFAULT NULL,
  `Isbn` varchar(100) DEFAULT NULL,
  `Classement` tinyint(3) NOT NULL DEFAULT '0',
  `Rang_Ph` tinyint(3) unsigned NOT NULL,
  `Reseaux` enum('0','1','2') NOT NULL DEFAULT '0',
  `Repertoire` varchar(30) DEFAULT NULL,
  `Login` varchar(30) DEFAULT NULL,
  `Mailing` tinyint(1) NOT NULL DEFAULT '0',
  `Pop` enum('0','1') NOT NULL DEFAULT '0',
  `Identites` text,
  `Langue` tinyint(4) NOT NULL DEFAULT '1',
  `Profil_Ph` varchar(50) DEFAULT NULL,
  `Date_Profil` datetime NOT NULL DEFAULT '2010-11-29 01:01:01',
  `Page_Index` enum('0','1','2','3') NOT NULL DEFAULT '1',
  `Confidentiel` enum('0','1') NOT NULL DEFAULT '1',
  `Filigrane` enum('0','1') NOT NULL DEFAULT '0',
  `Definition` enum('0','1') NOT NULL DEFAULT '0',
  `Toutes_mes_especes` mediumtext,
  `Mes_Favoris` text,
  `Nbr_Photos` smallint(4) NOT NULL DEFAULT '0',
  `Nbr_Especes` smallint(4) NOT NULL DEFAULT '0',
  `Nbr_Fiches` smallint(4) NOT NULL DEFAULT '0',
  `Nbr_Fiches_En` smallint(4) NOT NULL DEFAULT '0',
  `Toutes_mes_fiches` text,
  `Toutes_mes_fiches_en` text,
  `Sous_Domaine` varchar(50) DEFAULT NULL,
  `Valide_S_Domaine` tinyint(4) NOT NULL DEFAULT '0',
  `Date_Inscription` datetime NOT NULL,
  `Date_Connexion` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ois_mp3
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ois_mp3`;

CREATE TABLE `ois_mp3` (
  `Mp3_Id` mediumint(6) NOT NULL,
  `Mp3_Ini` varchar(4) DEFAULT '',
  `Mp3_Espece_S_Acc` varchar(60) DEFAULT '',
  `Mp3_Num` int(2) NOT NULL,
  `Mp3_Lieu` varchar(30) DEFAULT '',
  `Mp3_Type` varchar(80) DEFAULT '',
  `Mp3_Licence` varchar(30) DEFAULT '',
  `Mp3_Num_Licence` varchar(5) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ois_ordre
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ois_ordre`;

CREATE TABLE `ois_ordre` (
  `Class_Ordre` smallint(3) NOT NULL,
  `Nom_Ordre_Fr` varchar(50) NOT NULL DEFAULT '',
  `Ordre_Fr` varchar(50) NOT NULL,
  `Desc_Ordre_Fr` varchar(250) NOT NULL,
  `Nom_Ordre_Latin` varchar(50) NOT NULL DEFAULT '',
  `Nom_Ordre_En` varchar(50) NOT NULL DEFAULT '',
  `Desc_Ordre_En` varchar(250) NOT NULL,
  `Nom_Ordre_Hu` varchar(50) NOT NULL DEFAULT '',
  `Desc_Ordre_Hu` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ois_photos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ois_photos`;

CREATE TABLE `ois_photos` (
  `Num_Ph` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `Type_Illu` enum('0','1','2') NOT NULL DEFAULT '0',
  `Valide` enum('0','1') NOT NULL DEFAULT '0',
  `Oiseaux_net` enum('0','1') NOT NULL DEFAULT '0',
  `Captif` enum('0','1','2') NOT NULL DEFAULT '0',
  `Selection` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `Modif` enum('0','1') NOT NULL DEFAULT '0',
  `Note` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Photographe` varchar(4) DEFAULT NULL,
  `Espece_Ph` varchar(41) DEFAULT NULL,
  `Espece_S_Acc` varchar(41) DEFAULT NULL,
  `Sexe` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `Age` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0',
  `Plumage` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0',
  `Attitude` varchar(25) DEFAULT NULL,
  `Signature1` varchar(32) DEFAULT NULL,
  `Signature2` varchar(32) DEFAULT NULL,
  `PosSignature` varchar(9) DEFAULT NULL,
  `Remarque1` varchar(32) DEFAULT NULL,
  `Remarque2` varchar(32) DEFAULT NULL,
  `PosRemarque` varchar(9) DEFAULT NULL,
  `Rota_Sign` varchar(3) DEFAULT NULL,
  `Rota_Rema` varchar(3) DEFAULT NULL,
  `Ratio_Vignette` varchar(6) DEFAULT NULL,
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
  `Url_Ph` varchar(150) DEFAULT NULL,
  `Num_Img` tinyint(4) NOT NULL,
  `Taille_Octet` mediumint(8) DEFAULT '0',
  `Date_Ph` datetime NOT NULL DEFAULT '2003-01-01 00:00:01',
  `Date_Maj` datetime NOT NULL DEFAULT '2003-01-01 00:00:01',
  `Description_Ph` text,
  `Exif_Camera` varchar(100) DEFAULT NULL,
  `Exif_Vitesse` varchar(20) DEFAULT NULL,
  `Exif_Ouverture` varchar(10) DEFAULT NULL,
  `Exif_Focale` smallint(6) NOT NULL DEFAULT '0',
  `Exif_Iso` smallint(6) NOT NULL DEFAULT '0',
  `Exif_Flash` tinyint(1) NOT NULL DEFAULT '0',
  `Exif_Date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Exif_Lieu` varchar(12) DEFAULT NULL,
  `Liens_Ph` varchar(250) DEFAULT NULL,
  `Tweet` enum('0','1','2') NOT NULL DEFAULT '0',
  `User_ajout` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`Num_Ph`),
  KEY `Photographe` (`Photographe`),
  KEY `Espece_Ph` (`Espece_Ph`),
  KEY `Exif_Lieu` (`Exif_Lieu`),
  KEY `Valide` (`Valide`),
  KEY `Type_Illu` (`Type_Illu`),
  KEY `Espece_SAcc` (`Espece_S_Acc`),
  KEY `Url_Ph` (`Url_Ph`),
  KEY `Exif_Date` (`Exif_Date`),
  KEY `Liens_Ph` (`Liens_Ph`),
  KEY `Oiseaux_net` (`Oiseaux_net`),
  KEY `Num_Img` (`Num_Img`),
  KEY `Note` (`Note`),
  KEY `Captif` (`Captif`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table ois_xeno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ois_xeno`;

CREATE TABLE `ois_xeno` (
  `Xeno_Id` mediumint(9) NOT NULL,
  `Xeno_NC_SAcc` varchar(60) DEFAULT NULL,
  `Xeno_Genre` varchar(25) DEFAULT NULL,
  `Xeno_Espece` varchar(25) DEFAULT NULL,
  `Xeno_Auteur` varchar(100) DEFAULT NULL,
  `Xeno_Pays` varchar(100) DEFAULT NULL,
  `Xeno_Type` varchar(80) DEFAULT NULL,
  `Xeno_Lien` varchar(100) DEFAULT NULL,
  `Xeno_Licence` varchar(30) DEFAULT NULL,
  `Xeno_Num_Licence` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
