<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>
<body>
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>


	<form action="update_qna" method="post" enctype="multipart/form-data">
		<div
			class="container-fluid  d-flex flex-column align-items-center m-0 my-5 p-0"
			style="min-width: 1250px">

			<div
				class="d-flex justify-content-center align-items-center m-0 my-5 p-0">
				<div>
					<h1>Q&A</h1>
				</div>
			</div>

			<div class="row w-50 border-top border-bottom m-0 p-0">

				<input id="qnano" type="hidden" name="qnano" value="${qna.qnano}">

				<div
					class="col-2 d-flex justify-content-center align-items-center border-end m-0 p-0 py-3"
					style="background-color: #9523DC; color: white">
					<p class="m-0 p-0">제목</p>
				</div>
				<div
					class="col-10 d-flex justify-content-center align-items-center m-0 p-0 py-3">
					<input id='qnatitle' name="qnatitle" type="text"
						class="form-control w-75" value="${qna.qnatitle}">
				</div>
			</div>

			<div class="row w-50 border-bottom m-0 p-0">
				<div
					class="col-2 d-flex justify-content-center align-items-center border-end m-0 p-0 py-3"
					style="background-color: #9523DC; color: white">
					<p class="m-0 p-0">내용</p>
				</div>
				<div
					class="col-10 d-flex justify-content-center align-items-center m-0 p-0 py-3">
					<textarea id='content' name="qnacontent" class="form-control w-75"
						rows="5">${qna.qnacontent}</textarea>
				</div>
			</div>

			<div class="row w-50 border-bottom m-0 p-0">
				<div
					class="col-2 d-flex justify-content-center align-items-center border-end  m-0 p-0 py-3"
					style="background-color: #9523DC; color: white">
					<p class="m-0 p-0">첨부파일</p>
				</div>
				<div
					class="col-10 d-flex flex-column justify-content-center align-items-center m-0 p-0 py-3">
					<c:if test="${qna.qnaattachoname != null }">
						<div
							class="d-flex justify-content-between align-items-center w-75 m-0 p-0"
							id="existAttach">
							<p>
								<a class="text-dark"
									href="${pageContext.request.contextPath}/qna/downloadQnaAttach?qnano=${qna.qnano}">${qna.qnaattachoname}</a>
							</p>
							<p>
								<a class="btn btn-sm" onclick="deleteAttach()">&#10060;</a>
							</p>
						</div>
					</c:if>
					<input id='qnaattach' type="file" name="qnaattach"
						class="form-control w-75 text-center m-0 p-0">
				</div>
			</div>

			<div class="form-check mt-5">
				<input class="form-check-input" type="checkbox" name="qnalock"
					value="1"> <label class="form-check-label">비밀글 설정</label>
			</div>
			<div
				class="d-flex justify-conten-center align-items-center m-0 my-5 p-0">

				<button id="btn-save" class="btn me-2"
					style="background-color: #9523DC; color: white">수정</button>

				<a href="qna_list" class="btn border text-decoration-none text-dark">취소</a>
			</div>
		</div>
	</form>
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>
</body>
<script>
const deleteAttach = () => {
	const qnano = document.querySelector("#qnano").value;
	
	let params = {qnano};
	
	$.ajax({
		url:"delete_attach",
		method:"post",
		data: params,
		success: function(data){
			if(data["result"] == "success"){
				document.querySelector("#existAttach").innerHTML = "";
			}
		}
	});
};
</script>
</html>