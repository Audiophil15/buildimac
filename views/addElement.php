<div>
	
    <form method="post" action="post" >
        <label for="name">Nom élément:</label><br>
        <input type="text" id="name" name="name"><br>
        <label for="desc">Description:</label><br>
        <input type="textarea" id="desc" name="desc"><br>
        <label for="type">Type:</label>
        <select id="type" name="type" size="1">
            <option value="1">Toit</option>
            <option value="2">Mur</option>
            <option value="3">Fenêtre</option>
            <option value="4">Porte</option>
            <option value="5">Terrain</option>
        </select>
        <label for="desc">Image:</label><br>
        <input type="file" id="image" name="image"><br>
        <input type="submit" value="Valider">
    </form>

</div>