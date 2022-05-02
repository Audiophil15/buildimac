<div>

    <h3> Ajouter un élément </h3>
	
    <form method="post" action="post" >
        <input placeholder="Nom" type="text" id="name" name="name" required>
        <input placeholder="Description" type="textarea" id="desc" name="desc" required>
        <label for="type">Type:</label>
        <select placeholder="Type" id="type" name="type" size="1">
            <option value="1">Toit</option>
            <option value="2">Mur</option>
            <option value="3">Fenêtre</option>
            <option value="4">Porte</option>
            <option value="5">Terrain</option>
        </select>
        <label for="desc">Image:</label><br>
        <input type="file" id="image" name="image"><br>
        <input type="submit" class="submit" value="Valider">
    </form>

</div>