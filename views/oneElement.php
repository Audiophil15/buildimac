<?php if(isset($_SESSION['ID'])){ ?>

<div class="contain">
	<?php
	foreach ($elements as $element) { ?>
	<div class="one_element">

		<div class="one_infos">

			<h3><?= $element['Name_E'] ?></h3>
			<p><?= $element['Description_E'] ?></p>

			<a class="submit" href ="/buildimac/element/delete/<?= $element['Id_E']?>" >Supprimer</a>
			<a class="submit" href ="/buildimac/element/modify/<?= $element['Id_E']?>" >Modifier</a>

		</div>

		<div class="one_image">
			<img src=<?= $element['Image_E'] ?>>
		</div>
	</div>
	<?php } ?>
</div>

<?php 
}else{
	echo "<script>alert(\"Vous n'êtes pas autorisé à accéder à cette page, si vous êtes admin connectez-vous.\")</script>";
    echo "<script>window.location.href=\"/buildimac\";</script>" ; 
}
?>