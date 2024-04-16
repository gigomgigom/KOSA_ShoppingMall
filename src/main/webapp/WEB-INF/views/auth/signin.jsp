<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<style>
    
    * {
        margin: 0px;
        padding: 0px;

    }
</style>
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
<title>로그인</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<div style="height: 70px"></div>
	
	<div class="container-fluid d-flex justify-content-center">
		<form id="loginForm" style="width: 400px;" method="post" action="${pageContext.request.contextPath}/"
			class="d-flex flex-column mt-5">

			<div class="d-flex justify-content-center">
				<h3>로그인</h3>
			</div>

			<label for="username"></label> <input type="text" id="username"
				name="username" class="form-control me-2 p-2 mt-5" placeholder="아이디">

			<label for="password"></label> <input type="password" id="password"
				name="password" class="form-control me-2 p-2 mt-3 mb-1"
				placeholder="비밀번호">

			<div class="d-flex justify-content-end">
				<a href="#"
					class="password_find me-2 mt-2 mb-2 text-reset text-secondary text-decoration-none"
					style="font-size: small;">아이디/비밀번호 찾기</a>
			</div>

			<button type="submit" class="w-100 text-white mt-2 "
				style="background-color: #27374D; height: 40px;">로그인</button>
			<button type="button" class="w-100  mt-2" onclick="location.href='${pageContext.request.contextPath}/auth/signup'"
				style="background-color: #ffffff; height: 40px;">회원가입</button>
		</form>
	</div>
	
	<div style="height: 150px"></div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
	<script>

	//이벤트가 발생할 때 호출할 함수를 지정
	document.getElementById("loginForm").addEventListener("submit",
			function(event) {
				event.preventDefault();

				var username = document.getElementById("username").value;
				var password = document.getElementById("password").value;

				//if문을 사용하여 검사
				if (username !== "황세림" || password !== "970321") {
					alert("올바른 로그인 아이디 또는 비밀번호를 입력하세요.");
				} else if(username === "황세림" && password === "970321"){
					console.log("Username:", username);
					console.log("Password:", password);
					document.getElementById("loginForm").submit();
				}
			});
	
	</script>
</body>
</html>