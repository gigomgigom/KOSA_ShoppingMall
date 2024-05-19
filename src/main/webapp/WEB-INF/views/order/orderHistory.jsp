<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>
	
	<div style="height: 100px"></div>
	<div class="container-fluid d-flex flex-column align-items-center" style="min-width: 1250px">
		<h1 class="my-3">주문 내역</h1>
		<hr class="w-50 m-0 my-3 p-0" />
		
		<!-- 주문내역 한행당 아래와같이 작성 -->
		<c:forEach var="order" items="${orderList}">
		<div class="w-50 d-flex flex-column align-items-center">			
			<div class="w-100 border mb-2 p-3">
				<div class="d-flex justify-content-between m-0 mb-2 p-0">
					<div class="d-flex flex-column">
						<p class="m-0 p-0">
							<a class="text-dark"
								href="${pageContext.request.contextPath}/order/order_detail?ordno=${order.ordNo}">${order.ordNo}</a>
						</p>
						<c:if test="${order.prodCnt != 0}">
							<p class="m-0 mb-2 p-0">${order.prodName} 외 ${order.prodCnt}건</p>
						</c:if>
							 
						<c:if test="${order.prodCnt == 0}">
							<p class="m-0 mb-2 p-0">${order.prodName}</p>
						</c:if>
						
						<p class="m-0 mb-2 p-0">${order.totalPrice}</p>
					</div>
					<div class="d-flex flex-column">
						<p class="m-0  p-0" style="font-size: 0.75rem;"><fmt:formatDate value="${order.ordDate}" pattern="yyyy-MM-dd"/></p>
						<div class="d-flex justify-content-center mt-2">
							<%-- <p class="text-center rounded d-flex align-items-center p-1"
								style="background-color: #27374D; color: white;">${order.prodStatus}</p> --%>
						</div>
					</div>					
				</div>				
				<div class="d-flex justify-content-center  m-0 p-0 px-2">
					<p class="w-100 m-0 p-0 py-3 text-center border">${order.prodStatus}</p>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<div style="height: 100px"></div>
		<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>
</body>
</html>