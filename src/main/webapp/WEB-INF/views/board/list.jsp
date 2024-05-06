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

        <div class="container-fluid  d-flex flex-column align-items-center m-0, p-0">
            
             <div class="d-flex w-75 m-0 my-5 p-0 ">
                    <form class="d-flex w-100 m-0 p-0" method="get" action="">
                        <input name="keyword" class="form-control form-control-sm text-center text-muted w-100 m-0 p-0 py-2" type="text" placeholder="&#8474; 검색어를 입력해주세요">
                   </form>
                </div>
            
            
            <div class="d-flex justify-content-between align-items-center w-75 m-0 mb-3 p-0">
                <div class="d-flex align-items-center m-0 p-0">
                    <p class="m-0 p-0">총 게시글 30건</p>
                </div>
            </div>
            
            <table class="table table-borderless w-75 m-0 mb-5 p-0">
                <thead class="m-0 p-0">
                    <tr class="row m-0 p-0">
                        <th class="d-flex justify-content-center align-items-center col-2 m-0 p-0"><p class="m-0 p-0">상태</p></th>
                        <th class="d-flex justify-content-center align-items-center col-6 m-0 p-0"><p class="m-0 p-0">제목</p></th>
                        <th class="d-flex justify-content-center align-items-center col-1 m-0 p-0"><p class="m-0 p-0">작성자</p></th>
                        <th class="d-flex justify-content-center align-items-center col-2 m-0 p-0"><p class="m-0 p-0">작성일</p></th>
                        <th class="d-flex justify-content-center align-items-center col-1 m-0 p-0"><p class="m-0 p-0">조회수</p></th>
                    </tr>
                </thead>
                
                
                <tbody id="tboard" class="m-0 p-0">                   
              <!-- items = 반복가능한 무언가?(qna(dto)의 정보) -->
                    <c:forEach var="qna" items="${qnaList}">
                    	<tr class="row border-bottom border-second-subtle m-0 p-0 py-3">
                        <td class="d-flex justify-content-center align-items-center col-2 m-0 p-0">
                            <span class="badge rounded-pill" style="background-color: #9DB2BF; color: white">접수</span>
                        </td>
                        <td class="d-flex justify-content-center align-items-center col-6 m-0 p-0">
                        <!-- 제목의 절대경로지정 제목 클릭 시 detailBoard의 qnano해당 번호로 이동 -->
                            <p class="m-0 p-0 text-start"><a href="${pageContext.request.contextPath}/board/detailBoard?qnano=${qna.qnano}" class="text-dark text-decoration-none">${qna.qnatitle}</a></p>
                        </td>
                        <td class="d-flex justify-content-center align-items-center col-1 m-0 p-0">
                            <p class="m-0 p-0">${qna.qnawriter}</p>
                        </td>
                        <td class="d-flex justify-content-center align-items-center col-2 m-0 p-0">
                            <p class="m-0 p-0"><fmt:formatDate value="${qna.qnadate}" pattern="yyyy-MM-dd"/></p>
                        </td>
                        <td class="d-flex justify-content-center align-items-center col-1 m-0 p-0">
                            <p class="m-0 p-0">${qna.qnahitcnt}</p>
                        </td>
                    </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
             
                <div class="d-flex justify-content-between w-75 m-0 p-0">
                    <div></div>
        
                    <div class="m-0 p-0">
                        <ul class="pagination m-0 p-0">
                          <li class="page-item m-0 p-0"><a class="page-link text-dark" href="#">이전</a></li>
                          <li class="page-item m-0 p-0"><a class="page-link text-dark" href="#">1</a></li>
                          <li class="page-item m-0 p-0"><a class="page-link text-dark" href="#">2</a></li>
                          <li class="page-item m-0 p-0"><a class="page-link text-dark" href="#">3</a></li>
                          <li class="page-item m-0 p-0"><a class="page-link text-dark" href="#">다음</a></li>
                        </ul>
                    </div>
                    
                    <div>
                        <a href="${pageContext.request.contextPath}/board/writeBoard" class="btn" style="background-color: #273740; color: white">글쓰기</a>
                    </div>
            </div>
        </div>
	  </div>
	<footer>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</footer>
</body>
</html>