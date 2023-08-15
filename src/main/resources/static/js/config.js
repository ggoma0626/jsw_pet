/* */

const firebaseConfig = {
  apiKey: "AIzaSyChkpskHv7xU58tR4JmZ1L1Px9AT_epNIs",
  authDomain: "jsw-pet-abff1.firebaseapp.com",
  projectId: "jsw-pet-abff1",
  storageBucket: "jsw-pet-abff1.appspot.com",
  messagingSenderId: "956233955846",
  appId: "1:956233955846:web:cbc4c155207d256abf6187",
  measurementId: "G-FJ7R8S0CM4"
};

var config = {
	
	getBase64 : function(file){
	   return new Promise(function(resolve, reject){
		   var reader = new FileReader();
		   reader.readAsDataURL(file);
		   reader.onload = function () {
			   resolve(reader.result);
		   };
		   reader.onerror = function (error) {
			   reject('Error: ', error);
		   };
	   });		
	},
	
	showLoading : function(){
		$('body').append(`
			<div class="loading-div">
				<div class="sk-chase">
				  <div class="sk-chase-dot"></div>
				  <div class="sk-chase-dot"></div>
				  <div class="sk-chase-dot"></div>
				  <div class="sk-chase-dot"></div>
				  <div class="sk-chase-dot"></div>
				  <div class="sk-chase-dot"></div>
				</div>		
			</div>
	`)
	}	
}



