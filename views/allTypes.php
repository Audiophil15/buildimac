<div>

	<a href="/buildimac/type/1">toit</a>
	<a href="/buildimac/type/2">mur</a>
	<a href="/buildimac/type/3">fenêtre</a>
	<a href="/buildimac/type/4">porte</a>
	<a href="/buildimac/type/5">terrain</a>

	<?php
	foreach ($elements as $element) { ?>


		<h3><a href="/buildimac/element/<?= $element['Id_E'] ?>"><?= $element['Name_E'] ?></a></h3>

		<p><?= $element['Description_E'] ?></p>

	<?php } ?>
</div>