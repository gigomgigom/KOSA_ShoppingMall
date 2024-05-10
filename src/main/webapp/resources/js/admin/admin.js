
//PopUp
//상품 상세 확인 및 정보 수정
function openProductDetail(prodno){
	var prodnoParam = prodno;
	var url = 'product_detail?prodno=' + prodnoParam;
	window.open(url, 'new', 'scrollbars=yes,resizable=no,width=500,height=600,left=0,top=0');
}
//상품 추가 팝업
function openAddProduct(){
	window.open('add_product','new','scrollbars=yes,resizable=no width=500 height=600, left=0,top=0');
}

//상품 추가 화면 - 이미지 업로드시 미리보기 썸네일 띄우기
function setThumbnail(event) {
	for (var image of event.target.files) {
		var reader = new FileReader();

		reader.onload = function(event) {
			document.getElementById('repimg-container').setAttribute("src", event.target.result);
		};
		reader.readAsDataURL(image);
	}
}
//상품 수정(추가)될 시 요청하고 요청이 성공하면 창을 닫게끔 함
function editProduct() {
	var formData = $(this).serialize();
	console.log(formData);
	// AJAX 요청을 만들어 요청 컨트롤러에 보냄
	$.ajax({
		url: 'edit_product',
		type: 'post',
		data: formData,
		error: function(xhr, status, error) {
			// 오류가 발생했을 때 실행할 코드
			console.error(xhr.responseText); // 오류 내용을 콘솔에 출력
			// 오류 처리 등을 수행할 수 있음
		}
	});
}

//상품 추가, 수정[팝업화면]에서 작업이 끝난 후 팝업창을 닫고 원래 페이지에서 새로고침하는 메소드
function closePopupAndRefresh() {
	// 팝업 창을 닫음
	//window.close();
	// 원래 페이지를 새로 고침
	window.opener.location.reload();
}

//폼 제출 버튼 클릭 이벤트 처리
const editProductDetail = () => {
	console.log('---');
	const prodno = document.querySelector('#productno').value;
	const ctgno = document.querySelector('#ctg').value;
	const prodname = document.querySelector('#productname').value;
	const prodprice = document.querySelector('#productprice').value;
	const prodstock = document.querySelector('#productstock').value;
	//var repattach = document.querySelector('#attach1');
	//var dtlattach = document.querySelector('#attach2');
	
	const product = {prodno:prodno, ctgno:ctgno, prodname:prodname, prodprice:prodprice, prodstock:prodstock};
	
	console.error(product);
	
	$.ajax({
		url:"edit_product",
		type:"post",
		data: product,
		contentType : "application/json",
		success: closePopupAndRefresh(),
		error: function(xhr, status, error) {
			// 오류가 발생했을 때 실행할 코드
			console.error(xhr.responseText); // 오류 내용을 콘솔에 출력
			// 오류 처리 등을 수행할 수 있음
		}
	});
}