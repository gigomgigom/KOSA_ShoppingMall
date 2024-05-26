<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
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
				href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
			<li class="nav-item border-start border-end"><a
				class="fw-bold nav-link text-black"
				href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
			<li class="nav-item border-start border-end"><a
				class="fw-bold nav-link text-black"
				href="${pageContext.request.contextPath}/cart">🛒장바구니</a></li>
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
				href="${pageContext.request.contextPath}/admin/main">관리자페이지로
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
	<ul class="nav justify-content-center align-items-center menu">
		<li class="nav-item"><a aria-current="page"
			href="${pageContext.request.contextPath}/item/item_list?ctgno=1&pageNo=1&sorting=bestItem&keyword=">사료</a>
			<ul class="submenu">
				<li>
					<a>이별주</a>
				</li>
			</ul>
		</li>
		<li class="nav-item"><a
			href="${pageContext.request.contextPath}/item/item_list?ctgno=2&pageNo=1&sorting=bestItem&keyword=">간식</a></li>
		<li class="nav-item"><a
			href="${pageContext.request.contextPath}/item/item_list?ctgno=3&pageNo=1&sorting=bestItem&keyword=">영양제</a></li>
		<li class="nav-item"><a
			href='${pageContext.request.contextPath}/qna/qna_list?pageNo=1&keyword='>게시판</a></li>
	</ul>
</div>

