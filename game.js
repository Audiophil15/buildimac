/*** SLIDER ***/
window.addEventListener("DOMContentLoaded", (e) => {

let gameBtn = document.getElementById('gameBtn');
console.log(gameBtn);
let container = document.getElementById('results');
let gameContainer = document.getElementById('game-contain');
let loader = document.getElementById('loader');

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
		let content = "";
		
		fetch('/buildimac/house', { method: 'POST', body: JSON.stringify(params)})
		.then( 
			fetch('/buildimac/game/results', { method: 'POST', body: JSON.stringify(params)})
			.then(response => response.json())
			.then (data =>{
				console.log(data);

				console.log(data[4])

				document.documentElement.style.setProperty('--end-esthe', data[0]/10+"%" );

				document.documentElement.style.setProperty('--end-isother', data[1]/10+"%" );

				document.documentElement.style.setProperty('--end-isoson', data[2]/10+"%" );

				document.documentElement.style.setProperty('--end-soli', data[3]/10+"%" );

				document.documentElement.style.setProperty('--end-resifeu', data[4]/10+"%" );

				document.documentElement.style.setProperty('--end-etan', data[5]/10+"%" );

				document.documentElement.style.setProperty('--end-lumi', data[6]/10+"%" );

				document.documentElement.style.setProperty('--end-access', data[7]/10+"%" );

				document.documentElement.style.setProperty('--end-secu', data[8]/10+"%" );

				gameContainer.style.display = "none";
				loader.style.display = "block";
				setTimeout(function(){ 
					container.style.display = "flex";
					loader.style.display = "none";
					
				},1500);

			})
			.catch(error => { console.log(error) })
			
		)

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
