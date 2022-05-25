<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="\buildimac\css\game.css" type="text/css" />
    <link rel="stylesheet" href="\buildimac\css\style.css" type="text/css" />
	<title><?= $title ?></title>
</head>
<body>
	<header>
	<nav>
		<a class="cochon" href="\buildimac\"><img alt="accueil" src="\buildimac\css\images\cochon.png"></a>
		<div>
			<?php if(isset($_SESSION['ID']) AND $_SESSION['ID'] > 0) // si connecté en tant qu'admin
   			 { ?>
				<a href="\buildimac\type">Elements</a>
			<?php } ?>
			<a href="\buildimac\house">Galerie</a>
			<a href="\buildimac\game\play">Créer une maison</a>
		</div>
	</nav>
</header>
	
