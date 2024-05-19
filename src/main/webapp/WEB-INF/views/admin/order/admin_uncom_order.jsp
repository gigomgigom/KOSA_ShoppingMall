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
					<h5>
						<b>주문조회</b>
					</h5>
					<hr class="w-100" />
					<div class="d-flex flex-column">
						<form method="get" action="uncom_order" class="d-flex flex-column">
							<div class="d-flex justify-content-between align-items-center">
								<div class="d-flex">
									<div class="form-group d-flex align-items-center"
										style="width: 250px">
										<label for="ctg" style="width: 100px">카테고리</label> <select
											class="form-control" id="ctg" name="ctgindex">
											<option value="-1" ${searchIndex.ctgindex == 0?'selected':''}>전체</option>
											<c:forEach var="ordStts" items="${ordSttsList}">
												<option value="${ordStts.ordsttsno}"
													${searchIndex.ctgindex == ordStts.ordsttsno?'selected':''}>${ordStts.ordsttschar}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div>
									<label for="start">시작일자</label> <input class="me-4" id="start"
										name="startdate" type="date"> <label for="end">종료일자</label>
									<input name="enddate" type="date" id="end">
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
												<option value="1" selected>주문번호</option>
												<option value="2">주문자</option>
											</select>
										</div>
									</div>
									<div class="d-flex">
										<input type="text" class="form-control ms-1"
											placeholder="검색어 입력" name="searchkeyword"
											style="width: 300px;">
										<button type="submit"
											class="btn ms-1 d-flex justify-content-center align-items-center">
											<img
												src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png"
												width="20px">
										</button>
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
										<tr
											onclick="location.href='${pageContext.request.contextPath}/admin/order_detail?ordno=${order.ordno}'">
											<td><fmt:formatDate value="${order.orddate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${order.ordno}</td>
											<td>${order.ordsttschar}</td>
											<td>${order.orderer.ordname}</td>
											<td>${order.ordproductcnt}개</td>
											<td>${order.orderer.ordtel}</td>
											<td>${order.recipient.rcptname}</td>
											<td><fmt:formatNumber value="${order.finprice}" pattern="#,###" />원</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="d-flex justify-content-center">
								<a class="btn btn-sm"
									href="uncom_order?pageno=1">처음</a>
								<c:if test="${pager.groupNo>1}">
									<a class="btn btn-sm"
										href="uncom_order?pageno=${pager.startPageNo-1}">이전</a>
								</c:if>

								<c:forEach var="i" begin="${pager.startPageNo}"
									end="${pager.endPageNo}">
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-sm"
											href="uncom_order?pageno=${i}">${i}</a>
									</c:if>
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-sm"
											href="uncom_order?pageno=${i}"><b>${i}</b></a>
									</c:if>
								</c:forEach>

								<c:if test="${pager.groupNo<pager.totalGroupNo}">
									<a class="btn btn-sm"
										href="uncom_order?pageno=${pager.endPageNo+1}">다음</a>
								</c:if>
								<a class="btn btn-sm"
									href="uncom_order?pageno=${pager.totalPageNo}">맨끝</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>