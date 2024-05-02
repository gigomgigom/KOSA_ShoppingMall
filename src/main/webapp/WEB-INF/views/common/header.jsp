<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!--헤더-->
<div class="border-bottom">
	<ul class="nav justify-content-end me-5">
		<sec:authorize access="isAnonymous()">
			<li class="nav-item border-start border-end"><a
				class="fw-bold nav-link text-black"
				href="${pageContext.request.contextPath}/auth/signin">로그인</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_USER')">
			<li><b class="text-white me-2"> <sec:authentication
						property="principal.username" />
			</b></li>
			<li class="nav-item border-start border-end"><a
				class="fw-bold nav-link text-black"
				href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			<li class="nav-item border-start border-end"><a
				class="fw-bold nav-link text-black"
				href="${pageContext.request.contextPath}/shoppingcart">🛒장바구니</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><b class="text-white me-2"> <sec:authentication
						property="principal.username" />
			</b></li>
			<li class="nav-item border-start border-end"><a
				class="fw-bold nav-link text-black"
				href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			<li class="nav-item border-start border-end"><a
				class="fw-bold nav-link text-black"
				href="${pageContext.request.contextPath}/shoppingcart">관리자페이지로
					이동</a></li>
		</sec:authorize>
	</ul>
</div>


<div class="d-flex justify-content-center mt-5">
	<a href="${pageContext.request.contextPath}">
	<img src="https://i.ibb.co/fMVwYYJ/pagelogo.png" style="width: 600px" />
	</a>
</div>

<div>
	<ul class="nav justify-content-center align-items-center"
		style="height: 50px; background-color: #27374D;">
		<li class="nav-item ms-5 me-5"><a
			class="fw-bold nav-link text-white" aria-current="page"
			href="${pageContext.request.contextPath}/item/item_list"><h5>베스트셀러</h5></a></li>
		<li class="nav-item ms-5 me-5"><a class="nav-link text-white"
			href="${pageContext.request.contextPath}/item/item_list"><h5>간식</h5></a></li>
		<li class="nav-item ms-5 me-5"><a class="nav-link  text-white"
			href="${pageContext.request.contextPath}/item/item_list"><h5>사료</h5></a></li>
		<li class="nav-item ms-5 me-5"><a class="nav-link text-white"
			href="${pageContext.request.contextPath}/board/list"><h5>Q&A</h5></a></li>
	</ul>
</div>

