<div>
	<?php
	foreach ($elements as $element) { ?>


		<h3><a href="element/<?= $element['Id_E'] ?>"><?= $element['Name_E'] ?></a></h3>

		<p><?= $element['Description_E'] ?></p>

	<?php } ?>
</div>