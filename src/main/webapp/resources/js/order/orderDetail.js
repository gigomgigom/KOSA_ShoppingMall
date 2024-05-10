const showModal = prodno =>{
	document.querySelector("#prodno").value = prodno;
}

const writeReview = () =>{
	const ordno = document.querySelector("#ordno").value;
	const prodno = document.querySelector("#prodno").value;
	const rvtitle = document.querySelector("#rvtitle").value;
	const rvcontent = document.querySelector("#rvcontent").value;
	const rvrating = document.querySelector("input:checked").value
	const params = {ordno, prodno, rvtitle, rvcontent, rvrating};

	$.ajax({
		url:"/javajavajo_mini_web/review/write_review",
		method:"post",
		data: params,
		success: function(data){
			if(data["result"] === "success"){
				document.querySelector("#reviewButton"+prodno).innerHTML = 
				"<a prodno=${ordprod.prodno} href='/javajavajo_mini_web/item/item_detail?prodno=" + prodno +
				"' class='btn btn-dark btn-sm'>상품으로 이동</a>"
				console.log("hit")
			}
		},
	});
	
	document.querySelector("#prodno").value = "";
	document.querySelector("#rvtitle").value = "";
	document.querySelector("#rvcontent").value = "";
	document.querySelector("input:checked").checked = false;
	document.querySelector("#fivestar").checked = true;

}

