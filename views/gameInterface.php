

<div class="loader" id="loader"></div>

<div id="results" class="results">
<div class="bar-wrapper">
  Esthétique
  <div class="bar">
    <span class="esthe"></span>
  </div>
</div>


<div class="bar-wrapper">
  Isolation thermique
  <div class="bar">
    <span class="isother"></span>
  </div>
</div>


<div class="bar-wrapper">
  Isolation sonore
  <div class="bar">
    <span class="isoson"></span>
  </div>
</div>



<div class="bar-wrapper">
  Solidité
  <div class="bar">
    <span class="soli"></span>
  </div>
</div>



<div class="bar-wrapper">
  Résistance au feu
  <div class="bar">
    <span class="resifeu"></span>
  </div>
</div>


 
<div class="bar-wrapper">
  Etanchéité
  <div class="bar">
    <span class="etan"></span>
  </div>
</div>

<div class="bar-wrapper">
  Luminosité
  <div class="bar">
    <span class="lumi"></span>
  </div>
</div>

<div class="bar-wrapper">
  Accessibilité
  <div class="bar">
    <span class="access"></span>
  </div>
</div>


<div class="bar-wrapper">
  Sécurité
  <div class="bar">
    <span class="secu"></span>
  </div>
</div>



</div>


<div id="game-contain" class="contain game-contain">

  <!-- <div class="wrapper"> -->
    <div class="house-container" id="house-container">

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

          <div class="toit" data-num="<?= $toits[$i]['Id_E'] ?>">
            <img src=<?= $toits[$i]['Image_E'] ?>>
          </div>

        <?php } ?>
      </div>



      <div class="element-container">
        <?php
        for ($i = 0; $i < count($murs); $i++) { ?>

          <div class="mur" data-num="<?= $murs[$i]['Id_E'] ?>">
            <img src=<?= $murs[$i]['Image_E'] ?>>
          </div>

        <?php } ?>
      </div>



      <div class="element-container">
        <?php
        for ($i = 0; $i < count($fenetres); $i++) { ?>

          <div class="fenetre" data-num="<?= $fenetres[$i]['Id_E'] ?>">
            <img src=<?= $fenetres[$i]['Image_E'] ?>>
          </div>

        <?php } ?>
      </div>



      <div class="element-container">
        <?php
        for ($i = 0; $i < count($portes); $i++) { ?>
          <div class="porte" data-num="<?= $portes[$i]['Id_E'] ?>">
            <img src=<?= $portes[$i]['Image_E'] ?>>
          </div>

        <?php } ?>
      </div>


      <div class="element-container">
        <?php
        for ($i = 0; $i < count($terrains); $i++) { ?>
          <div class="terrain" data-num="<?= $terrains[$i]['Id_E'] ?>">
            <img src=<?= $terrains[$i]['Image_E'] ?>>
          </div>

        <?php } ?>
      </div>


    <!-- </div> -->
  </div>

  <div class="game-descri">
    <div class="game-descri-txt">
    <p>Construis-moi une maison de rêve !</p>
    <div class="cochon">
    <img src="/buildimac/css/images/cochon.png">
    </div>
    </div>
    <a class="submit" id="gameBtn">Valider</a>
  </div>

</div>

</div>



<script>
  let houseContainer;

  window.addEventListener("resize", (e) => {
    //console.log("jszdkefg");
    houseContainer = document.getElementById('house-container');
    //houseContainer.style.height = "600px";
    //houseContainer.style.height = parseInt(houseContainer.offsetWidth) * 0.63+"px";
    //$(".support-wrapper").css("height", parseInt($(".support-wrapper").css("width")) * 0.63);

    //console.log(houseContainer.offsetHeight)

  });


  let slideIndex = [1, 1, 1, 1, 1];

  let slideId = ["toit", "mur", "fenetre", "porte", "terrain"]


  //flèches next et prev
  function plusSlides(n, no) {
    showSlides(slideIndex[no] += n, no);
  }


  function showSlides(n, no) {
    let i;
    //récupérer le bon élement 
    let x = document.getElementsByClassName(slideId[no]);

    //pour la slide du dernier élément 
    if (n > x.length) {
      slideIndex[no] = 1
    }

    //rendre previous slide en display none
    if (n < 1) {
      slideIndex[no] = x.length
    }
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
      x[i].classList.remove("selected");
    }

    //Rendre current slide visible et lui ajouter la classe choisi
    x[slideIndex[no] - 1].style.display = "block";
    x[slideIndex[no] - 1].classList.add("selected");


  }
</script>

<script type='text/javascript' src='\buildimac\game.js'></script>