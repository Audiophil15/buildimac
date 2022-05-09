<div class="contain">
	<?php
	foreach ($elements as $element) { ?>

		<img src=<?= $element['Image_E'] ?>>

		<h3><?= $element['Name_E'] ?></h3>

		<p><?= $element['Description_E'] ?></p>

		<a class="submit" href ="/buildimac/element/delete/<?= $element['Id_E']?>" >Supprimer</a>

	<?php } ?>
</div>