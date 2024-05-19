<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>멍슐랭</title>
</head>
<body>
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>
	<!-- 홈 배너 캐로슬-->
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<div id="carouselControls" class="carousel" data-bs-ride="carousel">
			<div class="carousel-inner ">
				<div class="carousel-item">
					<a href="#"><img src="https://i.ibb.co/7z5htNw/banner1.jpg"
						class="d-block w-100"></a>
				</div>
				<div class="carousel-item">
					<a href="#"><img src="https://i.ibb.co/PhNPTFd/banner2.png"
						class="d-block w-100"></a>
				</div>
				<div class="carousel-item  active">
					<a href="#"><img src="https://i.ibb.co/ZLJdNSF/banner3.jpg"
						class="d-block w-100"></a>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<div style="height: 200px"></div>

	<!-- 추천상품 -->
	<div id="recommend" 
		class="container-fluid w-100 d-flex flex-column align-items-center justify-content-center"
		style="background-color: #F6EEFA; min-width: 1250px;">
		<div style="height: 30px"></div>
		<p class="fw-bold fs-3">추천상품</p>
		<div class="bg-black" style="height: 2px; width: 30px"></div>
		<div id="rcmd-product-list"
			class="p-3 mt-4 w-75 d-flex justify-content-center">
			<c:forEach var="prod" items="${prodList}">
				<div id="rcmd-product-1" class="w-25 p-3">
					<a
						href="${pageContext.request.contextPath}/item/item_detail?prodno=${prod.prodno}"
						class="d-flex flex-column align-items-center"> <img
						src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${prod.prodno}"
						class="w-75 img-thumbnail hover-shadow" />
					</a>
					<div class="p-2">
						<a
							href="${pageContext.request.contextPath}/item/item_detail?prodno=${prod.prodno}"
							class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
							<p class="text-center">${prod.prodname}</p>
						</a>
						<hr />
						<p style="font-size: 0.75rem;">평점: ${prod.avgrating}</p>
						<p style="font-size: 0.75rem;">
							<c:if test="${prod.avgrating >= 1 && prod.avgrating < 2}">⭐</c:if>
							<c:if test="${prod.avgrating >= 2 && prod.avgrating < 3}">⭐⭐</c:if>
							<c:if test="${prod.avgrating >= 3 && prod.avgrating < 4}">⭐⭐⭐</c:if>
							<c:if test="${prod.avgrating >= 4 && prod.avgrating < 5}">⭐⭐⭐⭐</c:if>
							<c:if test="${prod.avgrating == 5}">⭐⭐⭐⭐⭐</c:if>
							(${prod.rvcount})
						</p>
						<p>
							<fmt:formatNumber value="${prod.prodprice}" pattern="#,###" />
							원
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="height: 20px"></div>
	</div>

	<!--무언갈 보여드리겠습니다!-->
	<div style="height: 150px"></div>

	<div class="container-fluid d-flex flex-column align-items-center" style="min-width: 1250px">
		<p class="fw-bold fs-3">멍슐랭은 다릅니다!</p>
		<div class="bg-black" style="height: 2px; width: 30px"></div>
		<div class="mt-4 w-75 d-flex justify-content-center">
			<div class="card me-4">
				<img src="https://i.ibb.co/bFxSwMq/smallbanner1.png">
			</div>

			<div class="card ms-4">
				<img src="https://i.ibb.co/NjzRQ8k/smallbanner2.png">
			</div>
		</div>
	</div>

	<div style="height: 150px"></div>

	<!-- 실시간 리뷰 -->


	<div id="recommend" 
		class="container-fluid d-flex flex-column align-items-center justify-content-center"
		style="background-color: #F6EEFA; min-width: 1250px;">
		<div style="height: 30px"></div>
		<p class="fw-bold fs-3">실시간 리뷰</p>
		<p class="fs-5">고객님의 생생한 리뷰를 확인해보세요.</p>
		<div class="bg-black" style="height: 2px; width: 30px"></div>
		<div id="rcmd-product-list"
			class="p-3 mt-4 w-75 d-flex justify-content-center">

			<!-- 반복절 -->
			<c:forEach var="rv" items="${review}">
				<div id="rcmd-product-1" class="w-25 p-3">
					<a
						href="${pageContext.request.contextPath}/item/item_detail?prodno=${rv.prodno}"
						class="d-flex flex-column align-items-center"> <img
						src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${rv.prodno}"
						class="w-75 img-thumbnail" />
					</a>
					<div class="p-2 d-flex flex-column align-items-center">
						<a
							href="${pageContext.request.contextPath}/item/item_detail?prodno=${rv.prodno}"
							class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
							${rv.rvtitle}</a>
						<hr />
						<p>${rv.rvcontent}</p>
						<c:if test="${rv.rvrating == 1}">⭐</c:if>
						<c:if test="${rv.rvrating == 2}">⭐⭐</c:if>
						<c:if test="${rv.rvrating == 3}">⭐⭐⭐</c:if>
						<c:if test="${rv.rvrating == 4}">⭐⭐⭐⭐</c:if>
						<c:if test="${rv.rvrating == 5}">⭐⭐⭐⭐⭐</c:if>

					</div>
				</div>
			</c:forEach>
			<!-- 반복절 -->


		</div>
	</div>
	<div style="height: 20px"></div>



	<div style="height: 75px"></div>

	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>
</body>
</html>