<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
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
<title>로그인</title>
</head>
<body>
	<div class="d-flex flex-row">
		<div class="d-flex flex-column"
			style="height: 100vh; width: 250px; background-color: #9DB2BF;">
			<div class="d-flex justify-content-center align-items-center"
				style="height: 75px; background-color: #27374D;">
				<h4 class="m-0 text-white fw-bold">관리자 페이지</h4>
			</div>
			<div class="btn d-flex justify-content-center align-items-center"
				style="height: 52px">대쉬보드</div>
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">
							<img src="member.png" class="me-2" style="width: 20px;" /> 회원관리
						</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="d-flex flex-column">
								<button class="btn row-1">회원조회</button>
								<button class="btn row-1">마일리지 관리</button>
								<button class="btn row-1">관리자 계정 관리</button>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							<img src="product.png" class="me-2" style="width: 20px;" /> 상품관리
						</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="d-flex flex-column">
								<button class="btn row-1">상품 설정</button>
								<button class="btn row-1">상품 추가</button>
								<button class="btn row-1">재고 확인</button>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							<img src="order.png" class="me-2" style="width: 20px;" /> 주문관리
						</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="d-flex flex-column">
								<button class="btn row-1">미완료된 주문</button>
								<button class="btn row-1">완료된 주문</button>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingFour">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">
							<img src="board.png" class="me-2" style="width: 20px;" /> 게시판 관리
						</button>
					</h2>
					<div id="collapseFour" class="accordion-collapse collapse"
						aria-labelledby="headingFour" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="d-flex flex-column">
								<button class="btn row-1">QA게시판</button>
								<button class="btn row-1">공지사항</button>
								<button class="btn row-1">후기조회</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="d-flex flex-column align-items-center"
			style="width: 100vw;">
			<!--상단 바-->
			<div class="d-flex justify-content-end align-items-center"
				style="width: 100%; height: 75px; background-color: #27374D;">
				<button type="button" class="btn me-5 text-white fw-bold"
					style="background-color: #526D82;">로그아웃</button>
				<span class="text-white fw-bold">환영합니다. OOO님</span>
				<div class="mx-3"
					style="border-radius: 50%; width: 60px; height: 60px; background-color: aqua;"></div>
			</div>
			<div class="mt-3 d-flex justify-content-start" style="width: 90%;">
				<h4>대쉬보드</h4>
			</div>
			<div class="bg-dark" style="width: 90%; height: 4px;"></div>
			<div class="d-flex" style="width: 90%; height: 81vh;">
				<div
					class="col-8 h-100 d-flex flex-column align-items-center justrify-content-center">
					<div class="w-75 row-1"></div>
					<div></div>
					<div class="w-75 row-4"></div>
					<div class="w-75 row-2"></div>
					<div class="w-75 row-4"></div>
				</div>

				<div
					class="col-4 h-100 d-flex flex-column align-items-center justify-content-center">
					<h6>
						<b>공용 메모장</b>
					</h6>
					<textarea class="form-control mt-3"
						id="exampleFormControlTextarea1" rows="15"></textarea>
					<button class="btn text-white mt-3"
						style="background-color: #27374D;">저장</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>