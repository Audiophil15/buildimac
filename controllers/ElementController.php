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

                $resultat = move_uploaded_file($array[6], $chemin);
								
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

	public function add_indicator($array)
	{
		$this->loadModel("Element");
		$this->Element->add_score($array);
		
	}

	public function modify_element($array){
		$this->loadModel("Element");
		$this->Element->modify($array);	
		echo "<script>alert('Element modifié')</script>";
		echo "<script>window.location.href=\"/buildimac/element\";</script>" ;
		
	}

	public function read(int $id){

		$this->loadModel("Element");
		$elements = $this->Element->getById($id);

		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('oneElement.php', compact('elements'));
		$this->view('layout/footer.php');
	}

	public function view_formulaire(){
		$this->loadModel("Element");
		$elements = $this->Element->getIndicator();

		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('addElement.php',  compact('elements'));
		$this->view('layout/footer.php');
	}

	public function view_modifier_formulaire(int $id){
		$this->loadModel("Element");
		$elements = $this->Element->getById($id);
		$indicators = $this->Element->getElementIndicator($id);

		$this->view('layout/header.php', ['title' => 'Elements']);
		$this->view('modifyElements.php', compact('elements', 'indicators'));
		$this->view('layout/footer.php');
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