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

<style>
* {
	margin: 0px;
	padding: 0px;
}

.container {
	max-width: 1200px; /* 필요한 경우 조절 가능 */
	margin: 0 auto;
}

.flex-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.box1 {
	display: flex;
	align-items: center; /* 텍스트를 세로 중앙 정렬 */
	margin: 10px;
	padding: 5px;
	border: 1px solid grey;
	justify-content: space-between; /*양쪽 끝에 텍스트가 배치되게끔 정렬*/
}

.flex-item {
	flex: 0 0 calc(25% - 20px); /* 각 항목의 너비 조절, 여백 고려하여 계산 */
}

/* .dropdown-menu {
	margin-top: 0;
	margin-bottom: 0;
} */
</style>

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
	<header>
    		<%@ include file="/WEB-INF/views/common/header.jsp"%>
    </header>
    
	<div class="container my-5">
		<div class="d-flex justify-content-center mt-5 mb-3">
			<h2>🌈간식</h2>
		</div>

		<div class="dropdown">
			<div class="box1" id="dropdownMenuButton" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				상품정렬 ▼ <img src="/javajavajo_mini_web/resources/image/icon/grid_icon.png" style="width: 2%; height: auto;">
			</div>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">기본 정렬</a> <a class="dropdown-item"
					href="#">이름순</a> <a class="dropdown-item" href="#">낮은 가격순</a> <a
					class="dropdown-item" href="#">높은 가격순</a>
			</div>
		</div>


		<div class="flex-container">
			<div class="flex-item mb-3">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 1</h3>
					<h4>49000원</h4>
					<p>평점 4.5 리뷰 0</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 2</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 3</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 4</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 5</h3>
					<h4>49000원</h4>
					<p>평점 0.0 리뷰 0</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 6</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 7</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 8</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item mb-3">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 9</h3>
					<h4>49000원</h4>
					<p>평점 4.5 리뷰 0</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 10</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 11</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 12</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 13</h3>
					<h4>49000원</h4>
					<p>평점 0.0 리뷰 0</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 14</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 15</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>

			<div class="flex-item">
				<img src="https://i.ibb.co/f9yTBG2/doggum.png"
					style="width: 100%; height: auto;">
				<div class="product-info mt-3">
					<h3 class="mb-2">강아지 수제 간식 16</h3>
					<h4>45000원</h4>
					<p>평점 4.5 리뷰 10</p>
				</div>
			</div>
		</div>
	</div>
	<footer>
        	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </footer>
</body>
</html>