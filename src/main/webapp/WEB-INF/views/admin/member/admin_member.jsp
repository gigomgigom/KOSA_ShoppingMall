<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- 사용자 정의 자바스크립트 -->
<script
	src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
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
	<div class="d-flex flex-row">
		<%@ include file="/WEB-INF/views/admin/common/admin_menu.jsp"%>
		<div class="d-flex flex-column align-items-center" id="view_container"
			style="width: 100vw;">
			<!--상단 바-->
			<div class="d-flex justify-content-between align-items-center"
				style="width: 100%; height: 75px; background-color: #27374D;">
				<h4 class="my-0 ms-5 ps-5 text-white">회원 조회</h4>
				<div class="d-flex flex-row align-items-center">
					<a href="${pageContext.request.contextPath}/" class="btn me-5 text-white fw-bold"
						style="background-color: #526D82;">쇼핑몰 페이지 이동</a>
					<a class="btn me-5 text-white fw-bold"
						style="background-color: #526D82;" href="${pageContext.request.contextPath}/logout">로그아웃</a>
					<span class="text-white me-5 fw-bold">환영합니다. <sec:authentication property="principal.username"/>님</span>
				</div>
			</div>
			<div class="d-flex" style="width: 90%; height: 91vh;">
				<div class="mt-5 w-100 d-flex flex-column">
					<h5>
						<b>회원 리스트</b>
					</h5>
					<hr class="w-100" />
					<form id="memberSearchIndex" method="get"
						action="admin_member_view"
						class="d-flex justify-content-end align-items-center">
						<div class="form-check">
							<input type="radio" class="form-check-input" id="radio1"
								name="searchindex" value="1"
								${searchIndex.searchindex==1?'checked':''}> <label
								class="form-check-label" for="radio1">이름</label>
						</div>
						<div class="form-check">
							<input type="radio" class="form-check-input" id="radio1"
								name="searchindex" value="2"
								${searchIndex.searchindex==2?'checked':''}> <label
								class="form-check-label" for="radio1">이메일</label>
						</div>
						<input type="text" class="form-control ms-4" placeholder="검색어 입력"
							name="searchkeyword" style="width: 15%;"
							value="${searchIndex.searchkeyword}">
						<button type="submit"
							class="btn ms-1 d-flex justify-content-center align-items-center">
							<img
								src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png"
								width="20px">
						</button>
					</form>
					<div class="mt-4">
						<table class="table table-hover text-center">
							<thead class="table-dark">
								<tr>
									<th>회원번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>Email</th>
									<th>휴대폰번호</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tbody style="vertical-align: middle;">
								<c:forEach var="member" items="${memberList}">
									<tr
										onclick="location.href='${pageContext.request.contextPath}/admin/member_detail?memno=${member.memno}'">
										<td>${member.memno}</td>
										<td>${member.memid}</td>
										<td>${member.memname}</td>
										<td>${member.mememail}</td>
										<td>${member.memtel}</td>
										<td><fmt:formatDate value="${member.memdate}"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
							<div class="d-flex justify-content-center mt-5">
								<div>
									<a class="btn btn-sm"
										href="admin_member_view?pageno=1">처음</a>
									<c:if test="${searchIndex.pager.groupNo>1}">
										<a class="btn btn-sm"
											href="admin_member_view?pageno=${searchIndex.pager.startPageNo-1}">이전</a>
									</c:if>

									<c:forEach var="i" begin="${searchIndex.pager.startPageNo}"
										end="${searchIndex.pager.endPageNo}">
										<c:if test="${searchIndex.pager.pageNo != i}">
											<a class="btn btn-sm"
												href="admin_member_view?pageno=${i}">${i}</a>
										</c:if>
										<c:if test="${searchIndex.pager.pageNo == i}">
											<a class="btn btn-sm"
												href="admin_member_view?pageno=${i}"><b>${i}</b></a>
										</c:if>
									</c:forEach>

									<c:if
										test="${searchIndex.pager.groupNo<searchIndex.pager.totalGroupNo}">
										<a class="btn btn-sm"
											href="admin_member_view?pageno=${searchIndex.pager.endPageNo+1}">다음</a>
									</c:if>
									<a class="btn btn-sm"
										href="admin_member_view?pageno=${searchIndex.pager.totalPageNo}">맨끝</a>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>