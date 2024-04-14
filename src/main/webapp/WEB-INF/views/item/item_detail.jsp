<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
}

.active {
	background-color: #27374D;
}
</style>
<!-- 사용자 정의 자바스크립트 -->
<script>
		function handleBtnShow(index) {
			console.log("handleBtn1() 실행");
			switch(index) {
				case 1: 
					$.ajax({
						url: "item_info",
						method: "get",
						success: function(data) {
							$(".active").attr("class", "nav-item");
							$("#nav-1").attr("class", "nav-item active");
							$("#item_container").html(data);
						}
					});
					break;
				
				case 2:
					$.ajax({
						url: "item_review",
						method: "get",
						success: function(data) {
							$(".active").attr("class", "nav-item");
							$("#nav-2").attr("class", "nav-item active");
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
							$("#nav-3").attr("class", "nav-item active");
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
							$("#nav-4").attr("class", "nav-item active");
							$("#item_container").html(data);
						}
					});
					break;
			}
			
		}
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
<title>꼭꼭 씹어먹어요 개껌</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="container-fluid my-5">
		<!--data전달을 위한 form-->
		<form>
			<div id="wrapper" class="d-flex flex-column">
				<div class="container d-flex justify-content-center">
					<div class="w-75 d-flex justify-content-center">
						<div class="w-50 p-3">
							<div class="card w-75">
								<img src="https://i.ibb.co/f9yTBG2/doggum.png" alt="">
							</div>
						</div>
						<div class="w-50 p-3 d-flex flex-column">
							<div class="d-flex flex-column py-5">
								<!--상품정보(상품명, 구매후기, 가격, 배송비)-->
								<div class="d-flex flex-column border-bottom">
									<h5 class="fw-bold">꼭꼭 씹어먹어요 개껌</h5>
									<span>구매후기 n건 | ⭐⭐⭐⭐</span> <span class="mt-4 fw-bold">소비자가
										40,000원</span> <span class="mt-2" style="font-size: 0.75rem;">배송비
										3,000원 (주문시 결제) - CJ 대한통운</span> <span class="mb-3"
										style="font-size: 0.75em;">제주 추가 3,000원, 제주 외 도서지역 추가
										7,000원</span>
								</div>
								<!--  -->
								<div class="mt-4 px-5 d-flex justify-content-between">
									<span class="fw-bold">수량</span> <input type="number" value="0"
										style="text-align: center;">
								</div>

								<div class="mt-3 d-flex justify-content-between">
									<button type="button" class="btn btn-lg border fw-bold" onClick="location.href='${pageContext.request.contextPath}/shoppingcart'"
										style="background-color: #9DB2BF;">장바구니</button>
									<button class="btn btn-lg text-white fw-bold w-50"
										style="background-color: #27374D;">바로구매</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!--nav-->
		<div class="border-top container" style="background-color: #9DB2BF;">
			<nav class="navbar justify-content-center">
				<ul class="nav justify-content-center me-5">
					<li class="nav-item active" id="nav-1"><a
						class="btn fw-bold text-white" onclick="handleBtnShow(1)">상품정보</a>
					</li>
					<li class="nav-item" id="nav-2"><a
						class="btn fw-bold text-white" onclick="handleBtnShow(2)">구매후기</a>
					</li>
					<li class="nav-item" id="nav-3"><a
						class="btn fw-bold text-white" onclick="handleBtnShow(3)">상품문의</a>
					</li>
					<li class="nav-item" id="nav-4"><a
						class="btn fw-bold text-white" onclick="handleBtnShow(4)">배송정보</a>
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

	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>