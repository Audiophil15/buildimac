<div class="contain">
	
	<a class="submit" href="element/add">Add element</a>

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

