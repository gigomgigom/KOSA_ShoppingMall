<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="accordion">
<div class="container">
	<c:forEach var="review" items="${reviewList}">
		<div class="card">
			<div class="d-flex justify-content-between card-header">
				<div class="d-flex align-items-center">
				<img src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${prodno}" width="50px">
					<span>${review.rvcontent}</span>
					<span><c:if test="${review.rvrating == 1}">⭐</c:if></span>
					<span><c:if test="${review.rvrating == 2}">⭐⭐</c:if></span>
					<span><c:if test="${review.rvrating == 3}">⭐⭐⭐</c:if></span>
					<span><c:if test="${review.rvrating == 4}">⭐⭐⭐⭐</c:if></span>
					<span><c:if test="${review.rvrating == 5}">⭐⭐⭐⭐⭐</c:if></span>
				</div>
				<div class="d-flex align-items-center">
					<span class="d-flex justify-content-end">
						<fmt:formatDate value="${review.rvdate}" pattern="yyyy-MM-dd"/>
					</span>			
				</div>
			</div>
		</div>
	</c:forEach>
</div>
</div>