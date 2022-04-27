<?php 

require("controllers/Controller.php");
require("models/Model.php");
require("controllers/ElementController.php");


$urlParams = explode('/',  $_SERVER['REQUEST_URI']);
$controller = new ElementController();

if(isset($urlParams[2]) && $urlParams[2] == "element"){
	$controller = new ElementController();
	//Supprimer un élément
	if( isset($urlParams[4]) && $urlParams[3] == "delete"){
		$controller->delete_element($urlParams[4]);
	}
	//Accéder au formulaire d'ajout
	else if(isset($urlParams[3]) && $urlParams[3] == "add"){
		$controller->view_formulaire();
	}
	//Ajouter un élément
	else if(isset($urlParams[3]) && $urlParams[3] == "post"){
		$array = array($_POST['name'] , $_POST['name'].".png" , $_POST['desc'] , $_POST['type']); 
		$controller->add_element($array);
	}
	//Voir un élément
	else if(isset($urlParams[3])){
		$controller->read($urlParams[3]);
	}
	//Voir tous les éléments
	else{ 
		$controller->index();
	}

}
?>

<a href ="/buildimac/element">elements</a>
