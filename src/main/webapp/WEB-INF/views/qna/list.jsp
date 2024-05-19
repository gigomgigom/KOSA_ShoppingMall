<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<meta charset="UTF-8">

</head>
<body>
	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<header>
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</header>
	</div>
	<div
		class="container-fluid  d-flex flex-column align-items-center m-0, my-5 p-0"
		style="min-width: 1250px">

		<div
			class="d-flex justify-content-center align-items-center m-0 p-0">
			<div>
				<h1>Q&A</h1>
			</div>
		</div>
		
		<div class="d-flex w-75 m-0 my-5 p-0 ">
			<form class="d-flex w-100 m-0 p-0" method="get" action=""
				autocomplete="off">
				<input name="pageNo" type="hidden" value="1"> <input
					name="keyword"
					class="form-control form-control-sm text-center text-muted w-100 m-0 p-0 py-2"
					type="text" placeholder="&#8474; 검색어를 입력해주세요"
					value="${keyword != '' and keyword != null ? keyword : null}">
			</form>
		</div>


		<div
			class="d-flex justify-content-between align-items-center w-75 m-0 mb-3 p-0">
			<div class="d-flex align-items-center m-0 p-0">
				<p class="m-0 p-0">총 게시글 ${pager.totalRows}개</p>
			</div>
		</div>

		<table class="table table-borderless w-75 m-0 mb-5 p-0">
			<thead class="m-0 p-0">
				<tr class="row m-0 p-0">
					<th
						class="d-flex justify-content-center align-items-center col-2 m-0 p-0"><p
							class="m-0 p-0">상태</p></th>
					<th
						class="d-flex justify-content-center align-items-center col-6 m-0 p-0"><p
							class="m-0 p-0">제목</p></th>
					<th
						class="d-flex justify-content-center align-items-center col-1 m-0 p-0"><p
							class="m-0 p-0">작성자</p></th>
					<th
						class="d-flex justify-content-center align-items-center col-2 m-0 p-0"><p
							class="m-0 p-0">작성일</p></th>
					<th
						class="d-flex justify-content-center align-items-center col-1 m-0 p-0"><p
							class="m-0 p-0">조회수</p></th>
				</tr>
			</thead>


			<tbody id="tboard" class="m-0 p-0">
				<!-- items = 반복가능한 무언가?(qna(dto)의 정보) -->
				<c:forEach var="qna" items="${qnaList}">
					<tr class="row border-bottom border-second-subtle m-0 p-0 py-3">
						<c:if test="${qna.admrply == null}">
							<td
								class="d-flex justify-content-center align-items-center col-2 m-0 p-0">
								<span class="badge rounded-pill"
								style="background-color: #F6EEFA; color: black">접수</span>
							</td>
						</c:if>

						<c:if test="${qna.admrply != null}">
							<td
								class="d-flex justify-content-center align-items-center col-2 m-0 p-0">
								<span class="badge rounded-pill"
								style="background-color: #9523DC; color: white;" color:white">완료</span>
							</td>
						</c:if>
						<td
							class="d-flex justify-content-center align-items-center col-6 m-0 p-0">
							<!-- 제목의 절대경로지정 제목 클릭 시 detailBoard의 qnano해당 번호로 이동 --> <sec:authorize
								access="isAuthenticated()">
								<sec:authentication property="principal.member" var="member" />
								<c:if test="${qna.qnalock == 1}">
									<c:if
										test="${qna.qnawriter == member.memid or member.memrole == 'ROLE_ADMIN'}">
										<p class="m-0 p-0 text-start">
											<a
												href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.qnano}"
												class="text-dark text-decoration-none">${qna.qnatitle}</a>
										</p>
									</c:if>

									<c:if
										test="${qna.qnawriter != member.memid and member.memrole != 'ROLE_ADMIN'}">
										<p class="m-0 p-0 text-start">
											비밀이라니까요...</a>
										</p>
									</c:if>
								</c:if>


								<c:if test="${qna.qnalock == 0}">
									<p class="m-0 p-0 text-start">
										<a
											href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.qnano}"
											class="text-dark text-decoration-none">${qna.qnatitle}</a>
									</p>
								</c:if>
							</sec:authorize> <sec:authorize access="isAnonymous()">
								<c:if test="${qna.qnalock == 1}">
									<p class="m-0 p-0 text-start">
										비밀이에요...</a>
									</p>
								</c:if>

								<c:if test="${qna.qnalock == 0}">
									<p class="m-0 p-0 text-start">
										<a
											href="${pageContext.request.contextPath}/qna/qna_detail?qnano=${qna.qnano}"
											class="text-dark text-decoration-none">${qna.qnatitle}</a>
									</p>
								</c:if>
							</sec:authorize>

						</td>
						<td
							class="d-flex justify-content-center align-items-center col-1 m-0 p-0">
							<p class="m-0 p-0">${qna.qnawriter}</p>
						</td>
						<td
							class="d-flex justify-content-center align-items-center col-2 m-0 p-0">
							<p class="m-0 p-0">
								<fmt:formatDate value="${qna.qnadate}" pattern="yyyy-MM-dd" />
							</p>
						</td>
						<td
							class="d-flex justify-content-center align-items-center col-1 m-0 p-0">
							<p class="m-0 p-0">${qna.qnahitcnt}</p>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

		<div class="d-flex justify-content-center w-75 m-0 p-0">
			<div class="m-0 p-0">
				<tr>
					<td colspan="4" class="text-center">
						<div>
							<a class="btn btn-outline-light btn-sm text-dark"
								href="${pageContext.request.contextPath}/qna/qna_list?pageNo=1">처음</a>
							<c:if test="${pager.groupNo>1}">
								<a class="btn btn-outline-light btn-sm text-dark"
									href="${pageContext.request.contextPath}/qna/qna_list?pageNo=${pager.startPageNo-1}">이전</a>
							</c:if>

							<c:forEach var="i" begin="${pager.startPageNo}"
								end="${pager.endPageNo}">
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-light btn-sm text-dark"
										href="${pageContext.request.contextPath}/qna/qna_list?pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo == i}">
									<a class="btn t btn-sm"
										style="background-color: #9523DC; color: white"
										href="${pageContext.request.contextPath}/qna/qna_list?pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach>
							<!-- 그룹의 번호가 마지막 그룹의 번호보다 작을 경우에만 다음 버튼이 보이게 함 -->
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a class="btn btn-outline-light btn-sm text-dark"
									href="${pageContext.request.contextPath}/qna/qna_list?pageNo=${pager.endPageNo+1}">다음</a>
							</c:if>
							<a class="btn btn-outline-light btn-sm text-dark"
								href="${pageContext.request.contextPath}/qna/qna_list?pageNo=${pager.totalPageNo}">맨끝</a>
						</div>
					</td>
				</tr>
				</table>
			</div>
		</div>
		<div class="d-flex justify-content-end w-75 m-0 p-0">
			<div>
				<a href="${pageContext.request.contextPath}/qna/write_qna"
					class="btn" style="background-color: #9523DC; color: white">글쓰기</a>
			</div>
		</div>
	</div>

	<div class="container-fluid w-100 m-0 p-0" style="min-width: 1250px">
		<footer>
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</footer>
	</div>
</body>
</html>