<?php

require_once("config/config.php");

class Model{

	protected $connexion;
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

}