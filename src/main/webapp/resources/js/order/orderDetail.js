const showModal = prodno =>{
	document.querySelector("#prodno").value = prodno;
}

const writeReview = () =>{

	const prodno = document.querySelector("#prodno").value;
	const rvtitle = document.querySelector("#rvtitle").value;
	const rvcontent = document.querySelector("#rvcontent").value;
	const rvrating = document.querySelector("input:checked").value
	 
	const params = {prodno, rvtitle, rvcontent, rvrating};
	console.log(params);
	
	$.ajax({
		url:"order/write_review",
		method:"post",
		data: params,
	});
	
	document.querySelector("#prodno").value = "";
	document.querySelector("#rvtitle").value = "";
	document.querySelector("#rvcontent").value = "";
	document.querySelector("input:checked").checked = false;
	document.querySelector("#fivestar").checked = true;
}