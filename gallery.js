window.addEventListener("DOMContentLoaded", (e) => {

	fetch("/buildimac/house")
			.then( response => response.json() )
			.then( data => {
			
				console.log(data);
				index(data);
			})
			.catch(error => { console.log(error) });
	
	});
	
	function index(elements){
		const container = document.getElementById('all');
				let content ="";
				
				elements.forEach(function (element) {
	
					content += "<div class='house-wrapper'><div class='house-element'><div class='house-toit'><img src="+element[0]+"></div></div> <div class='house-element'><div class='house-mur'><img src="+element[1]+"></div></div> <div class='house-element'><div class='house-fenetre'><img src="+element[2]+"></div></div> <div class='house-element'><div class='house-porte'><img src="+element[3]+"></div></div> <div class='house-element'><div class='house-terrain'><img src="+element[4]+"></div></div></div>" ;
				});
				container.innerHTML = content;
	}