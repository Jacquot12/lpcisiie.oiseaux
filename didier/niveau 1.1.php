<?php
include ".dbh.oiseaux.php";	// connexion à la base
include "affiche_image.php";
$Niveau = 1;
$Sous_niveau = 1;
$Nb_Proposition = 3

?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Niveau 1.1</title>
	<link rel="stylesheet" type="text/css" href="./css/ornitho.css" />
</head>
<body>

	<?php
	$Proposition = array();
	$Reponse = array();
	$Image = array();
	$Une_Proposition = array();

	// On recupère une question aléatoire pour le niveau 1.1 (Id_sous_niveau = 1)
	$Requete = "
	SELECT
	`orni_question`.`Id_question`,
	`Nom_sous_niveau`, `Question_sous_niveau`
	FROM `orni_question`, `orni_sous_niveau`
	WHERE
	`orni_question`.`Id_sous_niveau` = `orni_sous_niveau`.`Id_sous_niveau`
	AND `orni_sous_niveau`.`Id_sous_niveau` = $Sous_niveau
	ORDER by rand() limit 0, 1
	";
	// LIMIT 0, 12   ";   // Si LIMIT, le nb doit être un multiple de 3
	$result = mysql_query($Requete);
	while ($row = mysql_fetch_array($result)) {
		$Question_aleatoire = $row['Id_question'];
		$Nom_sous_niveau = $row['Nom_sous_niveau'];
		$Question_sous_niveau = $row['Question_sous_niveau'];
	}

	// On recupère les propositions et réponses pour la question choisie
	$Requete = "
	SELECT
	`orni_question`.`Id_question`, `Reponse`, `Id_proposition`, `Texte_aide`

	FROM `orni_question`, `orni_q2p`, `orni_aide`, `orni_sous_niveau`
	WHERE
	`orni_question`.`Id_question` = `orni_q2p`.`Id_question`
	AND `orni_question`.`Id_aide` = `orni_aide`.`Id_aide`
	AND `orni_question`.`Id_sous_niveau` = `orni_sous_niveau`.`Id_sous_niveau`
	AND `orni_question`.`Id_question` = $Question_aleatoire
	";
	$result = mysql_query($Requete);
	while ($row = mysql_fetch_array($result)) {
		if($row['Reponse'] == 1) {
			$Reponse[$row['Id_proposition']] = $row['Reponse'];
		}
		$Texte_aide = $row['Texte_aide'];
		$Les_Images[] = Affiche_Image($row['Id_proposition']);
	}
	echo "<h1>" .$Nom_sous_niveau. "</h1>";
	echo "<h2>" .$Question_sous_niveau. "</h2>";

	shuffle($Les_Images);
	foreach  ($Les_Images as $key => $Image){
		echo  $Image ;
	}

	echo "<div class='on_aide'>" .$Texte_aide. "</div>";

	//  include "affiche_code.php";



	?>
</body>
</html>
