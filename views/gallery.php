<?php 
	require("controllers/HouseController.php");
?>

<div class="gallery">
<?php 
$elements = getHousesElements();
foreach ($houses as $house => $elements) {
	foreach ($elements as $element) {
		?>
		<img src="images/<?= $element?>" class="">
	}
}
</div>