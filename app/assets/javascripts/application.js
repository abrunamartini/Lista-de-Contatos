// app/assets/javascripts/application.js
//= require_tree .

console.log('teste');

function searchAddress() {
	const zipCode = document.getElementById('zipCode').value.replace(/\D/g, '');
	
	if (zipCode.length === 8) {
		const url = `https://viacep.com.br/ws/${zipCode}/json/`;

		fetch(url).then(response => response.json()).then(data => {
		if (!data.erro) {
			document.getElementById('street').value = data.logradouro;
			document.getElementById('city').value = data.localidade;
			document.getElementById('UF').value = data.uf;
			document.getElementById('country').value = "Brasil";
		} else {
			alert('Address not found');
		}
		});
	} else {
		alert('CEP is invalid');
	}
}

function updateMarker(lat, lng) {
	const marker = document.getElementById('marker');
	marker.setAttribute('position', `${lat},${lng}`);
	
	const map = document.getElementById('map');
	map.setAttribute('center', `${lat},${lng}`);
}

document.addEventListener("DOMContentLoaded", function() {
	const cepParam = new URLSearchParams(window.location.search).get('cep');

	if (cepParam) {
		document.getElementById('zipCode').value = cepParam; 
		searchAddress(); 
	}
});

function storeFormData() {
	const name = document.getElementById('name').value;
	const cpf = document.getElementById('cpf').value;
	const phone = document.getElementById('phone').value;
	const birthday = document.getElementById('birthday').value;

	sessionStorage.setItem('name', name);
	sessionStorage.setItem('cpf', cpf);
	sessionStorage.setItem('phone', phone);
	sessionStorage.setItem('birthday', birthday);
}

document.addEventListener("DOMContentLoaded", function() {
  document.getElementById('data-clear').addEventListener("click", function() {
		sessionStorage.removeItem('name');
		sessionStorage.removeItem('cpf');
		sessionStorage.removeItem('phone');
		sessionStorage.removeItem('birthday');
  });
});
