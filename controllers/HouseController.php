<?php
class HouseController extends Controller{

	function addAHouse($form) {

		$this->loadModel("House");

		$house = json_decode($form,true);
		//echo gettype($house);
		$houses = $this->House->addHouse($house["date"], $house["toit"], $house["mur"], $house["fenetre"], $house["porte"], $house["terrain"]);

		//return json_encode(addPlanet($planet['nom'], $planet['carac']));
	}

	function galleryJson() {
		$this->loadModel("House");
		$elements = $this->House->getHousesElements();
		$json = json_encode($elements, true);
		echo "--";
		echo $json;
		return $json;
	}

}