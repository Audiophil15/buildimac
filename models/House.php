<?php

class House extends Model
{


	public function __construct()
	{
		parent::__construct();
		$this->table = "house";
		$this->idName = "Id_H";
	}

	public function addHouse($date, $toit, $mur, $fenetre, $porte, $terrain){
		$sql = "INSERT INTO HOUSE (Date_H) VALUES (?); ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($date));
		$lastId = $this->connexion->lastInsertId();

		$sql = "INSERT INTO rela_house_element ( Id_H ,Id_E) VALUES (?,?); ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($lastId, $toit));

		$sql = "INSERT INTO rela_house_element (Id_H,Id_E) VALUES (?,?); ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($lastId, $mur));

		$sql = "INSERT INTO rela_house_element ( Id_H,Id_E) VALUES (?,?); ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($lastId, $fenetre));

		$sql = "INSERT INTO rela_house_element (Id_H ,Id_E) VALUES (?,?); ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($lastId, $porte));

		$sql = "INSERT INTO rela_house_element (Id_H ,Id_E) VALUES (?,?); ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($lastId, $terrain));

	}

	public function getScore($toit, $mur, $fenetre, $porte, $terrain){
		$roofCoeffs = array(30,30,40,0,20,50,0,0,0);
		$wallCoeffs = array(40,30,40,70,30,50,0,0,40);
		$windowsCoeffs = array(10,20,15,0,0,0,100,0,15);
		$doorCoeffs = array(5,20,5,0,0,0,0,20,15);
		$groundCoeffs = array(15,0,0,30,50,0,0,80,30);
		$coeffsTab = array($roofCoeffs, $wallCoeffs, $windowsCoeffs, $doorCoeffs, $groundCoeffs);

		$idTab = array($toit, $mur, $fenetre, $porte, $terrain);
	
		$scoreTab = array(0,0,0,0,0,0,0,0,0);
	
		for ($i=1; $i<=9; $i++){
			for($id = 0; $id<5; $id++){
				$sql = "SELECT Points FROM rela_indicator_element WHERE (Id_I=? AND Id_E=?)";
				$query = $this->connexion->prepare($sql);
				$query->execute(array($i, $idTab[$id]));
				$result=$query->fetch(PDO::FETCH_ASSOC);
				$scoreTab[$i-1] += $result["Points"]*$coeffsTab[$id][$i-1];
	
			}
		}
	
		return $scoreTab;
}
}
