<div class="contain">

	<a href="/buildimac/type/1">toit</a>
	<a href="/buildimac/type/2">mur</a>
	<a href="/buildimac/type/3">fenêtre</a>
	<a href="/buildimac/type/4">porte</a>
	<a href="/buildimac/type/5">terrain</a>

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