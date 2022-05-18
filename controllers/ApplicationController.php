<?php
class ApplicationController extends Controller{

	public function view_index(){

		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('home.php');
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
    		echo "<script>window.location.href=\"/buildimac/element\";</script>" ; 
		}else{
			echo "<script>alert('Identifiant ou mot de passe incorrect')</script>";
    		echo "<script>window.location.href=\"/buildimac/connect\";</script>" ; 
		}

	}

	
}