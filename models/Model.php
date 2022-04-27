<?php

require_once("config/config.php");

class Model{

	private $connexion;
	public $table;
	public $idName;

	//connexion à la bdd
	public function __construct(){

        try{
            $this->connexion = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASSWORD);

        }catch(PDOException $exception){
            echo "Error :  " . $exception->getMessage();
        }
		
    }

	//récupérer toutes les données de la table
	public function getAll(string $orderId){

		$sql = "SELECT * FROM " . $this->table . " ORDER BY " .$orderId. " ASC";
        $query = $this->connexion->prepare($sql);
        $query->execute();
        return $query;
	}

	//récupérer une entrée de la table grâce à l'id
	public function getById(int $id){

		$sql = "SELECT * FROM " . $this->table . " WHERE ".$this->idName." = ? ";
        $query = $this->connexion->prepare($sql);
        $query->execute(array($id));
        return $query;

	}

	//récupérer une entrée de la table grâce à l'id, 3 requêtes delete car il y a des foraign keys
	public function delete(int $id){

		$sql = "DELETE FROM `rela_house_element` WHERE `Id_E`= ?  ; 
				DELETE FROM `rela_indicator_element` WHERE `Id_E`= ? ; 
				DELETE FROM `element` WHERE `Id_E`= ? " ; 
        $query = $this->connexion->prepare($sql);
        $query->execute(array($id, $id, $id));

	}

	//récupérer une entrée de la table grâce à l'id
	public function add($array){

		$sql = "INSERT INTO ELEMENT (Name_E, Image_E, Description_E, Id_type) VALUES (?, ? , ? , ?); ";
        $query = $this->connexion->prepare($sql);
        $query->execute(array($array[0], $array[1], $array[2], $array[3]));

	}

}