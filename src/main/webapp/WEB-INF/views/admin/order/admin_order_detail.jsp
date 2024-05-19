<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<h4 class="my-0 ms-5 ps-5 text-white">주문 관리</h4>
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
					<div class="w-100 d-flex justify-content-between">
						<h5>
							<b>주문 상세 정보</b>
						</h5>
						<button class="btn" onclick="updateOrderStts()" ${orderInfoMap.order.ordstts < 3?'':'style="display:none"'}>변경사항 저장</button>
					</div>
					<hr class="w-100" />
					<div class="d-flex flex-row">
						<div class="d-flex flex-column col-4">
							<form class="d-flex flex-column w-100 justify-content-center"
								id="orderdetail">
								<div class="my-3">
									<label for="orderno" class="form-label">주문번호</label> <input
										type="text" class="form-control" id="orderno" name="ordno"
										readonly value="${orderInfoMap.order.ordno}">
								</div>
								<div class="mb-3">
									<label for="ord_date" class="form-label">주문 일자</label> <input
										type="text" class="form-control" id="ord_date" name="orddate"
										value='<fmt:formatDate value="${orderInfoMap.order.orddate}" pattern="yyyy-MM-dd"/>'>
								</div>
								<div class="w-100 d-flex flex-column mb-3">
									<label for="status" class="form-label">주문 상태</label>
									<div class="w-100 d-flex">
										<c:if test="${orderInfoMap.order.ordstts < 3}">
											<div class="w-75 form-group align-items-center">
												<select class="form-control" id="status" name="ordstts">
													<c:forEach var="ordStts"
														items="${orderInfoMap.ordSttsList}">
														<option value="${ordStts.ordsttsno}"
															${ordStts.ordsttsno < orderInfoMap.order.ordstts?'hidden':''}
															${ordStts.ordsttsno == orderInfoMap.order.ordstts?'selected':''}>${ordStts.ordsttschar}</option>
													</c:forEach>
												</select>
											</div>
											<div class="w-25">
												<button type="button" class="btn" data-bs-toggle="modal"
													data-bs-target="#myModal">운송장 입력</button>
												<%@ include
													file="/WEB-INF/views/admin/modal/modal_select_del_com.jsp"%>
											</div>
										</c:if>
										<c:if test="${orderInfoMap.order.ordstts > 2}">
											<c:if test="${orderInfoMap.order.ordstts < 5}">
												<div class="w-100 form-group align-items-center">
													<input type="text" class="form-control"
														value="${orderInfoMap.order.ordsttschar}  (${orderInfoMap.delivery.comname} : ${orderInfoMap.delivery.trckno})" readonly>
												</div>
											</c:if>
											<c:if test="${orderInfoMap.order.ordstts == 5}">
												<div class="w-100 form-group align-items-center">
													<input type="text" class="form-control"
														value="${orderInfoMap.order.ordsttschar}" readonly>
												</div>
											</c:if>
										</c:if>
									</div>
								</div>
								<div class="w-100 border d-flex flex-column align-items-center"
									style="height: 200px; overflow: auto;">
									<table class="table text-center">
										<thead>
											<tr>
												<th scope="col">상품번호</th>
												<th scope="col">상품명</th>
												<th scope="col">상품갯수</th>
												<th scope="col">소계</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="ordProd" items="${orderInfoMap.ordProdList}">
												<tr>
													<td>${ordProd.prodno}</td>
													<td>${ordProd.prodname}</td>
													<td>${ordProd.qty}개</td>
													<td><fmt:formatNumber value="${ordProd.subtot}" pattern="#,###" />원</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="w-100 d-flex flex-column">
									<table class="table text-center">
										<thead>
											<tr>
												<th scope="col">주문금액</th>
												<th scope="col">할인금액</th>
												<th scope="col">결제금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><fmt:formatNumber value="${orderInfoMap.order.ordprice}" pattern="#,###" />원</td>
												<td><fmt:formatNumber value="${orderInfoMap.order.discprice}" pattern="#,###" />원</td>
												<td><fmt:formatNumber value="${orderInfoMap.order.finprice}" pattern="#,###" />원</td>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
						</div>
						<div class="col-8">
							<!-- 주문내역 사용내역 -->
							<div class="container-fluid py-3">
								<div
									class="container-fluid d-flex flex-column justify-content-center align-items-center"
									style="overflow: auto;">
									<h4>주문자 정보</h4>
									<table class="table border table-hover">
										<tbody>
											<tr>
												<th scope="row">주문자 명</th>
												<td>${orderInfoMap.orderer.ordname}</td>
											</tr>
											<tr>
												<th scope="row">주문자 연락처</th>
												<td>${orderInfoMap.orderer.ordtel}</td>
											</tr>
											<tr>
												<th scope="row">주문자 이메일</th>
												<td>${orderInfoMap.orderer.ordemail}</td>
											</tr>
											<tr>
												<th scope="row">주문자 우편번호</th>
												<td>${orderInfoMap.orderer.ordpostno}</td>
											</tr>
											<tr>
												<th scope="row">주문자 주소</th>
												<td>${orderInfoMap.orderer.ordadr}</td>
											</tr>
											<tr>
												<th scope="row">주문자 상세주소</th>
												<td>${orderInfoMap.orderer.ordadrdtl}</td>
											</tr>
										</tbody>
									</table>
									<h4>수령인 정보</h4>
									<table class="table border table-hover">
										<tbody>
											<tr>
												<th scope="row">수령인 명</th>
												<td>${orderInfoMap.rcpt.rcptname}</td>
											</tr>
											<tr>
												<th scope="row">수령인 연락처</th>
												<td>${orderInfoMap.rcpt.rcpttel}</td>
											</tr>
											<tr>
												<th scope="row">수령인 이메일</th>
												<td>${orderInfoMap.rcpt.rcptemail}</td>
											</tr>
											<tr>
												<th scope="row">수령인 우편번호</th>
												<td>${orderInfoMap.rcpt.rcptpostno}</td>
											</tr>
											<tr>
												<th scope="row">수령인 주소</th>
												<td>${orderInfoMap.rcpt.rcptadr}</td>
											</tr>
											<tr>
												<th scope="row">수령인 상세주소</th>
												<td>${orderInfoMap.rcpt.rcptadrdtl}</td>
											</tr>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>