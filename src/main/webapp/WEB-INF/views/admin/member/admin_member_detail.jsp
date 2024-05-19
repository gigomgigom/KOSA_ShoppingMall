<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
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
					<a href="${pageContext.request.contextPath}/" class="btn me-5 text-white fw-bold"
						style="background-color: #526D82;">쇼핑몰 페이지 이동</a>
					<a class="btn me-5 text-white fw-bold"
						style="background-color: #526D82;" href="${pageContext.request.contextPath}/logout">로그아웃</a>
					<span class="text-white me-5 fw-bold">환영합니다. <sec:authentication property="principal.username"/>님</span>
				</div>
			</div>
			<div class="d-flex" style="width: 90%; height: 91vh;">
				<div class="mt-5 w-100 d-flex flex-column">
					<h5>
						<b>${member.memname}님의 정보</b>
					</h5>
					<hr class="w-100" />
					<div class="d-flex flex-row">
						<!-- 회원정보 출력(수정 input폼) -->
						<div class="d-flex flex-column col-4">
							<form class="d-flex flex-column w-100 justify-content-center"
								action="update_member" method="post">
								<div class="my-3">
									<label for="mno" class="form-label">회원번호</label> <input
										type="number" class="form-control" id="mno" name="memno"
										readonly value="${member.memno}">
								</div>
								<div class="mb-3">
									<label for="mid" class="form-label">회원 아이디</label> <input
										type="text" class="form-control" id="mid" name="memid"
										value="${member.memid}" readonly>
								</div>
								<div class="mb-3">
									<label for="memail" class="form-label">회원 E-mail</label> <input
										type="text" class="form-control" id="memail" name="mememail"
										value="${member.mememail}">
								</div>
								<div class="mb-3">
									<label for="mtel" class="form-label">회원 휴대폰번호</label> <input
										type="text" class="form-control" id="mtel" name="memtel"
										value="${member.memtel}">
								</div>
								<div class="mb-3">
									<label for="mdate" class="form-label">회원 가입일자</label> <input
										type="text" class="form-control" id="mdate" name="memdate"
										value='<fmt:formatDate value="${member.memdate}" pattern="yyyy-MM-dd" />'
										readonly>
								</div>
								<div class="w-100 d-flex flex-column align-items-center">
									<button type="submit" class="btn w-50 border mt-2">수정</button>

									<button class="btn w-50 border mt-2" type="button"
										data-bs-toggle="modal" data-bs-target="#resetpw">비밀번호
										초기화</button>

									<button class="btn w-50 border mt-2" type="button"
										data-bs-toggle="modal" data-bs-target="#pointModal">마일리지
										수정</button>
								</div>
							</form>
						</div>
						<div class="col-8">
							<!-- 주문내역 사용내역 -->
							<div class="container-fluid py-3">
								<div class="container-fluid border border-dark"
									style="overflow: auto; height: 284px">
									<table class="table table-hover">
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
											<c:forEach var="order" items="${orderList}">
												<tr
													onclick="location.href='${pageContext.request.contextPath}/admin/order_detail?ordno=${order.ordno}'">
													<th scope="row">${order.ordno}</th>
													<td>${order.ordstts}</td>
													<c:if test="${order.ordproductcnt != 0}">
														<td>${order.oneproduct.prodname}외
															${order.ordproductcnt}개</td>
													</c:if>
													<c:if test="${order.ordproductcnt == 0}">
														<td>개껌</td>
													</c:if>
													<td><fmt:formatNumber value="${order.finprice}" pattern="#,###" />원</td>
													<td><fmt:formatDate value="${order.orddate}"
															pattern="yyyy-MM-dd" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 포인트 사용내역 -->
							<div class="container-fluid py-3">
								<div class="border border-dark" style="overflow: auto; height: 284px">
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
											<c:forEach var="pointDtl" items="${pointDtlList}">
												<tr>
													<th scope="row">${pointDtl.ordno}</th>
													<c:if test="${pointDtl.action == 1}">
														<td>사용</td>
													</c:if>
													<c:if test="${pointDtl.action == 0}">
														<td>적립</td>
													</c:if>
													<td><fmt:formatNumber value="${pointDtl.amount}" pattern="#,###" />포인트</td>
													<td><fmt:formatDate value="${pointDtl.date}"
															pattern="yyyy-MM-dd" /></td>
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
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/modal/modal_reset_password.jsp"%>
	<%@ include file="/WEB-INF/views/admin/modal/modal_edit_point.jsp"%>
</body>
</html>