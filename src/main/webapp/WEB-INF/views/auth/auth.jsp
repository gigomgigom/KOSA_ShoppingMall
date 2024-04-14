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
      	/* 데이터 유효성을 확인 해당 데이터 처리하는 메소드 */
         function handleCheckData() {
      		// 브라우저가 기본적으로 수행하는 동작을 취소하고 원하는 동작을 수행하도록 하기 위함.
            event.preventDefault();
      		// 회원가입의 모든 유효성 검사가 통과되었는지 여부를 판단
            totalResult = true;

            // ID 검사
            var uidPattern =  /^[a-zA-z0-9]{3,12}$/;
            var el_uid = document.querySelector("#uid");
            console.log(el_uid);
            let uidResult = uidPattern.test(el_uid.value);
            let el_uid_span = document.querySelector("#uidSpan");

           	if(el_uid.value.length === 0) {
           		el_uid_span.innerHTML = '아이디를 입력해주세요.';
           		el_uid_span.classList.add("text-danger");
           		totalResult = false;
           	}else if(el_uid.value.length <= 2 || !uidResult) {
           		el_uid_span.innerHTML = '3자 이상 12자이하로 작성해주세요.';
           		el_uid_span.classList.add("text-danger");
           		totalResult = false;
           	} else {
           		el_uid_span.innerHTML='';
           		el_uid_span.classList.remove("text-danger");
           	}
            
			// password 검사 
            var el_password = document.querySelector("#password");
            var el_passwordRe = document.querySelector("#passwordRe");
            var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
            var passwordResult = passwordPattern.test(el_password.value);
            var el_password_span = document.querySelector("#passwordSpan");
            var el_passwordRe_span = document.querySelector("#passwordReSpan");

            console.log(password.value.length);

            if (el_password.value.length === 0) {
                el_password_span.innerHTML = '비밀번호를 입력해주세요.';
                el_password_span.classList.add("text-danger");
                totalResult = false;
            } else if (el_password.value.length <= 7 || !passwordResult) {
                el_password_span.innerHTML = '대, 소문자를 포함한 8자이상 15자이하 입력해주세요.';
                el_password_span.classList.add("text-danger");
                totalResult = false;
            } else {
                el_password_span.innerHTML = '';
                el_password_span.classList.remove("text-danger");
            }
            
            // 비밀번호 확인 검사
            if (el_passwordRe.value.length === 0) {
	        el_passwordRe_span.innerHTML = '비밀번호를 입력해주세요.';
	        el_passwordRe_span.classList.add("text-danger");
	        totalResult = false;
		    } else if (el_password.value !== el_passwordRe.value) {
		        el_passwordRe_span.innerHTML = '비밀번호가 일치하지 않습니다.';
		        el_passwordRe_span.classList.add("text-danger");
		        totalResult = false;
		    } else {
		        el_passwordRe_span.innerHTML = '';
		        el_passwordRe_span.classList.remove("text-danger");
		    }
            
            
            
            // 이름 유효성 검사
            var el_uname = document.querySelector("#uname");
            // 한글로 2~4글자의 정규표현식 검사
            var namePattern = /^[가-힣]{2,4}$/;
            var nameResult = namePattern.test(el_uname.value);
            var el_uname_span = document.querySelector("#unameSpan");

            if(nameResult) {
            el_uname_span.innerHTML='';
            el_uname_span.classList.remove("text-danger");
            } else {
            el_uname_span.classList.add("text-danger");
            el_uname_span.innerHTML='공백 없이 한글, 영문, 숫자만 입력가능(한글 2자, 영문 4자 이상)';
            totalResult = false;
            }

            // 닉네임 유효성 검사
            var el_unickname = document.querySelector("#unickname");

            var nicknamePattern = /^[A-Z][a-zA-Z]{2,7}$/;
            var nicknameResult = nicknamePattern.test(el_unickname.value);
            var el_unickname_span = document.querySelector("#unicknameSpan");

            if(nicknameResult) {
                el_unickname_span.innerHTML='';
                el_unickname_span.classList.remove("text-danger");
            } else {
                el_unickname_span.innerHTML='닉네임 첫 글자는 대문자로 시작하며 3자이상 8자이하로 작성해주세요.';
                el_unickname_span.classList.add("text-danger");
                totalResult = false;
            }

            // Email 검사
            var el_uemail = document.querySelector("#uemail");

            var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
            var emailResult = emailPattern.test(el_uemail.value);
            var el_uemail_span = document.querySelector("#uemailSpan");

            if(emailResult) {
                el_uemail_span.innerHTML='';
                el_uemail_span.classList.remove("text-danger");
            } else {
                el_uemail_span.innerHTML='이메일 형식에 맞게 입력해주세요.';
                el_uemail_span.classList.add("text-danger");
                totalResult = false;
            }
            //휴대폰 번호 검사
            var el_uphoneNum = document.querySelector("#uphoneNum");
            
            var phoneNumPattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
            var phoneNumResult = phoneNumPattern.test(el_uphoneNum.value);
            var el_uphoneNum_span = document.querySelector("#uphoneNumSpan");

            if(phoneNumResult) {
                el_uphoneNum_span.innerHTML='';
                el_uphoneNum_span.classList.remove("text-danger");
            } else {
                el_uphoneNum_span.innerHTML='전화번호 형식이 올바르지 않습니다.';
                el_uphoneNum_span.classList.add("text-danger");
                totalResult = false;
            }
            // 우편번호 검사
            var el_upostalCode = document.querySelector("#upostalCode");

            var postalCodePattern = /^\d{3}-\d{2}$/;
            var postalCodeResult = postalCodePattern.test(el_upostalCode.value);
            var el_upostalCode_span = document.querySelector("#upostalCodeSpan");

            if(postalCodeResult) {
                el_upostalCode_span.innerHTML='';
                el_upostalCode_span.classList.remove("text-danger");
            } else {
                el_upostalCode_span.innerHTML='우편번호 형식이 올바르지 않습니다.';
                el_upostalCode_span.classList.add("text-danger"); 
                totalResult = false;
            }
			
            // 주소 검사


            //총 유효성 검사가 true 일때
            if(totalResult) {
                $("#joinForm")[0].submit();
                console.log("#joinForm");
                alert('가입을 환영합니다.');
            }
        }
  
      </script>
      <!-- jQuery 외부 라이브러리 설정 -->
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
      
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
      <!-- Latest compiled and minified CSS -->
      <!-- 클라이언트에게 라이브러리 파일을 어디 서버에 다운받을 지 배정받는다. -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

      <!-- Latest compiled JavaScript -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      <meta charset="UTF-8">
      <title>Insert title here</title>
   </head>
   <body>
      <div class="container-fluid d-flex justify-content-center">
            <form id="joinForm" name="joinForm" action="/javajavajo_mini_web/" onsubmit="handleCheckData()" novalidate style="width: 400px;" class="d-flex flex-column">
                <div class="container-fluid d-flex justify-content-center p-5 m-3">
                    <h2>회원가입</h2>
                </div>
                <div class="mb-3">
               <h5>사이트 이용정보 입력</h5>
            </div>
                <input type="text" class="form-control w-100" id="uid" placeholder="아이디 (필수)" name="uidPattern" required>
                <div class="my-2 ms-2">
               <span id="uidSpan" class="form-text" style="font-size: 11px;">영문자,숫자만 입력가능 최소 3자이상 입력해주세요. </span>
            </div>
            <div class="my-2">
               <input type="password" class="form-control w-100" id="password" placeholder="비밀번호 (필수)" name="passwordPattern" required>
               <div class="mx-2 mt-2">
               <span id="passwordSpan" class="form-text" style="font-size: 11px;">대, 소문자를 포함한 8자이상 15자이하 입력해주세요.</span>
            </div>
            </div>
            <input type="password" class="form-control w-100" id="passwordRe" placeholder="비밀번호확인 (필수)" name="passwordRePattern" required> 
            <div class="mx-2 mt-2">
                <span id="passwordReSpan" class="form-text" style="font-size: 11px;">대, 소문자를 포함한 8자이상 15자이하 입력해주세요.</span>
            </div>
            <div class="pt-5">
               <h5>개인정보 입력</h5>
            </div>
                <input type="text" class="form-control w-100" id="uname" placeholder="이름 (필수)" name="uname" required>
            <div class="p-2">
                <span id="unameSpan" class="form-text" style="font-size: 11px;">공백없이 한글,영문,숫자만 입력가능(한글2자, 영문 4자 이상)</span>
            </div>
            <div class="mb-3 my-2">
               <input type="text" class="form-control w-100" id="unickname" placeholder="닉네임 (필수)" name="unickname" required>
               <div class="mx-2 mt-2">
                    <span id="unicknameSpan" class="form-text" style="font-size: 11px;">닉네임 첫 글자는 대문자로 시작하며 3자이상 8자이하로 작성해주세요.</span>
               </div>
            </div>
            <div class="mb-3">
               <input type="email" class="form-control w-100" id="uemail" placeholder="Email (필수)" name="uemail" required>
               <div class="mx-2 mt-2">
                    <span id="uemailSpan" class="form-text" style="font-size: 11px;">이메일 형식에 맞춰 입력해주세요.</span>
               </div>
            </div>
            
            	<input type="text" class="form-control w-100" id="uphoneNum" placeholder="휴대폰번호 (필수)" name="uphoneNum" required>
            <div class="mx-2">
                 <span id="uphoneNumSpan" class="form-text" style="font-size: 11px;">휴대폰 번호를 입력해주세요.</span>
            </div>
            <div class="w-100 d-flex justify-content-end mt-3 mb-3">
                    <button type="button" class="btn text-white btn-sm" style="background-color: #27374D;">주소검색</button>
            </div>
            <div class="mb-3">
                <input type="text" class="form-control w-100" id="upostalCode" placeholder="우편번호 (필수)" name="upostalCode" required>
                <div class="mx-2">
                     <span id="upostalCodeSpan" class="form-text" style="font-size: 11px;">우편번호 입력해 주세요.</span>
                </div>
            </div>
            
            <div class="mb-3">
               <input type="text" class="form-control w-100" id="uadress" placeholder="주소 (필수)" name="uadress" required>
               <div class="mx-2">
                    <span id="uadressSpan" class="form-text" style="font-size: 11px;">주소를 입력해주세요.</span>
               </div>
            </div>
            
            <input type="text" class="form-control w-100" id="text3" placeholder="상세주소" name="text">
                <div class="w-100 d-flex justify-content-center p-5">
                     <input type="submit" class="btn text-white btn-sm" style="background-color: #27374D;" value="회원가입" />
                </div>
            </form>
        </div>
   </body>
</html>