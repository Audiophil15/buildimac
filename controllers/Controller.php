<?php
class Controller{

	//appeler le model
    public function loadModel(string $model){

        require_once("models/".$model.".php");
        $this->$model = new $model();
    }

	//appeler vue et y insérer les données
	public function view($temp, $datatab=array()){
		
		if(!isset($datatab['title'])){
			$title=" ";
		}

		foreach($datatab as $key=>$val){
			$$key = $val;
		}
	
		include("views/".$temp);
	}

}