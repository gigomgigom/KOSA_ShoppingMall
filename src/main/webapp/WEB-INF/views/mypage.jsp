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

	<div
		class="container-fluid  d-flex flex-column align-items-center m-0, p-0">

		<div
			class="d-flex justify-content-center align-items-center w-75 m-0 my-3 p-0">
			<p class="m-0 p-0">
			<h1>My page</h1>
			</p>
		</div>


		<div class="row w-75 m-0  p-0">
			<div class="col-2 d-flex flex-column align-items-center m-0 p-0">
				<div
					class="d-flex flex-column justify-content-center align-items-center border w-100 m-0 p-0 py-3">
					<img class="img-fluid rounded-circle"
						src="data:image/jpeg;base64,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"
						width="150px">
					<p class="m-0 my-3 p-0">
					<h3>심영조님</h3>
					</p>
				</div>

				<div
					class="d-flex flex-column justify-content-center align-items-center w-100 m-0 p-0 py-3"
					style="background-color: #27374D; color: white;">
					<p class="m-0 p-0">포인트</p>
					<p class="m-0 p-0">1500p</p>
				</div>

				<div
					class="d-flex flex-column justify-content-center align-items-center w-100 border m-0 p-0 py-3">
					<div class="w-75 m-0 p-0">
						<p class="w-100 m-0 p-0">연락처</p>
						<p class="w-100 m-0 p-0">010-2810-4870</p>
					</div>
				</div>

				<div
					class="d-flex flex-column justify-content-center align-items-center w-100 border m-0 p-0 py-3">
					<div class="w-75 m-0 p-0">
						<p class="w-100 m-0 p-0">E-mail</p>
						<p class="w-100 m-0 p-0" style="font-size: 0.75rem;">honghong@naver.com</p>
					</div>
				</div>

				<div
					class="d-flex flex-column justify-content-center align-items-center w-100 border m-0 p-0 py-3">
					<div class="w-75 m-0 p-0">
						<p class="w-100 m-0 p-0">주소</p>
						<p class="w-100 m-0 p-0" style="font-size: 0.75rem;">사랑시 고백구
							행복동</p>
					</div>
				</div>

				<div
					class="d-flex flex-column justify-content-between align-items-center border w-100 m-0 p-0 py-3">
					<div class="w-75 m-0 my-2 p-0 py-2 text-center"
						style="background-color: #27374D;">
						<a class="text-decoration-none text-white m-0 p-0">회원정보 수정</a>
					</div>
					<div class="w-75 m-0 my-2 p-0 py-2 text-center"
						style="background-color: #27374D;">
						<a class="text-decoration-none text-white m-0 p-0">로그아웃</a>
					</div>
					<div class="w-75 m-0 my-2 p-0 py-2 text-center"
						style="background-color: #27374D;">
						<a class="text-decoration-none text-white m-0 p-0">탈퇴</a>
					</div>

				</div>
			</div>

			<div class="col-9 d-flex flex-column  align-items-center m-0 p-0">
				<div class="w-75 m-0 mt-3 p-0">
					<p class="w-100 m-0 p-0">주문내역</p>
				</div>

				<hr class="w-75 m-0 my-3 p-0" />

				<div class="w-75 border m-0 mb-3 p-3">
					<div class="d-flex justify-content-between m-0 mb-2 p-0">
						<p class="m-0 p-0">
							<a class="text-dark">202404181758268</a>
						</p>
						<p class="m-0  p-0" style="font-size: 0.75rem;">24-04-18
							17:59:05</p>
					</div>

					<p class="m-0 mb-2 p-0">상품1</p>

					<p class="m-0 mb-2 p-0">0원</p>

					<div class="d-flex justify-content-center border m-0 p-0 px-2">
						<p class="w-100 m-0 p-0 py-3 text-center">주문취소</p>
					</div>
				</div>

				<div class="w-75 border m-0 mb-3 p-3">
					<div class="d-flex justify-content-between m-0 mb-2 p-0">
						<p class="m-0 p-0">
							<a class="text-dark">202404181758268</a>
						</p>
						<p class="m-0  p-0" style="font-size: 0.75rem;">24-04-18
							17:59:05</p>
					</div>

					<p class="m-0 mb-2 p-0">상품2</p>

					<p class="m-0 mb-2 p-0">0원</p>

					<div class="d-flex justify-content-center m-0 mb-2 p-0 px-2">
						<p class="w-100 m-0 p-0 py-3 text-center"
							style="background-color: #27374D; color: white;">배송완료</p>
					</div>

					<div class="d-flex justify-content-center  m-0 p-0 px-2">
						<p class="w-100 m-0 p-0 py-3 text-center border">우체국
							6861581676379</p>
					</div>
				</div>

				<div class="w-75 border m-0 p-3">
					<div class="d-flex justify-content-between m-0 mb-2 p-0">
						<p class="m-0 p-0">
							<a class="text-dark">202404181758268</a>
						</p>
						<p class="m-0  p-0" style="font-size: 0.75rem;">24-04-18
							17:59:05</p>
					</div>

					<p class="m-0 mb-2 p-0">상품3</p>

					<p class="m-0 mb-2 p-0">0원</p>

					<div class="d-flex justify-content-center m-0 mb-2 p-0 px-2">
						<p class="w-100 m-0 p-0 py-3 text-center"
							style="background-color: #27374D; color: white;">배송완료</p>
					</div>

					<div class="d-flex justify-content-center  m-0 p-0 px-2">
						<p class="w-100 m-0 p-0 py-3 text-center border">우체국
							6861581676379</p>
					</div>
				</div>

				<hr class="w-75 m-0 my-3 p-0" />

				<div
					class=" d-flex justify-content-center align-items-center w-25 border m-0 my-3 p-0"
					style="background-color: #27374D;">
					<p class="m-0 p-0 py-2">
						<a class="text-white text-decoration-none">주문내역 더보기</a>
					</p>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%></
	body>
</html>