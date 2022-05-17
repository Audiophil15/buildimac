<?php 

require("controllers/Controller.php");
require("models/Model.php");
require("config/session_start.php");
require("controllers/ElementController.php");
require("controllers/HouseController.php");


$urlParams = explode('/',  $_SERVER['REQUEST_URI']);

$method = $_SERVER['REQUEST_METHOD'];

switch ($urlParams[2]) {

	case 'house' :
		$controller = new HouseController();
		switch($method) {
			case 'GET' :

				break;

			case 'POST' :
				$array = file_get_contents('php://input');
				/*$array = array($_POST['date'] , $_POST['toit'] , $_POST['mur'] , $_POST['fenetre'], $_POST['porte'], $_POST['terrain'])*/; 
				$controller->addAHouse($array);
				break;

			default:
				http_response_code('404');
				echo 'OOPS';
		}
		break;

	case 'game' :
		if (isset($urlParams[3])) {
			switch ($urlParams[3]) {
				case 'play' :
					$controller = new ElementController();
					$controller->imgType();
					break;
				
				case 'results' : 
					$controller = new HouseController();
					$array = file_get_contents('php://input');
					echo($controller->score($array));
					break;
			}
		}else{

		}

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
					$name_file = $_POST['name'] . ".png" ; 
					$name_file = str_ireplace(' ', '_', $name_file);
					$array = array($_POST['name'], $name_file, $_POST['desc'], $_POST['type'], $_FILES['image']['size'], $_FILES['image']['name'], $_FILES['image']['tmp_name']);
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

