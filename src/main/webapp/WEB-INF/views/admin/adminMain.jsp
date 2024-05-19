<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
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
					<a href="${pageContext.request.contextPath}/" class="btn me-5 text-white fw-bold"
						style="background-color: #526D82;">쇼핑몰 페이지 이동</a>
					<a class="btn me-5 text-white fw-bold"
						style="background-color: #526D82;" href="${pageContext.request.contextPath}/logout">로그아웃</a>
					<span class="text-white me-5 fw-bold">환영합니다. <sec:authentication property="principal.username"/>님</span>
				</div>
			</div>
			<div class="d-flex" style="width: 90%; height: 91vh;">
				<div
					class="container col-8 h-100 d-flex flex-column align-items-center justify-content-center">
					<!--주문 현황-->
					<div class="w-100 my-1">
						<div class="d-flex flex-column justify-content-start">
							<h5>
								<b>이번 주 주문 현황</b>
							</h5>
							<div class="border my-4 p-3" style="width: 90%;">
								<div class="d-flex w-100 p-1">
									<div class="col-4 text-center">
										<h5>
											<b>접수된 주문</b>
										</h5>
									</div>
									<div class="col-4 text-center">
										<h5>
											<b>미배송 처리</b>
										</h5>
									</div>
									<div class="col-4 text-center">
										<h5>
											<b>배송 처리</b>
										</h5>
									</div>
								</div>
								<div class="d-flex w-100 p-1">
									<div class="col-4 text-center">
										<h5>${thisWeekOrdInfo.weeklyTotOrd}건</h5>
									</div>
									<div class="col-4 text-center">
										<h5>${thisWeekOrdInfo.weeklyNoneDelivery}건</h5>
									</div>
									<div class="col-4 text-center">
										<h5>${thisWeekOrdInfo.weeklyRdyDelivery}건</h5>
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
											<b>이번달 최고 매출액</b>
										</h5>
									</div>
								</div>
								<div class="d-flex w-100 p-1">
									<div class="col-4 text-center">
										<h5><fmt:formatNumber value="${salesInfo.todaySales}" pattern="#,###" />원</h5>
									</div>
									<div class="col-4 text-center">
										<h5><fmt:formatNumber value="${salesInfo.monthSales}" pattern="#,###" />원</h5>
									</div>
									<div class="col-4 text-center">
										<h5><fmt:formatNumber value="${salesInfo.maxDaySales}" pattern="#,###" />원</h5>
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
								<c:forEach var="product" items="${bestProducts}">
									<div class="card" style="width: 20%">
										<img class="card-img-top"
											src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${product.prodno}"
											alt="Card image" style="width: 100%;">
										<div class="card-body">
											<h6 class="card-title">
												<b>${product.prodname}</b>
											</h6>
											<p>판매량 : ${product.soldcnt}개</p>
										</div>
									</div>
								</c:forEach>
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
					<div
						class="container-fluid h-50 d-flex flex-column align-items-center mt-5">
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
									<c:forEach var="product" items="${lackproducts}">
										<tr>
											<th scope="row">${product.prodno}</th>
											<td>${product.ctgno==1?'사료':product.ctgno==2?'간식':'영양제'}</td>
											<td>${product.prodname}</td>
											<td>${product.prodstock}</td>
										</tr>
									</c:forEach>
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