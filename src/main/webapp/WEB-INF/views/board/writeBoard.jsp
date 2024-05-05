<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<meta charset="UTF-8">
<script>
$(function(){
		$("#btn-save").click(() => {
			let formData = new FormData();
			formData.append("title", $("#title").val());
			formData.append("id", $("#id").val());
		    formData.append("content", $("#content").val());
		    Array.from($('#attach')[0].files).map(a => formData.append('attach', a));
		  
			
 	        $.ajax({
				url:"createBoard",
				method:"post",
				data:formData,
				cache:false,
				processData:false,
				contentType:false,
				success:function(data){
					$(location).attr('href', 'list');
				}
			}) 
		}); 
	});
</script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</header>
	<form action="writeBoard" method="post">
	<div
		class="container-fluid  d-flex flex-column align-items-center m-0 my-5 p-0">

		<div
			class="d-flex justify-content-center align-items-center m-0 my-5 p-0">
			<div>
				<h1>Q&A 게시판</h1>
			</div>
		</div>

		<hr class="w-25 m-0 mb-5 p-0" />

		<div class="row w-50 border-top border-bottom m-0 p-0">
			<div
				class="col-2 d-flex justify-content-center align-items-center border-end m-0 p-0 py-2"
				style="background-color: #27374D; color: white">
				<p class="m-0 p-0">제목</p>
			</div>
			<div
				class="col-10 d-flex justify-content-center align-items-center m-0 p-0 py-2">
				<input id='qnatitle' name="qnatitle" type="text" class="form-control w-75">
			</div>
		</div>

		<div class="row w-50 border-bottom m-0 p-0">
			<div
				class="col-2 d-flex justify-content-center align-items-center border-end m-0 p-0 py-2"
				style="background-color: #27374D; color: white">
				<p class="m-0 p-0">작성자</p>
			</div>
			<div
				class="col-10 d-flex justify-content-center align-items-center m-0 p-0 py-2">
				<input id='memno' name="memno" readonly class="w-75 text-center m-0 p-0" value='2'></p>
			</div>
		</div>

		<div class="row w-50 border-bottom m-0 p-0">
			<div
				class="col-2 d-flex justify-content-center align-items-center border-end m-0 p-0 py-2"
				style="background-color: #27374D; color: white">
				<p class="m-0 p-0">내용</p>
			</div>
			<div
				class="col-10 d-flex justify-content-center align-items-center m-0 p-0 py-2">
			<!-- 	<textarea id='content'class="form-control w-75" rows="5"></textarea> -->
			<input id='qnacontent' name="qnacontent" type="text" class="form-control w-75">
			</div>
		</div>

		<!-- <div class="row w-50 border-bottom m-0 p-0">
			<div
				class="col-2 d-flex justify-content-center align-items-center border-end  m-0 p-0 py-2"
				style="background-color: #27374D; color: white">
				<p class="m-0 p-0">첨부파일</p>
			</div>
			<div
				class="col-10 d-flex flex-column justify-content-center align-items-center m-0 p-0 py-2">
				<input id='attach' type="file" class="form-control w-75 text-center m-0 p-0" multiple>
			</div>
		</div> -->

		<div
			class="d-flex justify-conten-center align-items-center m-0 my-5 p-0">
			<button id="btn-save" class="btn me-2" style="background-color: #273740; color: white">저장</button>
			<a href="list" class="btn border text-decoration-none text-dark">취소</a>
		</div>
	</div>
</form>
	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
</html>