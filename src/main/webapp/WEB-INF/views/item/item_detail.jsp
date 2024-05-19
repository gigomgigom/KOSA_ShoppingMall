<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
}

.active {
	background-color: #9523DC;
}
</style>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- 사용자 정의 자바스크립트 -->
<script>
		function handleBtnShow(index) {
			let prodno = $("#prodno").val();
			let product = {prodno};
			
			switch(index) {
				case 1: 
					$.ajax({
						url: "item_info",
						method: "get",
						data : product,
						success: function(data) {
							$(".active").attr("class", "nav-item");
							$("#nav-1").attr("class", "nav-item active text-white");
							$("#item_container").html(data);
						}
					});
					break;
				
				case 2:
					
					$.ajax({
						url: "item_review",
						method: "get",
						data : product,
						success: function(data) {
							$(".active").attr("class", "nav-item");
							$("#nav-2").attr("class", "nav-item active text-white");
							$("#item_container").html(data);
						}
					});
					break;
				
				case 3:
					$.ajax({
						url: "item_qa",
						method: "get",
						success: function(data) {
							$(".active").attr("class", "nav-item");
							$("#nav-3").attr("class", "nav-item active text-white");
							$("#item_container").html(data);
						}
					});
					break;
				
				case 4:
					$.ajax({
						url: "item_delievery",
						method: "get",
						success: function(data) {
							$(".active").attr("class", "nav-item");
							$("#nav-4").attr("class", "nav-item active text-white");
							$("#item_container").html(data);
						}
					});
					break;
			}
		}
		
		function submitCart(isLogin) {
			const modal = new bootstrap.Modal(document.getElementById('myModal'));
			let prodno = $("#prodno").val(); 
			let qty = $("#qty").val(); 
			console.log(isLogin);
			let productInfo = {prodno, qty}; 
			
			if(isLogin){
				$.ajax({
					url: "/javajavajo_mini_web/cart/cartAdd",
					method: "post",
					data: productInfo,
					success: function(data) {
						if(data["result"]  == "success"){
							modal.show()
						}
					}
				}) 
			}else{
				location.href= "/javajavajo_mini_web/cart/cartAdd?prodno=" + prodno;
			}
		}
		
		
		
		</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>꼭꼭 씹어먹어요 개껌</title>
</head>
<body>
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>

	<div class="container-fluid my-2" style="min-width: 1250px">
		<!--data전달을 위한 form-->
		<c:if test="${!isLogin}">
			<form method="get"
				action="${pageContext.request.contextPath}/cart/cartAdd">
		</c:if>
		
		<c:if test="${isLogin}">
			<form method="post"
				action="${pageContext.request.contextPath}/order/direct">
		</c:if>
			<div id="wrapper" class="d-flex flex-column">
				<div class="container d-flex justify-content-center">
					<div class="w-75 d-flex justify-content-center">
						<div class="w-50 p-3">
							<div class="card w-75">
								<img
									src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${product.prodno}"
									alt="">
							</div>
						</div>
						<div class="w-50 p-3 d-flex flex-column">
							<div class="d-flex flex-column py-5">
								<!--상품정보(상품명, 구매후기, 가격, 배송비)-->
								<div class="d-flex flex-column border-bottom">
									<h5 class="fw-bold">${product.prodname}</h5>
									<span>구매후기 ${product.rvcount}건 | <c:if
											test="${product.avgrating >= 1 && product.avgrating < 2}">⭐</c:if>
										<c:if
											test="${product.avgrating >= 2 && product.avgrating < 3}">⭐⭐</c:if>
										<c:if
											test="${product.avgrating >= 3 && product.avgrating < 4}">⭐⭐⭐</c:if>
										<c:if
											test="${product.avgrating >= 4 && product.avgrating < 5}">⭐⭐⭐⭐</c:if>
										<c:if test="${product.avgrating == 5}">⭐⭐⭐⭐⭐</c:if>
									</span> <span class="mt-4 fw-bold">소비자가 ${product.prodprice}원</span> <span
										class="mt-2" style="font-size: 0.75rem;">배송비 3,000원
										(주문시 결제) - CJ 대한통운</span> <span class="mb-3"
										style="font-size: 0.75em;">제주 추가 3,000원, 제주 외 도서지역 추가
										7,000원</span>
								</div>
								<!--  -->

								<div class="mt-4 px-5 d-flex justify-content-between">
									<span class="fw-bold">수량</span> <input id="qty" type="number"
										value="1" min="1" name="qty" style="text-align: center;">
								</div>

								<div class="mt-3 d-flex justify-content-between">

									<input id="prodno" type="hidden" value="${product.prodno}"
										name="prodno">
									<button onclick="submitCart(${isLogin})" type="button" id="add-cart"
										class="btn btn-lg border fw-bold"
										style="background-color: #F6EEFA;">장바구니에 추가</button>
									<button type="submit" id="direct-purchase"
										class="btn btn-lg text-white fw-bold w-50"
										style="background-color: #9523DC;">바로구매</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--nav-->
		<div class="border-top container" style="background-color: #F6EEFA;">
			<nav class="navbar justify-content-center">
				<ul class="nav justify-content-center me-5">
					<li class="nav-item active" id="nav-1"><a
						class="btn fw-bold text-black" onclick="handleBtnShow(1)">상품정보</a>
					</li>
					<li class="nav-item" id="nav-2"><a
						class="btn fw-bold text-black" onclick="handleBtnShow(2)">구매후기</a>
					</li>
					<li class="nav-item" id="nav-3"><a
						class="btn fw-bold text-black" onclick="handleBtnShow(3)">상품문의</a>
					</li>
					<li class="nav-item" id="nav-4"><a
						class="btn fw-bold text-black" onclick="handleBtnShow(4)">배송정보</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="mt-5"></div>
		<!-- 내용물 바꾸기 -->
		<div class="mt-5 container" id="item_container">
			<%@ include file="/WEB-INF/views/item/item_info.jsp"%>
		</div>
	</div>
	<div style="height: 100px">
	
	</div>

	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>

	<!-- modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal body -->
				<div class="modal-body">장바구니에 선택하신 상품을 담았습니다!</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a type="button" class="btn"
						href="${pageContext.request.contextPath}/cart/" style="color: white; background-color: #9523DC">장바구니로 가기
						</a>
					<a type="button" class="btn"
						href="${pageContext.request.contextPath}/item/item_list?ctgno=${product.ctgno}&pageNo=1&sorting=lowPrice&keyword=" style="background-color: #F6EEFA">쇼핑 계속하기</a>
				</div>

			</div>
		</div>
	</div>
</body>
</html>