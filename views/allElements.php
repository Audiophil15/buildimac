<?php if(isset($_SESSION['ID'])){ ?>

<div class="contain">
	
	<a class="submit" href="element/add">Ajouter un élément</a>

	<div class="all">
	<?php
	foreach ($elements as $element) { ?>

		<div class="one">
			<h3 class="titre_element"><a href="element/<?= $element['Id_E'] ?>"><?= $element['Name_E'] ?></a></h3>
			<p><?= $element['Description_E'] ?></p>
		</div>

	<?php } ?>
	</div>
</div>

<?php 
}else{
	echo "<script>alert(\"Vous n'êtes pas autorisé à accéder à cette page, si vous êtes admin connectez-vous.\")</script>";
    echo "<script>window.location.href=\"/buildimac\";</script>" ; 
}
?>

