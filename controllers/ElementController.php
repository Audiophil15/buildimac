<?php

class ElementController extends Controller{

	public $orderId = "Id_type";

	public function index(){

		$this->loadModel("Element");
		$elements = $this->Element->getAll($this->orderId);

		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('allElements.php', compact('elements')); //compact transforme la requête sql en un tableau associatif
		$this->view('layout/footer.php');
	
	}

	public function types(int $IdType){

		$this->loadModel("Element");
		$elements = $this->Element->getByType($IdType);

		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('allTypes.php', compact('elements')); //compact transforme la requête sql en un tableau associatif
		$this->view('layout/footer.php');
	
	}

	public function delete_element(int $id){

		$this->loadModel("Element");
		$this->Element->delete($id);
		
		header('Location: /buildimac/element');	
	}

	public function add_element($array){
		
		$this->loadModel("Element");
		$this->Element->add($array);

		header('Location: /buildimac/element');	
	}

	public function read(int $id){

		$this->loadModel("Element");
		$elements = $this->Element->getById($id);

		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('oneElement.php', compact('elements'));
		$this->view('layout/footer.php');
	}

	public function view_formulaire(){
		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('addElement.php');
		$this->view('layout/footer.php');
	}
	
	public function view_connexion(){

		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('connect.php');
		$this->view('layout/footer.php');
	}

	public function connect($array){
		
		$this->loadModel("Model");
		$info = $this->Model->getAdmin($array);

		if($info->rowCount() == 1){
			$admininfo = $info->fetch();         
			$_SESSION['ID'] = $admininfo['Id_A'];
			$_SESSION['Login'] = $admininfo['Login_A'];
			
			echo "<script>alert('Vous êtes connecté')</script>";
    		echo "<script>window.location.href=\"/buildimac\";</script>" ; 
		
		}else{
			echo "<script>alert('Identifiant ou mot de passe incorrect')</script>";
    		echo "<script>window.location.href=\"/buildimac/connect\";</script>" ; 
		}

	}

}