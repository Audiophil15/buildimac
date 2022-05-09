<div class="contain">
  <div class="house-container">

  <div class="arrow-container">
    <a class="prev" onclick="plusSlides(-1,0)"><</a>
    <a class="next" onclick="plusSlides(1,0)">></a>
    <a class="prev" onclick="plusSlides(-1,1)"><</a>
    <a class="next" onclick="plusSlides(1,1)">></a>
    <a class="prev" onclick="plusSlides(-1,2)"><</a>
    <a class="next" onclick="plusSlides(1,2)">></a>
    <a class="prev" onclick="plusSlides(-1,3)"><</a>
    <a class="next" onclick="plusSlides(1,3)">></a>
    <a class="prev" onclick="plusSlides(-1,4)"><</a>
    <a class="next" onclick="plusSlides(1,4)">></a>
  </div>

  <div class="element-container"> 
  <?php
  for ($i = 0; $i < count($toits); $i++) { ?>

    <div class="toit" data-num="<?=$toits[$i]['Id_E']?>">
    <img src=<?= $toits[$i]['Image_E'] ?>>
    </div>

  <?php } ?>
  </div>



  <div class="element-container">
  <?php
  for ($i = 0; $i < count($murs); $i++) { ?>
    
    <div class="mur" data-num="<?=$murs[$i]['Id_E']?>">
    <img src=<?= $murs[$i]['Image_E'] ?>>
    </div>

  <?php } ?>
  </div>



  <div class="element-container"> 
  <?php
  for ($i = 0; $i < count($fenetres); $i++) { ?>

    <div class="fenetre" data-num="<?=$fenetres[$i]['Id_E']?>">
    <img src=<?= $fenetres[$i]['Image_E'] ?>>
    </div>

  <?php } ?>
  </div>



  <div class="element-container"> 
  <?php
  for ($i = 0; $i < count($portes); $i++) { ?>
    <div class="porte" data-num="<?=$portes[$i]['Id_E']?>">
    <img src=<?= $portes[$i]['Image_E'] ?>>
    </div>

  <?php } ?>
  </div>


  <div class="element-container"> 
  <?php
  for ($i = 0; $i < count($terrains); $i++) { ?>
    <div class="terrain" data-num="<?=$terrains[$i]['Id_E']?>">
    <img src=<?= $terrains[$i]['Image_E'] ?>>
    </div>

  <?php } ?>
  </div>


  </div>

</div>

  <script>

  let slideIndex = [1,1,1,1,1];

  let slideId = ["toit", "mur","fenetre", "porte", "terrain"]


  //flèches next et prev
  function plusSlides(n,no) {
    showSlides(slideIndex[no] += n, no);
  }


  function showSlides(n, no) {
    let i;
    //récupérer le bon élement 
    let x = document.getElementsByClassName(slideId[no]);

    //pour la slide du dernier élément 
    if (n > x.length) {slideIndex[no] = 1}   
    
    //rendre previous slide en display none
    if (n < 1) {slideIndex[no] = x.length}
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
      x[i].classList.remove("selected");
    }

    //Rendre current slide visible et lui ajouter la classe choisi
    x[slideIndex[no]-1].style.display = "block";  
    x[slideIndex[no]-1].classList.add("selected");


  }

  </script>