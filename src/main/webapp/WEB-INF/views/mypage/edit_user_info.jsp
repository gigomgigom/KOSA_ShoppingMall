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
</style>
<!-- 사용자 정의 자바스크립트 -->
<script>
	/* 데이터 유효성을 확인 해당 데이터 처리하는 메소드 */


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
<title>회원가입</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>


	<div class="container-fluid d-flex justify-content-center">

		<form id="joinForm" name="joinForm"
			action="${pageContext.request.contextPath}/mypage/update_user_info"
			method="post" novalidate style="width: 400px;" class="d-flex flex-column"
			enctype="multipart/form-data">
			
			<input type="hidden" class="form-control w-100" id="memno"
				name="memno" value="${member.memno}" readonly>

			<!-- handleCheckData()를 사용하여 사용자 정의 유효성 검사를 수행함, novalidate속성을 사용하여 기본 브라우저의  유효성 검사를 막음 -->
			<div class="container-fluid d-flex justify-content-center p-5 m-3">
				<h2>사용자 정보 수정</h2>
			</div>
			<div class="mb-3">
				<h5>사이트 이용정보</h5>
			</div>
			<label for="memid">아이디</label> <input type="text"
				class="form-control w-100" id="memid" name="memid"
				value="${member.memid}" readonly>
			<div class="my-2 ms-2"></div>
			<div class="my-2">
				<label for="mempw">비밀번호 변경</label> <input type="password"
					class="form-control w-100" id="mempw" name="mempw"
					placeholder="새 비밀번호 입력(필수)">
				<div class="mx-2 mt-2">
					<span id="mempwSpan" class="form-text" style="font-size: 11px;">대,
						소문자를 포함한 8자이상 15자이하 입력해주세요.</span>
				</div>
			</div>
			<input type="password" class="form-control w-100" id="mempwRe"
				placeholder="비밀번호확인 (필수)">
			<div class="mx-2 mt-2">
				<span id="mempwReSpan" class="form-text" style="font-size: 11px;">비밀번호가
					일치하지 않습니다.</span>
			</div>

			<div class="mt-2">
				<span>이미지 변경</span>
			</div>

			<div class="border p-3 d-flex flex-column align-items-center">
				<img class="img-fluid rounded-circle"
					src="${pageContext.request.contextPath}/mypage/downloadMemImg?memno=${member.memno}"
					width="100px">
				<div class="d-flex flex-column mt-3">
					<input type="file" class="form-control" name="memimgattach">
				</div>
			</div>

			<div class="pt-5">
				<h5>개인정보</h5>
			</div>
			<input type="text" class="form-control w-100" id="memname"
				placeholder="이름 (필수)" name="memname" value="${member.memname}"
				required>
			<div class="p-2">
				<span id="memnameSpan" class="form-text" style="font-size: 11px;">공백없이
					한글,영문,숫자만 입력가능(한글2자, 영문 4자 이상)</span>
			</div>
			<div class="mb-3 my-2">
				<input type="text" class="form-control w-100" id="memnicknm"
					placeholder="닉네임 (필수)" name="memnicknm" value="${member.memnicknm}"
					required>
				<div class="mx-2 mt-2">
					<span id="memnicknmSpan" class="form-text" style="font-size: 11px;">닉네임
						첫 글자는 대문자로 시작하며 3자이상 8자이하로 작성해주세요.</span>
				</div>
			</div>
			<div class="mb-3">
				<input type="email" class="form-control w-100" id="mememail"
					placeholder="Email (필수)" name="mememail" value="${member.mememail}"
					required>
				<div class="mx-2 mt-2">
					<span id="mememailSpan" class="form-text" style="font-size: 11px;">이메일
						형식에 맞춰 입력해주세요.</span>
				</div>
			</div>

			<input type="text" class="form-control w-100" id="memtel"
				placeholder="휴대폰번호 (필수)" name="memtel" value="${member.memtel}"
				required>
			<div class="mx-2">
				<span id="memtelSpan" class="form-text" style="font-size: 11px;">휴대폰
					번호를 입력해주세요.</span>
			</div>
			<div class="w-100 d-flex justify-content-end mt-3 mb-3">
				<button type="button" class="btn text-white btn-sm"
					style="background-color: #9523DC;">주소검색</button>
			</div>
			<div class="mb-3">
				<input type="text" class="form-control w-100" id="postno"
					placeholder="우편번호 (필수)" name="postno" value="${memberAdr.postno}"
					required>
				<div class="mx-2">
					<span id="upostalCodeSpan" class="form-text"
						style="font-size: 11px;">우편번호 입력해 주세요.</span>
				</div>
			</div>

			<div class="mb-3">
				<input type="text" class="form-control w-100" id="adr"
					placeholder="주소 (필수)" name="adr" value="${memberAdr.adr}" required>
				<div class="mx-2">
					<span id="adre" class="form-text" style="font-size: 11px;">주소를
						입력해주세요.</span>
				</div>
			</div>

			<input type="text" class="form-control w-100" id="adrdtl"
				placeholder="상세주소" name="adrdtl" value="${memberAdr.adrdtl}">

			<div class="w-100 d-flex justify-content-center p-5">
				<input type="submit" class="btn text-white btn-sm w-100"
					style="background-color: #9523DC;" value="회원정보수정" />
			</div>
		</form>
	</div>
	<div style="height:100px"></div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>