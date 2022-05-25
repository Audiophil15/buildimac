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

		/*$sql = "INSERT INTO rela_house_element (".$lastId. " ,Id_E) VALUES (?); ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[6]));*/

	}

	public function getHousesElements()
	{
		$sql = "SELECT DISTINCT Id_H FROM rela_house_element";
		$query = $this->connexion->prepare($sql);
		$query->execute();
		$houses=array_values($query->fetchAll());
		for ($i = 0; $i<count($houses); $i++){
			$sql ="SELECT Image_E FROM 'element' INNER JOIN 'rela_house_element' ON 'rela_house_element'.Id_E= 'element'.Id_E	WHERE 'rela_house_element'.Id_H=?";
			$query = $this->connexion->prepare($sql);
			$query->execute(array($houses[$i]['Id_H']));
			var_dump($houses[$i]['Id_H']);
			$elements=array_values($query->fetchAll());
			var_dump($elements['Image_E']);
			for ($j = 0; $j<count($elements[$i]); $j++){
				$elements[$i][$j] = preg_match("#/[A-Za-z0-9]+\"#", $elements[$i][$j], $match);
				$s=$match[0];
				$s=ltrim($s,"\/");
				$s=rtrim($s,'"');
				$elements[$i][$j] = $s;
			}
		}
		return $elements;
	}

}
