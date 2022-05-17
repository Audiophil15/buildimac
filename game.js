/*** SLIDER ***/
window.addEventListener("DOMContentLoaded", (e) => {
let gameBtn = document.getElementById('gameBtn');
console.log(gameBtn);

let date = new Date();

gameBtn.addEventListener('click', (event) => {
	event.preventDefault();

	let selectedElement = document.getElementsByClassName('selected');

	if(selectedElement.length == 5){
		console.log(selectedElement);
		let params = {};
		params.date =  toISOLocal(new Date()).slice(0, 19).replace('T', ' ');
		params.toit = selectedElement[0].getAttribute('data-num');
		params.mur = selectedElement[1].getAttribute('data-num');
		params.fenetre = selectedElement[2].getAttribute('data-num');
		params.porte = selectedElement[3].getAttribute('data-num');
		params.terrain = selectedElement[4].getAttribute('data-num');

		console.log(params);

		fetch('/buildimac/house', { method: 'POST', body: JSON.stringify(params)})
		.then(response => response.json())
		.then (data =>{
			console.log("yes");
			//once again, we need to display the data. The function 'displayPlanets' is for that purpose
			//displayPlanets(data);
		})
		.catch(error => { console.log(error) });	


	}
	
	

})

function toISOLocal(d) {
	const z = n => ('0' + n).slice(-2);
	let off = d.getTimezoneOffset();
	const sign = off < 0 ? '+' : '-';
	off = Math.abs(off);
	return new Date(d.getTime() - (d.getTimezoneOffset() * 60000)).toISOString().slice(0, -1) + sign + z(off / 60 | 0) + ':' + z(off % 60);
  }
 

});
/*** ***/