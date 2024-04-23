<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">

</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</header>

	<div
		class="container-fluid  d-flex flex-column align-items-center m-0 my-5 p-0">
		<div class="w-75 m-0 p-0 text-center">
			<h1 class="m-0 mb-3 p-0">제목</h1>
		</div>

		<div class="d-flex justify-content-center w-50 m-0 p-0"
			style="background-color: #27374D; color: white;">
			<div class="row w-75 m-0 my-2 p-0 text-center">
				<p class="col-3 m-0 p-0 border-end border-white">작성자:${board.bid}</p>
				<p class="col-3 m-0 p-0 border-end border-white">
					작성일:
					<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" />
				</p>
				<p class="col-3 m-0 p-0 border-end border-white">조회수:${board.hitcount}</p>
				<p class="col-3 m-0 p-0">
					상태: <span class="badge rounded-pill text-bg-primary">완료</span>
				</p>
			</div>
		</div>

		<div class="row w-50 m-5 me-0 p-0 ">
			<div class="d-flex justify-content-start m-0 p-0">
				<div
					class="d-flex col-3 justify-content-center align-items-center rounded-circle bg-primary text-white m-0 me-2 p-0"
					style="width: 50px; height: 50px;">
					<h1>Q</h1>
				</div>
				<p class="col-9">${board.bcontent}</p>
			</div>
		</div>
		<div class="row w-50 m-0 p-0">
			<div
				class="col-2 d-flex justify-content-center align-items-start m-0 p-0">
				<a id="attach-open" href="javascript:toggleAttach('open');"
					class="text-decoration-none text-dark m-0 p-0"
					style="font-size: 0.75rem;">첨부 파일 보기&#8744;</a> <a
					id="attach-close" href="javascript:toggleAttach('close');"
					class="text-decoration-none text-dark m-0 p-0"
					style="display: none; font-size: 0.75rem;">첨부 파일 닫기&#8743;</a>
			</div>
			<div class="col-10 d-flex align-items-start m-0 p-0">
				<ul id="attach-item" class="list-unstyled m-0 p-0"
					style="display: none;">
					<li class="m-0 p-0"><a href="downloadFile?fileName=${board.battach}"
						class="text-dark m-0 p-0" style="font-size: 0.75rem">${board.battach}</a></li>
				</ul>
			</div>
		</div>
		<hr class="w-50 m-0 my-5 p-0 " />

		<div class="row w-50 m-5 me-0 p-0 ">
			<div
				class="d-flex col-3 justify-content-center align-items-center rounded-circle bg-danger text-white m-0 me-2 p-0"
				style="width: 50px; height: 50px;">
				<h1>A</h1>
			</div>
			<p class="col-9">
				자동 답변입니다
			</p>
		</div>

		<div class="d-flex justify-content-center w-25 m-0 my-5 p-0">
			<a class="btn" href="list"
				style="background-color: #27374D; color: white">목록</a>
		</div>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>

	<script>
	const toggleAttach = oc =>{
		if(oc === "open"){
			$("#attach-open").css("display","none");
			$("#attach-close").css("display","inline");
			$("#attach-item").css("display","block");
		} else{
			$("#attach-open").css("display","inline");
			$("#attach-close").css("display","none");
			$("#attach-item").css("display","none");
		}
	};
</script>
</body>
</html>