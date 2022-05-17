<div class="contain">
    <?php
    foreach ($elements as $element) {
    }
    ?>
    <h2> Modifier un élément </h2>
	
    <form method="POST" action="/buildimac/element/update/<?= $element['Id_E']?>" enctype="multipart/form-data">
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
    </form>

</div>