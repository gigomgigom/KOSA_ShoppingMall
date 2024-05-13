<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
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
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
	
</script>
<style>

* {
	margin: 0;
	padding: 0;
}

</style>
<meta charset="UTF-8">
<title>ItemList</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</header>

	<div class="container-fluid d-flex align-items-center flex-column mt-5">
		<h1>
			<b>${ctgno == 1 ? '사료' : ctgno == 2? '간식' : '영양제'}</b>
		</h1>
		<div class="d-flex flex-column my-5" style="width: 80vw;">
			<div
				class="w-100 d-flex justify-content-between border border-dark rounded mb-5">
				<div class="d-flex">
				<form name="sortForm" action="" method="get">
					<input name="ctgno" type="hidden" value="${ctgno}">
                    <input name="pageNo" type="hidden" value="1">
					<select class="form-select form-select-sm w-100 h-100" name="sorting" onchange="this.form.submit()">
					  <option value="lowPrice" ${sorting == "lowPrice"? "selected" : ""}>낮은 가격순</option>
					  <option value="highPrice" ${sorting == "highPrice"? "selected" : ""}>높은 가격순</option>
					  <option value="newItem" ${sorting == "newItem"? "selected" : ""}>신상품순</option>
					</select>
				</form>
				</div>
				<div class="d-flex">
				   <form class="d-flex w-100 m-0 p-0" method="get" action="">
                    	<input name="ctgno" type="hidden" value="${ctgno}">
                    	<input name="pageNo" type="hidden" value="1">
                        <input name="keyword" class="form-control form-control-sm text-center text-muted w-100 m-0 p-0 py-2" type="text" 
                        	placeholder="상품검색" value = "${keyword != '' and keyword != null ? keyword : null}">
                   </form>
					<button class="btn" type="button" id="button-addon2">
						<img src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png"
							style="height: 30px;"> 
					</button>
				</div>
			</div>
			<div class="w-100 d-flex flex-wrap justify-content-between mb-5">
				<!--상품 목록 출력-->
				<!-- JSTL에서 ForEach태그를 사용해서 아래 상품 출력칸을 가져온 상품 수만큼 뿌려준다. -->
				<c:forEach var="item" items="${itemList}">
				<div class="card mb-4" style="width: 24%">
					<a href="${pageContext.request.contextPath}/item/item_detail?prodno=${item.prodno}">
						<%-- <img class="card-img-top" src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${item.prodno}" alt="Card image" style="width: 100%;"> --%> </a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="${pageContext.request.contextPath}/item/item_detail?prodno=${item.prodno}" class="text-decoration-none text-black">${item.prodname}</a>
						</h4>
						<h5>${item.prodprice}원</h5>
						<p>상품 평점 : ${item.avgrating} 리뷰 : ${item.rvcount}개</p>
					</div>
				</div>
				</c:forEach>

				<!-- ---------------------------------------------------------------------------------------- -->
                    <div class="m-0 p-0">
                        <tr>
							            <td colspan="4" class="text-center">
							               <div>
							                  <a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/item/item_list?ctgno=${ctgno}&pageNo=1">처음</a>
							                  <c:if test="${pager.groupNo>1}"> 
							                     <a class="btn btn-outline-info btn-sm" href="${pageContext.request.contextPath}/item/item_list?ctgno=${ctgno}&pageNo=${pager.startPageNo-1}">이전</a>
							                  </c:if>
							                  
							                  <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							                     <c:if test="${pager.pageNo != i}">
							                        <a class="btn btn-outline-success btn-sm" href="${pageContext.request.contextPath}/item/item_list?ctgno=${ctgno}&pageNo=${i}">${i}</a>
							                     </c:if>
							                     <c:if test="${pager.pageNo == i}">
							                        <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/item/item_list?ctgno=${ctgno}&pageNo=${i}">${i}</a>
							                     </c:if>
							                  </c:forEach>
							                  <!-- 그룹의 번호가 마지막 그룹의 번호보다 작을 경우에만 다음 버튼이 보이게 함 -->
							                  <c:if test="${pager.groupNo<pager.totalGroupNo}">
							                     <a class="btn btn-outline-info btn-sm" href="${pageContext.request.contextPath}/item/item_list?ctgno=${ctgno}&pageNo=${pager.endPageNo+1}">다음</a>
							                  </c:if>
							                  <a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/item/item_list?ctgno=${ctgno}&pageNo=${pager.totalPageNo}">맨끝</a>
							               </div>
							            </td>
							         </tr>
							      </table>
                    </div>

			</div>
		</div>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
		
	</script>
</body>
</html>