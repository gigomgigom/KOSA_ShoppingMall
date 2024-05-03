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
				<h4 class="my-0 ms-5 ps-5 text-white">회원 조회</h4>
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
						<b>심영조님의 정보</b>
					</h5>
					<hr class="w-100" />
					<div class="d-flex flex-row">
						<!-- 회원정보 출력(수정 input폼) -->
						<div class="d-flex flex-column col-4">
							<form class="d-flex flex-column w-100 justify-content-center"
								action="#" method="post">
								<div class="my-3">
									<label for="mno" class="form-label">회원번호</label> <input
										type="text" class="form-control" id="mno" name="memno"
										readonly value="1">
								</div>
								<div class="mb-3">
									<label for="mid" class="form-label">회원 아이디</label> <input
										type="text" class="form-control" id="mid" name="memid"
										value="id1234">
								</div>
								<div class="mb-3">
									<label for="memail" class="form-label">회원 E-mail</label> <input
										type="text" class="form-control" id="memail" name="mememail"
										value="email@naver.com">
								</div>
								<div class="mb-3">
									<label for="mtel" class="form-label">회원 휴대폰번호</label> <input
										type="text" class="form-control" id="mtel" name="memtel"
										value="010-2810-4870">
								</div>
								<div class="mb-3">
									<label for="mdate" class="form-label">회원 가입일자</label> <input
										type="text" class="form-control" id="mdate" name="memdate"
										value="2024.04.29" readonly>
								</div>
								<div class="w-100 d-flex flex-column align-items-center">
									<button class="btn w-50 border my-4">수정</button>

									<button class="btn w-50 border mt-4" type="button">비밀번호
										초기화</button>
								</div>
							</form>
						</div>
						<div class="col-8">
							<div class="container-fluid h-50 py-3">
								<div class="container-fluid h-100 border border-dark"
									style="overflow: auto;">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">주문번호</th>
												<th scope="col">주문상태</th>
												<th scope="col">주문상품</th>
												<th scope="col">결제금액</th>
												<th scope="col">주문일자</th>
											</tr>
										</thead>
										<tbody>
											<tr onclick="location.href='${pageContext.request.contextPath}/order/member_detail'">
												<th scope="row">202405030001</th>
												<td>배송완료</td>
												<td>개껌 외 2개</td>
												<td>20000원</td>
												<td>2024.05.03</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="container-fluid d-flex h-50 py-3">
								<div class="col-8 h-100 border border-dark"
									style="overflow: auto;">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">주문번호</th>
												<th scope="col">사용/적립</th>
												<th scope="col">금액</th>
												<th scope="col">일자</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">202405030001</th>
												<td>사용</td>
												<td>3000포인트</td>
												<td>2024.05.03</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="col-4 h-100">
									
								</div>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>