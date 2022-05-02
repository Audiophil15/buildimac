<?php 

require("controllers/Controller.php");
require("models/Model.php");
require("controllers/ElementController.php");


$urlParams = explode('/',  $_SERVER['REQUEST_URI']);

$method = $_SERVER['REQUEST_METHOD'];

switch ($urlParams[2]) {

	case '' :

		break;

	case 'element':
		$controller = new ElementController();

		if (isset($urlParams[3])) {
			switch ($urlParams[3]) {

				case 'add':
					$controller->view_formulaire();
					break;

				case 'post':
					$array = array($_POST['name'], $_POST['name'] . ".png", $_POST['desc'], $_POST['type']);
					$controller->add_element($array);
					break;

				case 'delete':
					if (isset($urlParams[4]) && $urlParams[4] > 0) {
						$controller->delete_element($urlParams[4]);
					}
					break;

				case $urlParams[3] > 0:
					$controller->read($urlParams[3]);
					break;					

				case '':
					$controller->index();
					break;

				default:
					http_response_code('404');
					echo 'unknown endpoint';
			}
		} else {
			$controller->index();
		}
		break;

	case 'type' : 
		$controller = new ElementController();
		if (isset($urlParams[3])) {
			switch ($urlParams[3]) {
				case '':
					$controller->index();
					break;
				
				case $urlParams[3] > 0:
					$controller->types($urlParams[3]);
					break;	
			}			
		}else{
			$controller->index();
		}
		break;

	case 'connect' : 
		$controller = new ElementController();
		if (isset($urlParams[3])) {
			switch ($urlParams[3]) {

				case 'post':
					$array = array($_POST['login'], $_POST['mdp']);
					$controller->connect($array);
					break;	
				
				case '':
					$controller->view_connexion(); 
					break;	
			
			}			
		}else{
			$controller->view_connexion(); 
		}
		break;

	default:
		http_response_code('500');
		echo 'unknown endpoint';
		break;
}



?>

<a href ="/buildimac/element">elements</a>
<a href ="/buildimac/type/1">types</a>
<a href ="/buildimac/connect">connexion</a>
