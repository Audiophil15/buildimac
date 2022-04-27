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
}