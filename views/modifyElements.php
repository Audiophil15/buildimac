<?php if(isset($_SESSION['ID'])){ ?>

<div class="contain">
    <?php
    foreach ($elements as $element) {
    }
    ?>
    <h2> Modifier un élément </h2>
	
    <form method="POST" action="/buildimac/element/update/<?= $element['Id_E']?>" enctype="multipart/form-data">
       <div class="formulaire">    
            <div class="partie1">
                <input placeholder="Nom" type="text" id="name" name="name" class="name" value="<?= $element['Name_E']?>">
                <textarea placeholder="Description" id="desc" name="desc" class="desc" required><?= $element['Description_E']?></textarea>
                <label name="type" for="type">Type:</label>
                <select placeholder="Type" id="type" name="type" size="1">
                    <option <?php if($element['Id_type']==1){?> selected <?php } ?> value="1">Toit</option>
                    <option <?php if($element['Id_type']==2){?> selected <?php } ?>value="2">Mur</option>
                    <option <?php if($element['Id_type']==3){?> selected <?php } ?>value="3">Fenêtre</option>
                    <option <?php if($element['Id_type']==4){?> selected <?php } ?>value="4">Porte</option>
                    <option <?php if($element['Id_type']==5){?> selected <?php } ?>value="5">Terrain</option>
                </select>
                <!--<label for="image">Image:</label>
                <input type="file" id="image" name="image">-->
                
        <input type="submit" class="submit" value="Valider">
            </div>
            <div class="partie2">
                <?php foreach ($indicators as $indicator) { ?>
                <label name="indicator" for="indicator"><?= $indicator['Name_I'] ?></label>
                <input value="<?= $indicator['Points'] ?>" type="number" name="<?= $indicator['Id_I'] ?>" min="0" max="10">
                <?php } ?>
            </div>
            
        </div>
        
    </form>

</div>

<?php 
}else{
	echo "<script>alert(\"Vous n'êtes pas autorisé à accéder à cette page, si vous êtes admin connectez-vous.\")</script>";
    echo "<script>window.location.href=\"/buildimac\";</script>" ; 
}
?>