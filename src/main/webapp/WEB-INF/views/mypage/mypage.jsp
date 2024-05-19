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
<!-- Latest compiled JavaScript -->
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
   
</script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Latest compiled and minified CSS -->
<!-- 클라이언트에게 라이브러리 파일을 어디 서버에 다운받을 지 배정받는다. -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<meta charset="UTF-8">
<title>멍슐랭</title>
</head>
<body>
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>
   <div style="height: 100px"></div>
   <div
      class="container-fluid  d-flex flex-column align-items-center m-0, p-0" style="min-width: 1250px">

      <div
         class="d-flex justify-content-center align-items-center w-75 m-0 my-3 p-0">
         <p class="m-0 p-0">
         <h1>My page</h1>
         </p>
      </div>


      <div class="row w-75 m-0  p-0 justify-content-center">
         <div class="col-2 d-flex flex-column align-items-center m-0 p-0">
            <div
               class="d-flex flex-column justify-content-center align-items-center border w-100 m-0 p-0 py-3">
               <img class="rounded-circle"
                  src="${pageContext.request.contextPath}/mypage/downloadMemImg?memno=${member.memno}"
                  width="80%" height="80%">
               <p class="m-0 my-3 p-0">
               <h3>${member.memname}님</h3>
               </p>
            </div>

            <div
               class="d-flex flex-column justify-content-center align-items-center w-100 m-0 p-0 py-3
               btn"
               data-bs-toggle="modal" data-bs-target="#myModal"
               style="background-color: #9523DC; color: white;">
               <p class="m-0 p-0">포인트</p>
               <p class="m-0 p-0">${member.mempoint}p</p>
            </div>

            <div
               class="d-flex flex-column justify-content-center align-items-center w-100 border m-0 p-0 py-3">
               <div class="w-75 m-0 p-0">
                  <p class="w-100 m-0 p-0">연락처</p>
                  <p class="w-100 m-0 p-0">${member.memtel}</p>
               </div>
            </div>

            <div
               class="d-flex flex-column justify-content-center align-items-center w-100 border m-0 p-0 py-3">
               <div class="w-75 m-0 p-0">
                  <p class="w-100 m-0 p-0">E-mail</p>
                  <p class="w-100 m-0 p-0" style="font-size: 0.75rem;">${member.mememail}</p>
               </div>
            </div>

            <div
               class="d-flex flex-column justify-content-center align-items-center w-100 border m-0 p-0 py-3">
               <div class="w-75 m-0 p-0">
                  <p class="w-100 m-0 p-0">주소</p>
                  <p class="w-100 m-0 p-0" style="font-size: 0.75rem;">${memberAdr.adr}</p>
               </div>
            </div>

            <div
               class="d-flex flex-column justify-content-between align-items-center border w-100 m-0 p-0 py-3">
               <div class="w-75 m-0 my-2 p-0 py-2 text-center rounded"
                  style="background-color: #9523DC;">
                  <a class="text-decoration-none text-white m-0 p-0"
                     href="${pageContext.request.contextPath}/mypage/edit_user_info">회원정보
                     수정</a>
               </div>
               <div class="w-75 m-0 my-2 p-0 py-2 text-center rounded"
                  style="background-color: #9523DC;">
                  <a class="text-decoration-none text-white m-0 p-0"
                     href="${pageContext.request.contextPath}/logout">로그아웃</a>
               </div>
               <div class="w-75 m-0 my-2 p-0 py-2 text-center rounded"
                  style="background-color: #9523DC;">
                  <a class="text-decoration-none text-white m-0 p-0" href="#">탈퇴</a>
               </div>

            </div>
         </div>
         <!-- 주문내역 foreach로 반복해서 출력 -->
         <!-- ----------------------------------------------------------------------- -->
         <div class="col-9 d-flex flex-column  align-items-center m-0 p-0">
            <div class="w-75 m-0 mt-3 p-0">
               <p class="w-100 m-0 p-0">주문내역</p>
            </div>

            <hr class="w-75 m-0 my-3 p-0" />
            <c:forEach var="order" items="${orderList}">
               <div class="w-75 border m-0 mb-3 p-3">
                  <div class="d-flex justify-content-between m-0 mb-2 p-0">
                     <p class="m-0 p-0">
                        <a class="text-dark"
                           href="${pageContext.request.contextPath}/order/order_detail?ordno=${order.ordno}">${order.ordno}</a>
                     </p>
                     <p class="m-0  p-0" style="font-size: 0.75rem;"><fmt:formatDate value="${order.orddate}" pattern="yyyy-MM-dd"/></p>
                  </div>

                  <p class="m-0 mb-2 p-0">
                  ${order.oneproduct.prodname}
                  <c:if test="${order.ordproductcnt>1}">외 ${order.ordproductcnt - 1}개</c:if>
                  </p>

                  <p class="m-0 mb-2 p-0">${order.finprice}원</p>

                  <div class="d-flex justify-content-center border m-0 p-0 px-2">
                     <p class="w-100 m-0 p-0 py-3 text-center">${order.ordsttschar}</p>
                  </div>
               </div>
            </c:forEach>

            <!-- ----------------------------------------------------------------------- -->

            <hr class="w-75 m-0 my-3 p-0" />

            <div
               class=" d-flex justify-content-center align-items-center w-25 border m-0 my-3 p-0 rounded"
               style="background-color: #9523DC;">
               <p class="m-0 p-0 py-2">
                  <a class="text-white text-decoration-none"
                     href="${pageContext.request.contextPath}/order/order_history">주문내역
                     더보기</a>
               </p>
            </div>
         </div>
      </div>
   </div>
   <div style="height: 300px"></div>

   	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>
   <%@ include file="/WEB-INF/views/mypage/point_detail_modal.jsp"%>
</body>
</html>