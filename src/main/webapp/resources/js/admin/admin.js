//PopUp
//상품 상세 확인 및 정보 수정
function openProductDetail(){
		window.open('product_detail','new','scrollbars=yes,resizable=no width=500 height=600, left=0,top=0');
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
//상품 추가, 수정[팝업화면]에서 작업이 끝난 후 팝업창을 닫고 원래 페이지에서 새로고침하는 메소드
function closePopupAndRefresh() {
    // 팝업 창을 닫음
    window.close();
    // 원래 페이지를 새로 고침
    window.opener.location.reload();
}

function resetPassword(memno) {
	var data = {memno : memno};
	
	$.ajax({
		url: "reset_password",
		method: "get",
		data: data,
		success: function(data) {
			$('#resetcomplete').modal();
		}
	})
}