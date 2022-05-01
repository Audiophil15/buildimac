<div>
	<?php
	foreach ($elements as $element) { ?>

		<img src=<?= $element['Image_E'] ?>>

		<h3><?= $element['Name_E'] ?></h3>

		<p><?= $element['Description_E'] ?></p>

		<a href ="/buildimac/element/delete/<?= $element['Id_E']?>" >Delete</a>

	<?php } ?>
</div>