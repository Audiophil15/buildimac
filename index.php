<?php 

require("controllers/Controller.php");
require("models/Model.php");
require("controllers/ElementController.php");


$urlParams = explode('/',  $_SERVER['REQUEST_URI']);
$controller = new ElementController();

if(isset($urlParams[2]) && $urlParams[2] == "element"){
	$controller = new ElementController();
	if( isset($urlParams[3])){
	$controller->read($urlParams[3]);
	}
	else{ 
		$controller->index();
	}

}
?>

<a href ="/buildimac/element">elements</a>
