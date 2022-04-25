<?php

class Element extends Model{

    public $Id_E;
    public $Name_E;
    public $Image_E;
    public $Description_E;
    public $Id_type;

    public function __construct()
    {
        parent::__construct();
        $this->table = "element";
		$this->idName = "Id_E";
    }

	/*
	pour l'instant ces méthodes là servent à rien et risque même de jamais servir mais je les ai fait au cas où on en aurait besoin plus tard
	*/
	public function getId(){
		return $this->Id_E; 
	}

	public function setId(int $id){
		$this->Id_E = $id;
	}

	public function getName(){
		return $this->Name_E;
	}

	public function setName(string $name){
		$this->Name_E = $name;
	}

	public function getImg(){
		return $this->Image_E;
	}

	public function setImg(string $img){
		$this->Image_E = $img;
	}

	public function getDescri(){
		return $this->Description_E;
	}

	public function setDesci(string $descri){
		$this->Description_E = $descri;
	}


}