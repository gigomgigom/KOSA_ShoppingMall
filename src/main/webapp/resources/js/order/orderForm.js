const orderer = document.querySelector("#orderer");
const recipient = document.querySelector("#recipient");

const defaultname = orderer.querySelector("#ordname").value;
const defaulttel = orderer.querySelector("#ordtel").value;
const defaultpostno = orderer.querySelector("#ordpostno").value;
const defaultadr = orderer.querySelector("#ordadr").value;
const defaultadrdtl = orderer.querySelector("#ordadrdtl").value;
const defaultemail = orderer.querySelector("#ordemail").value;
const defaultFinPrice = document.querySelector("#finprice").innerText.slice(0,-1)*1 +"원";

document.addEventListener('keydown', function(event) {
    if ((event.keyCode || event.which) === 13) {
        event.preventDefault();
    }
}, true);

const defaultInfo = () => {
	const orderer = document.querySelector("#orderer");
	const recipient = document.querySelector("#recipient");
	const sameasuser = document.querySelector("#sameasuser").checked = true;
	const sameasorderer = document.querySelector("#sameasorderer").checked = false;
	
	recipient.querySelector("#rcptname").value = defaultname;
	recipient.querySelector("#rcpttel").value = defaulttel;
	recipient.querySelector("#rcptpostno").value = defaultpostno;
	recipient.querySelector("#rcptadr").value = defaultadr;
	recipient.querySelector("#rcptadrdtl").value = defaultadrdtl;
	recipient.querySelector("#rcptemail").value = defaultemail;
}
		
const ordInfo = () =>{
	const sameasuser = document.querySelector("#sameasuser").checked = false;
	const sameasorderer = document.querySelector("#sameasorderer").checked = true;
	
	recipient.querySelector("#rcptname").value = orderer.querySelector("#ordname").value;
	recipient.querySelector("#rcpttel").value = orderer.querySelector("#ordtel").value;
	recipient.querySelector("#rcptpostno").value = orderer.querySelector("#ordpostno").value;
	recipient.querySelector("#rcptadr").value = orderer.querySelector("#ordadr").value;
	recipient.querySelector("#rcptadrdtl").value = orderer.querySelector("#ordadrdtl").value;
	recipient.querySelector("#rcptemail").value = orderer.querySelector("#ordemail").value;
	
}

const usePoint = () => {
	const haspoint = document.querySelector("#haspoint").textContent;
	const discprice = document.querySelector("#discprice");
	const useprice = document.querySelector("#useprice");
	const finprice = document.querySelector("#finprice");
	finprice.innerText = defaultFinPrice;
	
	const ordprice = document.querySelector("#ordprice").innerText.slice(0,-1) * 1;
	const deliveryprice = document.querySelector("#deliveryprice").innerText.slice(0,-1) * 1 ;
	const payprice = ordprice +  deliveryprice;

	
	if(haspoint * 1 < discprice.value*1){
		discprice.value = haspoint;
	}
	
	if(payprice * 1 < discprice.value*1){
		discprice.value = payprice;
	}
	
	useprice.innerText = discprice.value + "원";
	finprice.innerText = (finprice.innerText.slice(0,-1)*1 - discprice.value*1) + "원";
}