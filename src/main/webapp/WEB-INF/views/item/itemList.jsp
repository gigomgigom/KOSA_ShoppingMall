<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
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
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
	
</script>
<style>
* {
	margin: 0;
	padding: 0;
}
</style>
<meta charset="UTF-8">
<title>ItemList</title>
</head>
<body>
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>

	<div class="container-fluid d-flex align-items-center flex-column mt-5"
		style="min-width: 1250px">
		<h1>
			<b>${ctgno == 1 ? '사료' : ctgno == 2? '간식' : '영양제'}</b>
		</h1>
		<div class="d-flex flex-column w-75 my-5">
			<div
				class="w-100 d-flex justify-content-between border border-dark rounded mb-5">
				<div class="d-flex">
					<form name="sortForm" action="" method="get">
						<input name="ctgno" type="hidden" value="${ctgno}"> <input
							name="pageNo" type="hidden" value="1"> <select
							class="form-select form-select-sm w-100 h-100" name="sorting"
							onchange="this.form.submit()">
							<option value="bestItem"
								${sorting == "bestItem"? "selected" : ""}>인기 상품순</option>
							<option value="highItem"
								${sorting == "highItem"? "selected" : ""}>리뷰 평점순</option>
							<option value="lowPrice"
								${sorting == "lowPrice"? "selected" : ""}>낮은 가격순</option>
							<option value="highPrice"
								${sorting == "highPrice"? "selected" : ""}>높은 가격순</option>
							<option value="newItem" ${sorting == "newItem"? "selected" : ""}>신상품순</option>
						</select>
					</form>
				</div>
				<div class="d-flex">
					<form class="d-flex w-100 m-0 p-0" method="get" action="">
						<input name="ctgno" type="hidden" value="${ctgno}"> <input
							name="pageNo" type="hidden" value="1"> <input
							name="keyword"
							class="form-control form-control-sm text-center text-muted w-100 m-0 p-0 py-2"
							type="text" placeholder="상품검색"
							value="${keyword != '' and keyword != null ? keyword : null}">
					</form>
					<button class="btn" type="button" id="button-addon2">
						<img
							src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png"
							style="height: 30px;">
					</button>
				</div>
			</div>
			<div class="w-100 d-flex flex-wrap justify-content-between mb-5">
				<!--상품 목록 출력-->
				<!-- JSTL에서 ForEach태그를 사용해서 아래 상품 출력칸을 가져온 상품 수만큼 뿌려준다. -->
				<c:forEach var="item" items="${itemList}">
					<div class="card mb-4" style="width: 24%">
						<a
							href="${pageContext.request.contextPath}/item/item_detail?prodno=${item.prodno}">
							<img class="card-img-top"
							src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${item.prodno}"
							alt="Card image" style="width: 100%;">
						</a>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="${pageContext.request.contextPath}/item/item_detail?prodno=${item.prodno}"
									class="text-decoration-none text-black">${item.prodname}</a>
							</h4>
							<h5>
								<fmt:formatNumber value="${item.prodprice}" pattern="#,###" />
								원
							</h5>
							<c:if test="${item.avgrating > 0}">
								<p>
									상품 평점 : ${item.avgrating} 리뷰 :
									<c:if test="${item.avgrating >= 1 && item.avgrating < 2}">⭐</c:if>
									<c:if test="${item.avgrating >= 2 && item.avgrating < 3}">⭐⭐</c:if>
									<c:if test="${item.avgrating >= 3 && item.avgrating < 4}">⭐⭐⭐</c:if>
									<c:if test="${item.avgrating >= 4 && item.avgrating < 5}">⭐⭐⭐⭐</c:if>
									<c:if test="${item.avgrating == 5}">⭐⭐⭐⭐⭐</c:if>
									(${item.rvcount})
								</p>
							</c:if>
						</div>
					</div>
				</c:forEach>

				<!-- ---------------------------------------------------------------------------------------- -->
			</div>
			<div class="d-flex justify-content-center m-0 p-0">
				<tr>
					<td colspan="4" class="text-center">
						<div>
							<a class="btn btn-outline-light btn-sm text-dark"
								href="${pageContext.request.contextPath}/item/item_list?pageNo=1&ctgno=${ctgno}">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-light btn-sm text-dark"
									href="${pageContext.request.contextPath}/item/item_list?pageNo=${pager.startPageNo-1}&ctgno=${ctgno}">이전</a>
							</c:if>

							<c:forEach var="i" begin="${pager.startPageNo}"
								end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-light btn-sm text-dark"
										href="${pageContext.request.contextPath}/item/item_list?pageNo=${i}&ctgno=${ctgno}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn t btn-sm"
										style="background-color: #9523DC; color: white"
										href="${pageContext.request.contextPath}/item/item_list?pageNo=${i}&ctgno=${ctgno}">${i}</a>
								</c:if>
							</c:forEach>
							<!-- 그룹의 번호가 마지막 그룹의 번호보다 작을 경우에만 다음 버튼이 보이게 함 -->
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-light btn-sm text-dark"
									href="${pageContext.request.contextPath}/item/item_list?pageNo=${pager.endPageNo+1}&ctgno=${ctgno}">다음</a>
							</c:if>
							<a class="btn btn-outline-light btn-sm text-dark"
								href="${pageContext.request.contextPath}/item/item_list?pageNo=${pager.totalPageNo}&ctgno=${ctgno}">맨끝</a>
						</div>
					</td>
				</tr>
				</table>
			</div>
		</div>
	</div>

	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
</body>
</html>