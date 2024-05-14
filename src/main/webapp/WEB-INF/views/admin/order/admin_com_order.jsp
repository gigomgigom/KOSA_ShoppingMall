<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<b>완료된 주문</b>
					</h5>
					<hr class="w-100" />
					<div class="d-flex flex-column">
						<form method="get" action="" class="d-flex flex-column">
							<div class="d-flex justify-content-end align-items-center">
								<div>
									<label for="start">시작일자</label> <input class="me-4" id="start"
										type="date"> <label for="end">종료일자</label> <input
										type="date" id="end" placeholder="EndDate">
								</div>
							</div>
							<div class="d-flex justify-content-between align-items-end mt-2">
								<div>
									<span>검색 결과 ${totRows}건</span>
								</div>
								<div class="d-flex">
									<div class="d-flex">
										<div class="form-group d-flex align-items-center"
											style="width: 100px">
											<select class="form-control" name="searchindex">
												<option value="0" selected>주문번호</option>
												<option value="1">주문자</option>
											</select>
										</div>
									</div>
									<div class="d-flex">
										<input type="text" class="form-control ms-1"
											placeholder="검색어 입력" name="검색" style="width: 300px;">
										<div
											class="btn ms-1 d-flex justify-content-center align-items-center">
											<img
												src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png"
												width="20px">
										</div>
									</div>
								</div>
							</div>
						</form>
						<div>
							<table class="table table-hover text-center">
								<thead class="table-dark">
									<tr>
										<th>주문일자</th>
										<th>주문번호</th>
										<th>주문상태</th>
										<th>주문자</th>
										<th>주문 상품수</th>
										<th>주문자전화</th>
										<th>수령자</th>
										<th>금액</th>
									</tr>
								</thead>
								<tbody style="vertical-align: middle;">
									<c:forEach var="order" items="${ordList}">
										<tr onclick="location.href='${pageContext.request.contextPath}/admin/order_detail?ordno=${order.ordno}'">
											<td><>${order.orddate}</td>
											<td>${order.ordno}</td>
											<td>${order.ordsttschar}</td>
											<td>${order.orderer.ordname}</td>
											<td>${order.ordproductcnt}건</td>
											<td>${order.orderer.ordtel}</td>
											<td>${order.recipient.rcptname}</td>
											<td>${order.finprice}원</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="d-flex justify-content-center">
								<a class="btn btn-outline-primary btn-sm"
									href="uncom_order?pageNo=1">처음</a>
								<c:if test="${pager.groupNo>1}">
									<a class="btn btn-outline-info btn-sm"
										href="uncom_order?pageNo=${pager.startPageNo-1}">이전</a>
								</c:if>

								<c:forEach var="i" begin="${pager.startPageNo}"
									end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-outline-success btn-sm"
											href="uncom_order?pageNo=${i}">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-danger btn-sm"
											href="uncom_order?pageNo=${i}">${i}</a>
									</c:if>
								</c:forEach>

								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-outline-info btn-sm"
										href="uncom_order?pageNo=${pager.endPageNo+1}">다음</a>
								</c:if>
								<a class="btn btn-outline-primary btn-sm"
									href="uncom_order?pageNo=${pager.totalPageNo}">맨끝</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>