<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<!-- 홈 배너 캐로슬-->
	<div>
		<div id="carouselControls" class="carousel" data-bs-ride="carousel">
			<div class="carousel-inner ">
				<div class="carousel-item">
					<a href="exam01_html_structure"><img
						src="https://i.ibb.co/7z5htNw/banner1.jpg" class="d-block w-100"></a>
				</div>
				<div class="carousel-item">
					<a href="exam02_element_attribute"><img
						src="https://i.ibb.co/PhNPTFd/banner2.png" class="d-block w-100"></a>
				</div>
				<div class="carousel-item  active">
					<a href="exam03_block_inline_element"><img
						src="https://i.ibb.co/ZLJdNSF/banner3.jpg" class="d-block w-100"></a>
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
		class="container-fluid d-flex flex-column align-items-center justify-content-center"
		style="background-color: rgb(236, 233, 233);">
		<div style="height: 30px"></div>
		<p class="fw-bold fs-3">추천상품</p>
		<div class="bg-black" style="height: 2px; width: 30px"></div>
		<div id="rcmd-product-list"
			class="p-3 mt-4 w-75 d-flex justify-content-center">
			<div id="rcmd-product-1" class="w-25 p-3">
				<a href="#" class="d-flex flex-column align-items-center"> <img
					src="https://i.ibb.co/Sc0bSjY/dogicecream.jpg"
					class="w-75 img-thumbnail hover-shadow" />
				</a>
				<div class="p-2">
					<a href="#"
						class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
						<p class="text-center">혀가 시려워 샤베트</p>
					</a>
					<hr />
					<p style="font-size: 0.75rem;">평점 5.0 - 리뷰 n개</p>
					<p style="font-size: 0.75rem;">⭐⭐⭐⭐</p>
					<p>n원</p>
				</div>
			</div>
			<div id="rcmd-product-2" class="w-25 p-3">
				<a href="${pageContext.request.contextPath}/item/item_detail" class="d-flex flex-column align-items-center"> <img
					src="https://i.ibb.co/f9yTBG2/doggum.png" class="w-75 img-thumbnail" />
				</a>
				<div class="p-2">
					<a href="${pageContext.request.contextPath}/item/item_detail"
						class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
						<p class="text-center">멍뭉이 쭈압쭈압 개껌</p>
					</a>
					<hr />
					<p style="font-size: 0.75rem;">평점 3.0 - 리뷰 n개</p>
					<p style="font-size: 0.75rem;">⭐⭐⭐</p>
					<p>n원</p>
				</div>
			</div>
			<div id="rcmd-product-3" class="w-25 p-3">
				<a href="#" class="d-flex flex-column align-items-center"> <img
					src="https://i.ibb.co/VNhrhcX/chickenbreast.jpg" class="w-75 img-thumbnail" />
				</a>

				<div class="p-2">
					<a href="#"
						class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
						<p class="text-center">득근득근 웅장한 닭가슴살</p>
					</a>
					<hr />
					<p style="font-size: 0.75rem;">평점 1.0 - 리뷰 n개</p>
					<p style="font-size: 0.75rem;">⭐</p>
					<p>n원</p>
				</div>
			</div>
			<div id="rcmd-product-4" class="w-25 p-3">
				<a href="#" class="d-flex flex-column align-items-center"> <img
					src="https://i.ibb.co/7zD4Gqb/dogfood.jpg" class="w-75 img-thumbnail" />
				</a>
				<div class="p-2">
					<a href="#"
						class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
						<p class="text-center">멍멍냠냠 영양만점 강아지사료</p>
					</a>
					<hr />
					<p style="font-size: 0.75rem;">평점 3.0 - 리뷰 n개</p>
					<p style="font-size: 0.75rem;">⭐⭐⭐</p>
					<p>n원</p>
				</div>
			</div>
		</div>
		<div style="height: 20px"></div>
	</div>

	<!--무언갈 보여드리겠습니다!-->
	<div style="height: 150px"></div>

	<div class="container-fluid d-flex flex-column align-items-center">
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
		style="background-color: rgb(236, 233, 233);">
		<div style="height: 30px"></div>
		<p class="fw-bold fs-3">실시간 리뷰</p>
		<p class="fs-5">고객님의 생생한 리뷰를 확인해보세요.</p>
		<div class="bg-black" style="height: 2px; width: 30px"></div>
		<div id="rcmd-product-list"
			class="p-3 mt-4 w-75 d-flex justify-content-center">
			<div id="rcmd-product-1" class="w-25 p-3">
				<a href="#" class="d-flex flex-column align-items-center"> 
				<img src="https://i.ibb.co/Sc0bSjY/dogicecream.jpg"
					class="w-75 img-thumbnail" />
				</a>
				<div class="p-2 d-flex flex-column align-items-center">
					<a href="#"
						class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
						${review.rvtitle}</a>
					<hr />
					<p>사르르 녹아내려요</p>
					<p>⭐⭐⭐⭐⭐</p>
				</div>
			</div>
			<div id="rcmd-product-2" class="w-25 p-3">
				<a href="#" class="d-flex flex-column align-items-center"> <img
					src="https://i.ibb.co/f9yTBG2/doggum.png"
					class="w-75 img-thumbnail" />
				</a>
				<div class="p-2 d-flex flex-column align-items-center">
					<a href="#"
						class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
						멍뭉이 쭈압쭈압 개껌 </a>
					<hr />
					<p>맛있게 잘먹었습니다.</p>
					<p>⭐⭐⭐⭐⭐</p>
				</div>
			</div>
			<div id="rcmd-product-3" class="w-25 p-3">
				<a href="#" class="d-flex flex-column align-items-center"> <img
					src="https://i.ibb.co/VNhrhcX/chickenbreast.jpg"
					class="w-75 img-thumbnail" />
				</a>

				<div class="p-2 d-flex flex-column align-items-center">
					<a href="#"
						class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
						득근득근 웅장한 닭가슴살 </a>
					<hr />
					<p>울집 강아지 영양간식!</p>
					<p>⭐⭐⭐⭐⭐</p>
				</div>
			</div>
			<div id="rcmd-product-4" class="w-25 p-3">
				<a href="#" class="d-flex flex-column align-items-center"> <img
					src="https://i.ibb.co/7zD4Gqb/dogfood.jpg"
					class="w-75 img-thumbnail" />
				</a>
				<div class="p-2 d-flex flex-column align-items-center">
					<a href="#"
						class="link-underline link-underline-opacity-0 link-underline-opacity-75-hover fw-bold text-black">
						멍멍냠냠 영양만점 강아지사료 </a>
					<hr />
					<p>우리 아이 술안주</p>
					<p>⭐⭐⭐⭐⭐</p>
				</div>
			</div>
		</div>
		<div style="height: 20px"></div>
	</div>


	<div style="height: 75px"></div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>