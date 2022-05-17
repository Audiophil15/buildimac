<?php
class HouseController extends Controller{

	function addAHouse($form) {

		$this->loadModel("House");

		$house = json_decode($form,true);
		//echo gettype($house);
		$houses = $this->House->addHouse($house["date"], $house["toit"], $house["mur"], $house["fenetre"], $house["porte"], $house["terrain"]);


		
		//return json_encode(addPlanet($planet['nom'], $planet['carac']));
	}

	function score($form){
		$this->loadModel("House");

		$house = json_decode($form,true);
		//echo gettype($house);
		$scores = $this->House->getScore($house["toit"], $house["mur"], $house["fenetre"], $house["porte"], $house["terrain"]);

		return json_encode($scores);
	}

}