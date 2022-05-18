<?php if(isset($_SESSION['ID'])){ ?>

<div class="contain">

    <h2> Ajouter un élément </h2>
	
    <form method="POST" action="post" enctype="multipart/form-data">
        <div class="formulaire">    
            <div class="partie1">
                <input placeholder="Nom" type="text" id="name" name="name" class="name" required>
                <textarea placeholder="Description" id="desc" name="desc" class="desc" required></textarea>
                <label name="type" for="type">Type:</label>
                <select placeholder="Type" id="type" name="type" size="1">
                    <option value="1">Toit</option>
                    <option value="2">Mur</option>
                    <option value="3">Fenêtre</option>
                    <option value="4">Porte</option>
                    <option value="5">Terrain</option>
                </select>
                <label for="image">Image:</label>
                <input type="file" id="image" name="image">
                
                <input type="submit" class="submit" value="Valider">
            </div>
            
            <div class="partie2">
                <?php foreach ($elements as $element) { ?>
                <label name="indicator" for="indicator"><?= $element['Name_I'] ?></label>
                <input required value="0" type="number" name="<?= $element['Id_I'] ?>" min="0" max="10">
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
