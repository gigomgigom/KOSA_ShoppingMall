<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
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
		<%@ include file="/WEB-INF/views/admin/common/admin_menu.jsp"%>
		<div class="d-flex flex-column align-items-center" id="view_container"
			style="width: 100vw;">
			<!--상단 바-->
			<div class="d-flex justify-content-between align-items-center"
				style="width: 100%; height: 75px; background-color: #27374D;">
				<h4 class="my-0 ms-5 ps-5 text-white">대쉬보드</h4>
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
				<div
					class="container col-8 h-100 d-flex flex-column align-items-center justify-content-center">
					<!--주문 현황-->
					<div class="w-100 my-1">
						<div class="d-flex flex-column justify-content-start">
							<h5>
								<b>오늘 주문 현황</b>
							</h5>
							<div class="border my-4 p-3" style="width: 90%;">
								<div class="d-flex w-100 p-1">
									<div class="col-4 text-center">
										<h5>
											<b>결제완료 주문</b>
										</h5>
									</div>
									<div class="col-4 text-center">
										<h5>
											<b>배송대기 중</b>
										</h5>
									</div>
									<div class="col-4 text-center">
										<h5>
											<b>완료된 주문</b>
										</h5>
									</div>
								</div>
								<div class="d-flex w-100 p-1">
									<div class="col-4 text-center">
										<h5>15건</h5>
									</div>
									<div class="col-4 text-center">
										<h5>4건</h5>
									</div>
									<div class="col-4 text-center">
										<h5>30건</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="w-100 mb-1">
						<div class="d-flex flex-column justify-content-start">
							<h5>
								<b>매출 현황</b>
							</h5>
							<div class="border my-4 p-3" style="width: 90%;">
								<div class="d-flex w-100 p-1">
									<div class="col-4 text-center">
										<h5>
											<b>오늘 매출액</b>
										</h5>
									</div>
									<div class="col-4 text-center">
										<h5>
											<b>이번달 매출액</b>
										</h5>
									</div>
									<div class="col-4 text-center">
										<h5>
											<b>최고 매출액</b>
										</h5>
									</div>
								</div>
								<div class="d-flex w-100 p-1">
									<div class="col-4 text-center">
										<h5>1,500,000원</h5>
									</div>
									<div class="col-4 text-center">
										<h5>560,700,400원</h5>
									</div>
									<div class="col-4 text-center">
										<h5>5,030,000원</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="w-100">
						<div class="d-flex flex-column justify-content-start">
							<h5>
								<b>이번 달 베스트 셀러 TOP 5</b>
							</h5>
							<div class="border d-flex my-4" style="width: 90%;">
								<div class="card" style="width: 20%">
									<img class="card-img-top"
										src="${pageContext.request.contextPath}/resources/image/item/snack.png"
										alt="Card image" style="width: 100%;">
									<div class="card-body">
										<h6 class="card-title">
											<b>상품1</b>
										</h6>
										<p>판매량 : 300개</p>
									</div>
								</div>
								<div class="card" style="width: 20%">
									<img class="card-img-top"
										src="${pageContext.request.contextPath}/resources/image/item/snack.png"
										alt="Card image" style="width: 100%;">
									<div class="card-body">
										<h6 class="card-title">
											<b>상품2</b>
										</h6>
										<p>판매량 : 300개</p>
									</div>
								</div>
								<div class="card" style="width: 20%">
									<img class="card-img-top"
										src="${pageContext.request.contextPath}/resources/image/item/snack.png"
										alt="Card image" style="width: 100%;">
									<div class="card-body">
										<h6 class="card-title">
											<b>상품3</b>
										</h6>
										<p>판매량 : 300개</p>
									</div>
								</div>
								<div class="card" style="width: 20%">
									<img class="card-img-top"
										src="${pageContext.request.contextPath}/resources/image/item/snack.png"
										alt="Card image" style="width: 100%;">
									<div class="card-body">
										<h6 class="card-title">
											<b>상품4</b>
										</h6>
										<p>판매량 : 300개</p>
									</div>
								</div>
								<div class="card" style="width: 20%">
									<img class="card-img-top"
										src="${pageContext.request.contextPath}/resources/image/item/snack.png"
										alt="Card image" style="width: 100%;">
									<div class="card-body">
										<h6 class="card-title">
											<b>상품5</b>
										</h6>
										<p>판매량 : 300개</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div
					class="col-4 d-flex flex-column align-items-center justify-content-center">
					<h6>
						<b>공용 메모장</b>
					</h6>
					<textarea class="form-control mt-3"
						id="exampleFormControlTextarea1" rows="8"></textarea>
					<button class="btn text-white mt-1"
						style="background-color: #27374D;">저장</button>
					<div class="container-fluid h-50 d-flex flex-column align-items-center mt-5">
						<h6>
							<b>재고 부족 리스트</b>
						</h6>
						<div class="container-fluid h-100 border border-dark"
							style="overflow: auto;">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">상품번호</th>
										<th scope="col">분류명</th>
										<th scope="col">상품명</th>
										<th scope="col">재고수량</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">p101</th>
										<td>간식</td>
										<td>개껌</td>
										<td>20</td>
									</tr>
									<tr>
										<th scope="row">102</th>
										<td>사료</td>
										<td>유기농사료</td>
										<td>10</td>
									</tr>
									<tr>
										<th scope="row">303</th>
										<td>사료</td>
										<td>유기농사료</td>
										<td>5</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>