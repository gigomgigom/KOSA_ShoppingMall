<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<div class="container-fluid d-flex flex-column mt-5">
		<h5>
			<b>상품 정보 수정</b>
		</h5>
		<hr class="w-100" />
		<form id="editproductform" class="d-flex flex-column w-100 justify-content-center" enctype="multipart/form-data">
			<input type="hidden" value="${product.prodno}" name="prodno" id="productno">
			<div class="my-3">
				<div class="form-group mb-2">
					<label for="ctg">카테고리</label> <select class="form-control" id="ctg"
						name="ctgno">
						<c:forEach var="ctg" items="${ctgList}">
							<option value="${ctg.ctgno}" ${ctg.ctgno==product.ctgno?'selected':''}>${ctg.ctgnm}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="mb-3">
				<label for="productname" class="form-label">상품명</label> <input type="text"
					class="form-control" id="productname" name="prodname" value="${product.prodname}">
			</div>
			<div class="mb-3">
				<label for="productprice" class="form-label">상품 가격</label> <input type="number"
					class="form-control" id="productprice" name="prodprice" value="${product.prodprice}">
			</div>
			<div class="mb-3">
				<label for="productstock" class="form-label">입고할 수량</label> <input
					type="number" class="form-control" id="productstock" name="prodstock"
					value="${product.prodstock}">
			</div>
			<div>
				<span>상품 대표 이미지</span>
			</div>
			<div class="border d-flex justify-content-center"
				style="width: 100px">
				<img id="repimg-container" src="${pageContext.request.contextPath}/item/downloadRepimg?prodno=${product.prodno}"
					style="width: 100px; height: 100px" />
			</div>
			<div class="mt-3">
				<div class="input-group">
					<input type="file" class="form-control" name="repattach" id="attach1"
						onchange="setThumbnail(event)">
				</div>
			</div>
			<div class="mt-3">
				<span>상품 상세 이미지</span>
			</div>
			<div>
				<div class="input-group">
					<input type="file" class="form-control" name="dtlattach" id="attach2">
				</div>
			</div>
			<div class="w-100 d-flex flex-column align-items-center">
				<button type="button" onclick="editProductDetail()" class="btn w-50 border my-4">수정</button>
			</div>
			<div class="w-100 d-flex flex-column align-items-center">
				<button type="button" onclick="deleteProduct()" class="btn w-50 border mb-4">삭제</button>
			</div>
		</form>
	</div>
	
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</body>

</html>