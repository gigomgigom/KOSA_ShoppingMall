<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">

</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</header>

	<div
		class="container-fluid d-flex flex-column align-items-center m-0 my-5 p-0">
		<div
			class="container-fluid d-flex flex-column align-items-center border border-secondary-subtle w-75 m-0 mb-5 p-0">
			<div class="row w-100 border-bottom border-secondary-subtle m-0 p-0">
				<div class="col-1 border-end border-secondary-subtle m-0 p-0">
					<div
						class="d-flex justify-content-center align-items-center h-100 m-0 p-0">
						<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/mypage/downloadMemImg?memno=${qna.memno}"
							width="80%" height="80%">
					</div>
				</div>

				<div class="col-11 d-flex flex-column align-items-center m-0 p-0">
					<div
						class="d-flex justify-content-between align-items-center border-bottom w-100 h-75 m-0 p-0 py-2">
						<p class="m-0 p-0 ps-3">${qna.qnatitle}</p>
					</div>

					<diV
						class="d-flex justify-content-start align-items-center w-100 h-25 m-0 p-0 py-4">
						<p class="border-end border-secondary-subtle m-0 p-0 px-3"
							style="font-weight: bold;">${qna.qnawriter}</p>
						<p class="border-end border-secondary-subtle m-0 p-0 px-3"><fmt:formatDate value="${qna.qnadate}" pattern="yyyy-MM-dd"/></p>
						<p class="border-end border-secondary-subtle m-0 p-0 px-3">${qna.qnahitcnt}</p>
						<p class="m-0 p-0 ps-3">
							상태: <span class="badge rounded-pill"
								style="background-color: #526D82;">완료</span>
						</p>
					</diV>
				</div>
			</div>

			<div class="w-100 m-0 p-0 p-5 mb-5">
				<p class="m-0 p-0 ps-3">
					 ${qna.qnacontent}
				</p>
			</div>

			<div
				class="d-flex justify-content-start align-items-center w-100 m-0 p-0 px-5">
				<div
					class="d-flex flex-column justify-content-center align-items-start border border-2 border-secondary-subtle w-100  m-0 mb-5 p-0"
					style="position: relative;">
					<span class="m-0  px-3 py-2 rounded-pill text-center"
						style="color: white; background-color: #27374D; position: absolute; top: -10%; left: -1%;">답변
						대기 중입니다</span>
					<p class="m-0 px-3 py-5">
						답변이 없습니다 <br /> <br />없다니까요 <br />없어요 없어 <br />돌아가요

					</p>
				</div>

			</div>

		</div>
		
		<div class="w-75 m-0 mb-5 p-0">
		
			<c:if test="${qna.nextno != -1}">
				<div class="d-flex justify-content-start align-items-center border-top border-bottom border-secondary-subtle w-100 m-0 px-5 py-1">
					<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.member" var="member" />
		                        <c:if test="${qna.nextlock == 1}">
		                        	<c:if test="${member.memno == qna.nextmemno or member.memrole == 'ROLE_ADMIN'}">
		                            	<p class="m-0 p-0">&#9651다음글 <a href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.nextno}" class="text-dark text-decoration-none">${qna.nexttitle}</a></p>
		                        	</c:if>
		                        
		                        	<c:if test="${member.memno != qna.nextmemno and member.memrole != 'ROLE_ADMIN'}">
		                            	<p class="m-0 p-0 text-start">&#9651다음글 비밀이라니까요...</p>
		                        	</c:if>
		                        </c:if>
	                        
	                        
		                        <c:if test="${qna.nextlock == 0}">
		                        	<p class="m-0 p-0">&#9651다음글 <a href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.nextno}" class="text-dark text-decoration-none">${qna.nexttitle}</a></p>
		                        </c:if>
                     </sec:authorize>
					
					 <sec:authorize access="isAnonymous()">
	                        <c:if test="${qna.nextlock == 1}">
	                        	<p class="m-0 p-0 text-start">&#9651다음글 비밀이에요...</p>
	                        </c:if>
                        
	                        <c:if test="${qna.nextlock == 0}">
	                        	<p class="m-0 p-0">&#9651다음글 <a href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.nextno}" class="text-dark text-decoration-none">${qna.nexttitle}</a></p>
	                        </c:if>
                     </sec:authorize>
				</div> 
			</c:if>
			
			<c:if test="${qna.preno != -1}">
				
				<div class="d-flex justify-content-start align-items-center border-bottom border-secondary-subtle w-100 m-0 px-5 py-1">
					<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.member" var="member" />
		                        <c:if test="${qna.prelock == 1}">
		                        	<c:if test="${member.memno == qna.prememno or member.memrole == 'ROLE_ADMIN'}">
		                            	<p class="m-0 p-0">&#9661이전글  <a href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.preno}" class="text-dark text-decoration-none">${qna.pretitle}</a></p>
		                        	</c:if>
		                        
		                        	<c:if test="${member.memno != qna.prememno and member.memrole != 'ROLE_ADMIN'}">
		                            	<p class="m-0 p-0 text-start">&#9661이전글 비밀이라니까요...</p>
		                        	</c:if>
		                        </c:if>
	                        
	                        
		                        <c:if test="${qna.prelock == 0}">
		                        	<p class="m-0 p-0">&#9661이전글  <a href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.preno}" class="text-dark text-decoration-none">${qna.pretitle}</a></p>
		                        </c:if>
                     </sec:authorize>
					
					 <sec:authorize access="isAnonymous()">
	                        <c:if test="${qna.prelock == 1}">
	                        	<p class="m-0 p-0 text-start">&#9661이전글 비밀이에요...</p>
	                        </c:if>
                        
	                        <c:if test="${qna.prelock == 0}">
	                        	<p class="m-0 p-0">&#9661이전글  <a href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.preno}" class="text-dark text-decoration-none">${qna.pretitle}</a></p>
	                        </c:if>
                     </sec:authorize>
				</div> 
			</c:if>
				
		</div>

		<div
			class="d-flex w-75 justify-content-center align-items-center m-0 mb-3 p-0">
			<a class="btn btn-sm m-0 p-0"
				style="background-color: #27374D; color: white;" href="${pageContext.request.contextPath}/qna/qna_list">목록</a>
		</div>

		<div
			class="d-flex w-75 justify-content-center align-items-center m-0 p-0">
			<sec:authorize access="isAuthenticated">
				<a href="${pageContext.request.contextPath}/qna/update_qna?qnano=${qna.qnano}" class="btn btn-sm border border-secondary-subtle m-0 me-3 p-0">수정</a>
				<a href="${pageContext.request.contextPath}/qna/delete_qna?qnano=${qna.qnano}" class="btn btn-sm border border-secondary-subtle m-0 p-0">삭제</a>
			</sec:authorize>
		</div>
	</div>
	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>

</body>
</html>