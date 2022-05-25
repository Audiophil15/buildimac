<?php
class HouseController extends Controller{

	public function addAHouse($form) {

		$this->loadModel("House");

		$house = json_decode($form,true);
		//echo gettype($house);
		$houses = $this->House->addHouse($house["date"], $house["toit"], $house["mur"], $house["fenetre"], $house["porte"], $house["terrain"]);


		
		//return json_encode(addPlanet($planet['nom'], $planet['carac']));
	}

	public function score($form){
		$this->loadModel("House");

		$house = json_decode($form,true);
		//echo gettype($house);
		$scores = $this->House->getScore($house["toit"], $house["mur"], $house["fenetre"], $house["porte"], $house["terrain"]);

		return json_encode($scores);
	}

	public function allHouse(){
		$this->loadModel("House");
		$houses = $this->House->getAllHouse();
		return json_encode($houses);
	}
	

}