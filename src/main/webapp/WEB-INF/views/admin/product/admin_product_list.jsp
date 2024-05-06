<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
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
						<b>상품 조회</b>
					</h5>
					<hr class="w-100" />
					<div class="d-flex flex-column">
						<form method="get" action=""
							class="d-flex justify-content-between align-items-center">
							<div class="d-flex">
								<div class="form-group d-flex align-items-center" style="width: 250px">
									<label for="ctg" style="width: 100px">카테고리</label> 
									<select class="form-control"
										id="ctg" name="ctgno">
										<option value="0" selected>전체</option>
										<option value="1">사료</option>
										<option value="2">간식</option>
										<option value="3">영양제</option>
									</select>
								</div>
							</div>
							<div class="d-flex">
								<input type="text" class="form-control ms-4"
									placeholder="검색어 입력" name="검색" style="width: 300px;">
								<div
									class="btn ms-1 d-flex justify-content-center align-items-center">
									<img
										src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png"
										width="20px">
								</div>
							</div>
						</form>
						<div class="mt-4">
							<table class="table table-hover text-center">
								<thead class="table-dark">
									<tr>
										<th>분류명</th>
										<th>상품번호</th>
										<th>상품명</th>
										<th>상품가격</th>
										<th>상품등록일</th>
										<th>상품재고</th>
									</tr>
								</thead>
								<tbody style="vertical-align: middle;">
									<tr>	
										<td onclick="openProductDetail()">간식</td>
										<td onclick="openProductDetail()">1</td>
										<td onclick="openProductDetail()">개껌</td>
										<td onclick="openProductDetail()">20000원</td>
										<td onclick="openProductDetail()">2024. 04. 29.</td>
										<td>
											<form action=""  class="d-flex justify-content-center">
												<input type="number" value="30" style="width:50px">
												<a href="" class="btn btn-sm">재고 수정</a>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="d-flex justify-content-center mt-5">
								<ul class="pagination">
									<li class="page-item"><a class="page-link text-dark"
										href="#">이전</a></li>
									<li class="page-item"><a class="page-link text-dark"
										href="#">1</a></li>
									<li class="page-item"><a class="page-link text-dark"
										href="#">2</a></li>
									<li class="page-item"><a class="page-link text-dark"
										href="#">3</a></li>
									<li class="page-item"><a class="page-link text-dark"
										href="#">다음</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>