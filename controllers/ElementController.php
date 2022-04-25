<?php

class ElementController extends Controller{

    public $orderId = "Id_type";

    public function index(){

        $this->loadModel('Element');
        $elements = $this->Element->getAll($this->orderId);

        $this->view('layout/header.php', ['title' => 'Elements']);
        $this->view('allElements.php', compact('elements')); //compact transforme la requête sql en un tableau associatif
        $this->view('layout/footer.php');
	
    }

    public function read($id){

        $this->loadModel('Element');
        $elements = $this->Element->getById($id);

        $this->view('layout/header.php', ['title' => 'Elements']);
        $this->view('oneElement.php', compact('elements'));
        $this->view('layout/footer.php');
    }
}