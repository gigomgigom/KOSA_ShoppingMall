<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

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
						<form method="get" action="product_list"
							class="d-flex justify-content-between align-items-center">
							<div class="d-flex">
								<div class="form-group d-flex align-items-center"
									style="width: 250px">
									<label for="ctg" style="width: 100px">카테고리</label> <select
										class="form-control" id="ctg" name="ctgindex">
										<option value="-1" ${searchIndex.ctgindex == 0?'selected':''}>전체</option>
										<c:forEach var="ctg" items="${ctgList}">
											<option value="${ctg.ctgno}" ${searchIndex.ctgindex == ctg.ctgno?'selected':''}>${ctg.ctgnm}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="d-flex">
								<input type="text" class="form-control ms-4"
									placeholder="상품명 입력" name="searchkeyword" style="width: 300px;" value="${searchIndex.searchkeyword}">
								<button type="submit"
									class="btn ms-1 d-flex justify-content-center align-items-center">
									<img
										src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png"
										width="20px">
								</button>
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
									<c:forEach var="product" items="${productList}">
										<tr>
											<td onclick="openProductDetail(${product.prodno})">${product.ctgno==1?'사료':product.ctgno==2?'간식':'영양제'}</td>
											<td onclick="openProductDetail(${product.prodno})">${product.prodno}</td>
											<td onclick="openProductDetail(${product.prodno})">${product.prodname}</td>
											<td onclick="openProductDetail(${product.prodno})">${product.prodprice}원</td>
											<td onclick="openProductDetail(${product.prodno})"><fmt:formatDate value="${product.proddate}" pattern="yyyy-MM-dd"/></td>
											<td>
												<form action="updateProdStock" class="d-flex justify-content-center" method="post">
													<input type="number" style="width: 50px" value="${product.prodstock}" name="prodstock">
													<input type="hidden" value="${product.prodno}" name="prodno">
													<button type="submit" class="btn btn-primary btn-sm">재고 수정</button>
												</form>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="d-flex justify-content-center mt-5">
								<div>
									<a class="btn btn-outline-primary btn-sm"
										href="product_list?pageNo=1">처음</a>
									<c:if test="${pager.groupNo>1}">
										<a class="btn btn-outline-info btn-sm"
											href="product_list?pageNo=${pager.startPageNo-1}">이전</a>
									</c:if>

									<c:forEach var="i" begin="${pager.startPageNo}"
										end="${pager.endPageNo}">
										<c:if test="${pager.pageNo != i}">
											<a class="btn btn-outline-success btn-sm"
												href="product_list?pageNo=${i}">${i}</a>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<a class="btn btn-danger btn-sm"
												href="product_list?pageNo=${i}">${i}</a>
										</c:if>
									</c:forEach>

									<c:if test="${pager.groupNo<pager.totalGroupNo}">
										<a class="btn btn-outline-info btn-sm"
											href="product_list?pageNo=${pager.endPageNo+1}">다음</a>
									</c:if>
									<a class="btn btn-outline-primary btn-sm"
										href="product_list?pageNo=${pager.totalPageNo}">맨끝</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
	src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</body>
</html>