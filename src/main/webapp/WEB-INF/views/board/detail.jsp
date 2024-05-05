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
		class="container-fluid d-flex flex-column align-items-center m-0 p-0">
		<div
			class="container-fluid d-flex flex-column align-items-center border border-secondary-subtle w-75 m-0 mb-5 p-0">
			<div class="row w-100 border-bottom border-secondary-subtle m-0 p-0">
				<div class="col-1 border-end border-secondary-subtle m-0 p-0">
					<div
						class="d-flex justify-content-center align-items-center h-100 m-0 p-0">
						<img class="img-fluid rounded-circle" src="photos\sun.jpg"
							width="80%" height="80%">
					</div>
				</div>

				<div class="col-11 d-flex flex-column align-items-center m-0 p-0">
					<div
						class="d-flex justify-content-between align-items-center border-bottom w-100 h-75 m-0 p-0 py-2">
						<p class="m-0 p-0 ps-3">제목이 들어갈 곳입니다</p>
					</div>

					<diV
						class="d-flex justify-content-start align-items-center w-100 h-25 m-0 p-0 py-4">
						<p class="border-end border-secondary-subtle m-0 p-0 px-3"
							style="font-weight: bold;">작성자</p>
						<p class="border-end border-secondary-subtle m-0 p-0 px-3">2024-04-29</p>
						<p class="border-end border-secondary-subtle m-0 p-0 px-3">24</p>
						<p class="m-0 p-0 ps-3">
							상태: <span class="badge rounded-pill"
								style="background-color: #526D82;">완료</span>
						</p>
					</diV>
				</div>
			</div>

			<div class="w-100 m-0 p-0 p-5 mb-5">
				<p class="m-0 p-0 ps-3">
					안녕하세요. <br /> <br />사용환경 : 크롬 5.0 <br />QnA 게시판에서 해당 페이지을 글을 읽고
					목록을 누르면 항상 1페이지로 갑니다. <br />원래 이런것인지요? <br />그리고 뒤로 가기도 적용이 되질
					않네요. <br />프레임워크 게시판도 이렇게 되어 있는지 궁금합니다.
				</p>
			</div>

			<div
				class="d-flex justify-content-start align-items-center w-100 m-0 p-0 px-5">
				<div
					class="d-flex flex-column justify-content-center align-items-start border border-2 border-secondary-subtle w-100  m-0 mb-5 p-0"
					style="position: relative;">
					<span class="m-0  px-3 py-2 rounded-pill text-center"
						style="color: white; background-color: #27374D; position: absolute; top: -10%; left: -1%;">답변
						대기 중입니다</span>
					<p class="m-0 px-3 py-5">
						답변이 없습니다 <br /> <br />없다니까요 <br />없어요 없어 <br />돌아가요

					</p>
				</div>

			</div>

		</div>
		<div class="w-75 m-0 mb-5 p-0">
			<div
				class="d-flex justify-content-start align-items-center border-top border-bottom border-secondary-subtle w-100 m-0 px-5 py-1">
				<p class="m-0 p-0">&#9651이전글</p>
			</div>
			<div
				class="d-flex justify-content-start align-items-center border-bottom border-secondary-subtle w-100 m-0 px-5 py-1">
				<p class="m-0 p-0">&#9661다음글</p>
			</div>
		</div>

		<div
			class="d-flex w-75 justify-content-center align-items-center m-0 mb-3 p-0">
			<a class="btn btn-sm m-0 p-0"
				style="background-color: #27374D; color: white;">목록</a>
		</div>

		<div
			class="d-flex w-75 justify-content-center align-items-center m-0 p-0">
			<a class="btn btn-sm border border-secondary-subtle m-0 me-3 p-0">수정</a>
			<a class="btn btn-sm border border-secondary-subtle m-0 p-0">삭제</a>
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