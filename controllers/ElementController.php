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

		$tailleMax = 2097152 ; 
        $extension = array('jpg', 'jpeg', 'png');
        if($array[4] <= $tailleMax){
            $extensionFichier = strtolower(substr(strrchr($array[5], '.'), 1)); 
            if(in_array($extensionFichier, $extension)){
                $chemin = "C:\\xampp\htdocs\buildimac\images\\".$array[1];
				var_dump($chemin);
                $resultat = move_uploaded_file($array[6], $chemin);
								
				$array[1] = "\"../images/".$array[1]."\"";
				$this->Element->add($array);
				
				echo "<script>alert('Element ajouté')</script>";
				echo "<script>window.location.href=\"/buildimac/element\";</script>" ;
             }else { 
				echo "<script>alert('Votre image doit être en format jpg, jpeg ou png')</script>";
                echo "<script>window.location.href=\"/buildimac/element/add\";</script>" ; 
			}
        } else { 
			echo "<script>alert('Votre image ne doit pas dépasser 2Mo')</script>";
			echo "<script>window.location.href=\"/buildimac/element/add\";</script>" ;  
		}
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

			echo "<script>alert('Vous êtes connecté ".$_SESSION['ID'] ."')</script>";
    		echo "<script>window.location.href=\"/buildimac/element\";</script>" ; 
		}else{
			echo "<script>alert('Identifiant ou mot de passe incorrect')</script>";
    		echo "<script>window.location.href=\"/buildimac/connect\";</script>" ; 
		}

	}

	public function imgType(){
		$this->loadModel("Element");
		$toits = $this->Element->getImgbyType(1);
		$murs = $this->Element->getImgbyType(2);
		$fenetres = $this->Element->getImgbyType(3);
		$portes = $this->Element->getImgbyType(4);
		$terrains = $this->Element->getImgbyType(5);

		$elements = array(
			"toits" => $toits,
			"murs" => $murs, 
			"fenetres" => $fenetres,
			"portes" => $portes,
			"terrains" => $terrains
		);
	
		$this->view('layout/header.php', ['title' => 'Game']);
		$this->view('gameInterface.php', $elements);
		$this->view('layout/footer.php');

	}

}