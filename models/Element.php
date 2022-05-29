<?php

class Element extends Model
{

	public $Id_E;
	public $Name_E;
	public $Image_E = "Image_E";
	public $Description_E;
	public $Id_type;

	public function __construct()
	{
		parent::__construct();
		$this->table = "element";
		$this->idName = "Id_E";
		$this->idType = "Id_type";
	}

	
	public function getByType(int $IdType){
		$sql = "SELECT * FROM " . $this->table . " WHERE ".$this->idType." = ? ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($IdType));
		return $query;
	}

	public function getIndicator(){
		$sql = "SELECT * FROM  indicator";
		$query = $this->connexion->prepare($sql);
		$query->execute(array());
		return $query;
	}

	public function getElementIndicator(int $id){
		$sql = "SELECT * FROM  indicator
				INNER JOIN rela_indicator_element
				ON rela_indicator_element.Id_I = indicator.Id_I
				WHERE Id_E = ?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($id));
		return $query;
	}


	//récupérer une entrée de la table grâce à l'id, 3 requêtes delete car il y a des foraign keys
	public function delete(int $id)
	{
		$sql = "DELETE FROM `rela_house_element` WHERE `Id_E`= ?  ; 
					DELETE FROM `rela_indicator_element` WHERE `Id_E`= ? ; 
					DELETE FROM `element` WHERE `Id_E`= ? ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($id, $id, $id));
	}

	public function add($array)
	{
		$sql = "INSERT INTO ELEMENT (Name_E, Image_E, Description_E, Id_type) VALUES (?, ? , ? , ?); ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[0], $array[1], $array[2], $array[3]));

		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(1, $array[7]));
		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(2, $array[8]));
		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(3, $array[9]));
		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(4, $array[10]));
		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(5, $array[11]));
		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(6, $array[12]));
		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(7, $array[13]));
		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(8, $array[14]));
		$sql = "INSERT INTO rela_indicator_element (Id_E,Id_I,Points) VALUES (LAST_INSERT_ID(), ? , ?);";
		$query = $this->connexion->prepare($sql);
		$query->execute(array(9, $array[15]));
	}

	public function modify($array)
	{
		$sql = "UPDATE ELEMENT SET Name_E =?, /*Image_E=?,*/ Description_E=?, Id_type=? WHERE Id_E=?;  ";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[0], /*$array[1],*/ $array[2], $array[3], $array[7]));

		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[8], 1, $array[7]));
		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[9], 2, $array[7]));
		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[10], 3, $array[7]));
		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[11], 4, $array[7]));
		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[12], 5, $array[7]));
		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[13], 6, $array[7]));
		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[14], 7, $array[7]));
		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[15], 8, $array[7]));
		$sql = "UPDATE rela_indicator_element SET Points = ? WHERE Id_I = ? AND Id_E=?;";
		$query = $this->connexion->prepare($sql);
		$query->execute(array($array[16], 9, $array[7]));
		
	}

	public function getImgbyType(int $type)
	{
		$sql = "SELECT " .$this->idName.",".$this->Image_E. " FROM " . $this->table . " WHERE " .$this->idType. " = ".$type;
		$query = $this->connexion->prepare($sql);
		$query->execute();
		$results = $query->fetchAll();
		return $results;
	}


}
