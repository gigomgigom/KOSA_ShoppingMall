<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script>
$(function(){
		$("#search").click(() => { 
			let select = $("option:selected").val();
			let keyword = $("#keyword").val();
			document.location.href = "search?search=" + select + "&keyword=" + keyword;
		}); 
})
		
		
</script>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</header>

	<div
		class="container-fluid  d-flex flex-column align-items-center m-0 my-5 p-0">
		<div class="d-flex justify-content-between w-50 m-0 mb-3 p-0">
			<div class="d-flex align-items-center m-0 p-0">
				<p class="m-0 p-0">총 게시글  ${fn:length(boardList)}건</p>
			</div>

			<div class="d-flex m-0 p-0 " style="width: 30%; height: 10%;">
				<select class="form-select form-select-sm w-25 m-0 p-0">
					<option class="m-0 p-0" value="글쓴이" selected>글쓴이</option>
					<option class="m-0 p-0" value="제목">제목</option>
					<option class="m-0 p-0" value="내용">내용</option>
				</select> <input id="keyword" class="form-control form-control-sm w-50 m-0 p-0"
					type="text">
				<button id="search" type="button" class="btn btn-sm m-0 p-0 w-25 border">검색</button>
			</div>

		</div>

		<div class="row w-50 m-0 mb-5 p-0">
			<div id="thead" class="row text-center m-0 p-0 py-1"
				style="background-color: #27374D; color: white;">
				<p class="col-1 m-0 p-0">번호</p>
				<p class="col-1 m-0 p-0">상태</p>
				<p class="col-6 m-0 p-0">제목</p>
				<p class="col-1 m-0 p-0">작성자</p>
				<p class="col-2 m-0 p-0">작성일</p>
				<p class="col-1 m-0 p-0">조회수</p>
			</div>

			<div id="tnotice" class="m-0 p-0"
				style="background-color: lightgray;">
				<div class="row text-center border-bottom m-0 p-0 py-1">
					<p
						class="col-2 d-flex  justify-content-center align-items-center m-0 p-0">
						<span class="badge rounded-pill text-bg-danger">공지</span>
					</p>
					<p class="col-6 m-0 p-0  text-start">공지1</p>
					<p class="col-1 m-0 p-0">관리자</p>
					<p class="col-2 m-0 p-0">2024-04-12</p>
					<p class="col-1 m-0 p-0">7</p>
				</div>

				<div class="row text-center border-bottom m-0 p-0 py-1">
					<p
						class="col-2 d-flex  justify-content-center align-items-center m-0 p-0">
						<span class="badge rounded-pill text-bg-danger">공지</span>
					</p>
					<p class="col-6 m-0 p-0  text-start">공지2</p>
					<p class="col-1 m-0 p-0">관리자</p>
					<p class="col-2 m-0 p-0">2024-04-12</p>
					<p class="col-1 m-0 p-0">7</p>
				</div>

				<div class="row text-center border-bottom m-0 p-0 py-1">
					<p
						class="col-2 d-flex  justify-content-center align-items-center m-0 p-0">
						<span class="badge rounded-pill text-bg-danger">공지</span>
					</p>
					<p class="col-6 m-0 p-0  text-start">공지3</p>
					<p class="col-1 m-0 p-0">관리자</p>
					<p class="col-2 m-0 p-0">2024-04-12</p>
					<p class="col-1 m-0 p-0">7</p>
				</div>
			</div>

			<div id="tbody" class="m-0 p-0">
				<c:forEach var='board' items="${boardList}" varStatus="status">
					<div class="row text-center border-bottom m-0 p-0 py-1">
						<p class="col-1 m-0 p-0">${boardList[fn:length(boardList)-(status.index+1)].bno}</p>
						<p
							class="col-1 d-flex  justify-content-center align-items-center m-0 p-0">
							<span class="badge rounded-pill bg-primary">완료</span>
						</p>
						<p class="col-6 m-0 p-0 text-start">
							<a class="text-decoration-none text-dark m-0 p-0"
								href="${pageContext.request.contextPath}/board/detail?bno=${boardList[fn:length(boardList)-(status.index+1)].bno}">${boardList[fn:length(boardList)-(status.index+1)].btitle}</a>
						</p>
						<p class="col-1 m-0 p-0">${boardList[fn:length(boardList)-(status.index+1)].bid}</p>
						<p class="col-2 m-0 p-0">
							<fmt:formatDate value="${boardList[fn:length(boardList)-(status.index+1)].bdate}" pattern="yyyy-MM-dd" />
						</p>
						<p class="col-1 m-0 p-0">${boardList[fn:length(boardList)-(status.index+1)].hitcount}</p>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="d-flex justify-content-between w-50 m-0 p-0">
			<div></div>

			<div class="m-0 p-0" style="display:none;">
				<ul class="pagination m-0 p-0">
					<li class="page-item m-0 p-0"><a class="page-link text-dark"
						href="#">이전</a></li>
					<li class="page-item m-0 p-0"><a class="page-link text-dark"
						href="#">1</a></li>
					<li class="page-item m-0 p-0"><a class="page-link text-dark"
						href="#">2</a></li>
					<li class="page-item m-0 p-0"><a class="page-link text-dark"
						href="#">3</a></li>
					<li class="page-item m-0 p-0"><a class="page-link text-dark"
						href="#">다음</a></li>
				</ul>
			</div>

			<div>
				<a class="btn" href="create"
					style="background-color: #27374D; color: white">글쓰기</a>
			</div>
		</div>
	</div>
	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
</html>