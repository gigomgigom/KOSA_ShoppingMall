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
         function handleCheckData() {
      		// 브라우저가 기본적으로 수행하는 동작을 취소하고 원하는 동작을 수행하도록 하기 위함.
            event.preventDefault();
      		// 회원가입의 모든 유효성 검사가 통과되었는지 여부를 판단
            totalResult = true;

            // ID 검사
            var memidPattern =  /^[a-zA-z0-9]{3,12}$/;
            var el_memid = document.querySelector("#memid");
            console.log(el_memid);
            let memidResult = memidPattern.test(el_memid.value);
            let el_memid_span = document.querySelector("#memidSpan");

           	if(el_memid.value.length === 0) {
           		el_memid_span.innerHTML = '아이디를 입력해주세요.';
           		el_memid_span.classList.add("text-danger");
           		totalResult = false;
           	}else if(el_memid.value.length <= 2 || !memidResult) {
           		el_memid_span.innerHTML = '3자 이상 12자이하로 작성해주세요.';
           		el_memid_span.classList.add("text-danger");
           		totalResult = false;
           	} else {
           		el_memid_span.innerHTML='';
           		el_memid_span.classList.remove("text-danger");
           	}
            
			// password 검사 
            var el_mempw = document.querySelector("#mempw");
            var el_mempwRe = document.querySelector("#mempwRe");
            var mempwPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
            var mempwResult = mempwPattern.test(el_mempw.value);
            var el_mempw_span = document.querySelector("#mempwSpan");
            var el_mempwRe_span = document.querySelector("#mempwReSpan");

            console.log(mempw.value.length);

            if (el_mempw.value.length === 0) {
                el_mempw_span.innerHTML = '비밀번호를 입력해주세요.';
                el_mempw_span.classList.add("text-danger");
                totalResult = false;
            } else if (el_mempw.value.length <= 7 || !mempwResult) {
                el_mempw_span.innerHTML = '대, 소문자를 포함한 8자이상 15자이하 입력해주세요.';
                el_mempw_span.classList.add("text-danger");
                totalResult = false;
            } else {
                el_mempw_span.innerHTML = '';
                el_mempw_span.classList.remove("text-danger");
            }
            
            // 비밀번호 확인 검사
            if (el_mempwRe.value.length === 0) {
	        el_mempwRe_span.innerHTML = '비밀번호를 입력해주세요.';
	        el_mempwRe_span.classList.add("text-danger");
	        totalResult = false;
		    } else if (el_mempw.value !== el_mempwRe.value) {
		        el_mempwRe_span.innerHTML = '비밀번호가 일치하지 않습니다.';
		        el_mempwRe_span.classList.add("text-danger");
		        totalResult = false;
		    } else {
		        el_mempwRe_span.innerHTML = '';
		        el_mempwRe_span.classList.remove("text-danger");
		    }
            
            
            
            // 이름 유효성 검사
            var el_memname = document.querySelector("#memname");
            // 한글로 2~4글자의 정규표현식 검사
            var memnamePattern = /^[가-힣]{2,4}$/;
            var memnameResult = memnamePattern.test(el_memname.value);
            var el_memname_span = document.querySelector("#memnameSpan");

            if(memnameResult) {
            el_memname_span.innerHTML='';
            el_memname_span.classList.remove("text-danger");
            } else {
            el_memname_span.classList.add("text-danger");
            el_memname_span.innerHTML='공백 없이 한글, 영문, 숫자만 입력가능(한글 2자, 영문 4자 이상)';
            totalResult = false;
            }

            // 닉네임 유효성 검사
            var el_memnicknm = document.querySelector("#memnicknm");

            var memnicknmPattern = /^[A-Z][a-zA-Z]{2,7}$/;
            var memnicknmResult = memnicknmPattern.test(el_memnicknm.value);
            var el_memnicknm_span = document.querySelector("#memnicknmSpan");

            if(memnicknmResult) {
                el_memnicknm_span.innerHTML='';
                el_memnicknm_span.classList.remove("text-danger");
            } else {
                el_memnicknm_span.innerHTML='닉네임 첫 글자는 대문자로 시작하며 3자이상 8자이하로 작성해주세요.';
                el_memnicknm_span.classList.add("text-danger");
                totalResult = false;
            }

            // Email 검사
            var el_mememail = document.querySelector("#mememail");

            var mememailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
            var mememailResult = mememailPattern.test(el_mememail.value);
            var el_mememail_span = document.querySelector("#mememailSpan");

            if(mememailResult) {
                el_mememail_span.innerHTML='';
                el_mememail_span.classList.remove("text-danger");
            } else {
                el_mememail_span.innerHTML='이메일 형식에 맞게 입력해주세요.';
                el_mememail_span.classList.add("text-danger");
                totalResult = false;
            }
            //휴대폰 번호 검사
            var el_memtel = document.querySelector("#memtel");
            
            var memtelPattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
            var memtelResult = memtelPattern.test(el_memtel.value);
            var el_memtel_span = document.querySelector("#memtelSpan");

            if(memtelResult) {
                el_memtel_span.innerHTML='';
                el_memtel_span.classList.remove("text-danger");
            } else {
                el_memtel_span.innerHTML='전화번호 형식이 올바르지 않습니다.';
                el_memtel_span.classList.add("text-danger");
                totalResult = false;
            }
            // 우편번호 검사
            /* var el_postno = document.querySelector("#postno");

            var postnoPattern = /^\d{3}-\d{2}$/;
            var postnoResult = postnoPattern.test(el_postno.value);
            var el_postno_span = document.querySelector("#postnoSpan");

            if(postnoResult) {
                el_postno_span.innerHTML='';
                el_postno_span.classList.remove("text-danger");
            } else {
                el_postno_span.innerHTML='우편번호 형식이 올바르지 않습니다.';
                el_postno_span.classList.add("text-danger"); 
                totalResult = false;
            } */
			
            //총 유효성 검사가 true 일때
            if(totalResult) {
                $("#joinForm")[0].submit();
                console.log("#joinForm");
                alert('가입을 환영합니다.');
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
<title>회원가입</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	
	<div class="container-fluid d-flex justify-content-center">
		<form id="joinForm" name="joinForm" action="${pageContext.request.contextPath}/auth/auth" method="post"
			  onsubmit="handleCheckData()" novalidate style="width: 400px;"
			  class="d-flex flex-column">
			<!-- handleCheckData()를 사용하여 사용자 정의 유효성 검사를 수행함, novalidate속성을 사용하여 기본 브라우저의  유효성 검사를 막음 -->
			<div class="container-fluid d-flex justify-content-center p-5 m-3">
				<h2>회원가입</h2>
			</div>
			<div class="mb-3">
				<h5>사이트 이용정보 입력</h5>
			</div>
			<input type="text" class="form-control w-100" id="memid"
				placeholder="아이디 (필수)" name="memid" required>
			<div class="my-2 ms-2">
				<span id="memidSpan" class="form-text" style="font-size: 11px;">영문자,숫자만
					입력가능 최소 3자이상 입력해주세요. </span>
			</div>
			<div class="my-2">
				<input type="password" class="form-control w-100" id="mempw"
					placeholder="비밀번호 (필수)" name="mempw" required>
				<div class="mx-2 mt-2">
					<span id="mempwSpan" class="form-text" style="font-size: 11px;">대,
						소문자를 포함한 8자이상 15자이하 입력해주세요.</span>
				</div>
			</div>
			<input type="password" class="form-control w-100" id="mempwRe"
				placeholder="비밀번호확인 (필수)" name="passwordRePattern" required>
			<div class="mx-2 mt-2">
				<span id="mempwReSpan" class="form-text" style="font-size: 11px;">대,
					소문자를 포함한 8자이상 15자이하 입력해주세요.</span>
			</div>
			<div class="pt-5">
				<h5>개인정보 입력</h5>
			</div>
			<input type="text" class="form-control w-100" id="memname"
				placeholder="이름 (필수)" name="memname" required>
			<div class="p-2">
				<span id="memnameSpan" class="form-text" style="font-size: 11px;">공백없이
					한글,영문,숫자만 입력가능(한글2자, 영문 4자 이상)</span>
			</div>
			<div class="mb-3 my-2">
				<input type="text" class="form-control w-100" id="memnicknm"
					placeholder="닉네임 (필수)" name="memnicknm" required>
				<div class="mx-2 mt-2">
					<span id="memnicknmSpan" class="form-text" style="font-size: 11px;">닉네임
						첫 글자는 대문자로 시작하며 3자이상 8자이하로 작성해주세요.</span>
				</div>
			</div>
			<div class="mb-3">
				<input type="email" class="form-control w-100" id="mememail"
					placeholder="Email (필수)" name="mememail" required>
				<div class="mx-2 mt-2">
					<span id="mememailSpan" class="form-text" style="font-size: 11px;">이메일
						형식에 맞춰 입력해주세요.</span>
				</div>
			</div>

			<input type="text" class="form-control w-100" id="memtel"
				placeholder="휴대폰번호 (필수)" name="memtel" required>
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
					placeholder="우편번호 (필수)" name="postno" required>
				<div class="mx-2">
					<span id="upostalCodeSpan" class="form-text"
						style="font-size: 11px;">우편번호 입력해 주세요.</span>
				</div>
			</div>

			<div class="mb-3">
				<input type="text" class="form-control w-100" id="adr"
					placeholder="주소 (필수)" name="adr" required>
				<div class="mx-2">
					<span id="adre" class="form-text" style="font-size: 11px;">주소를
						입력해주세요.</span>
				</div>
			</div>

			<input type="text" class="form-control w-100" id="adrdtl"
				placeholder="상세주소" name="adrdtl">
			<div class="w-100 d-flex justify-content-center p-5">
				<input type="submit" class="btn text-white btn-sm w-100"
					style="background-color: #9523DC; height: 50px" value="회원가입" />
			</div>
		</form>
	</div>
	<div style="height: 100px">
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>