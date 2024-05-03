<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<script>
		
		</script>
<!-- jQuery 외부 라이브러리 설정 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Latest compiled and minified CSS -->
<!-- 클라이언트에게 라이브러리 파일을 어디 서버에 다운받을 지 배정받는다. -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex flex-row">
		<%@ include file="/WEB-INF/views/admin/common/admin_menu.jsp"%>
		<div class="d-flex flex-column align-items-center" id="view_container"
			style="width: 100vw;">
			<!--상단 바-->
			<div class="d-flex justify-content-between align-items-center"
				style="width: 100%; height: 75px; background-color: #27374D;">
				<h4 class="my-0 ms-5 ps-5 text-white">상품 관리</h4>
				<div class="d-flex flex-row align-items-center">
					<button type="button" class="btn me-5 text-white fw-bold"
						style="background-color: #526D82;">로그아웃</button>
					<span class="text-white fw-bold">환영합니다. 관리자 심영조님</span>
					<div class="mx-3"
						style="border-radius: 50%; width: 60px; height: 60px; background-color: aqua;">
					</div>
				</div>
			</div>
			<div class="d-flex" style="width: 90%; height: 91vh;">
				<div class="mt-5 w-100 d-flex flex-column">
					<h5>
						<b>상품 추가</b>
					</h5>
					<hr class="w-100" />
					<div class="d-flex flex-row">
						<!-- 회원정보 출력(수정 input폼) -->
						<div class="d-flex flex-column col-3">
							<form class="d-flex flex-column w-100 justify-content-center"
								action="#" method="post">
								<div class="my-3">
									<div class="form-group mb-2">
						            	<label for="ctg">카테고리</label>
						            	<select class="form-control" id="ctg" name="ctgno">
						               		<option value="1">사료</option>
						               		<option value="2">간식</option>
						               		<option value="3">영양제</option>
						            	</select>
						        	</div>
								</div>
								<div class="mb-3">
									<label for="mno" class="form-label">상품명</label> 
									<input type="text" class="form-control" id="mno" name="memno">
								</div>
								<div class="mb-3">
									<label for="mid" class="form-label">상품 가격</label> 
									<input type="text" class="form-control" id="mid" name="memid">
								</div>
								<div class="mb-3">
									<label for="memail" class="form-label">입고된 수량</label> 
									<input type="number" class="form-control" id="memail" name="mememail" value="0">
								</div>								
								<div class="w-100 d-flex flex-column align-items-center">
									<button class="btn w-50 border my-4">추가</button>
								</div>
							</form>
						</div>
						<div class="col-9">
							<div class="container-fluid h-50">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>