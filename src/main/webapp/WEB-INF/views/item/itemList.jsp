<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 사용자 정의 자바스크립트 -->
    <script>

    </script>
    <!-- jQuery 외부 라이브러리 설정 -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Latest compiled and minified CSS -->
    <!-- 클라이언트에게 라이브러리 파일을 어디 서버에 다운받을 지 배정받는다. -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
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
        <h1><b>간식</b></h1>
        <div class="d-flex flex-column my-5" style="width: 80vw;">
            <div class="w-100 d-flex justify-content-between border border-dark rounded mb-5">
                <div class="dropdown">
                    <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown">
                        	상품정렬
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">인기순</a></li>
                        <li><a class="dropdown-item" href="#">낮은 가격순</a></li>
                        <li><a class="dropdown-item" href="#">높은 가격순</a></li>
                    </ul>
                </div>
                <div class="d-flex">
                    <input type="text" class="form-control" placeholder="상품 검색" aria-label="Recipient's username" aria-describedby="button-addon2">
                    <button class="btn" type="button" id="button-addon2">
                        <img src="${pageContext.request.contextPath}/resources/image/icon/search_icon.png" style="height: 30px;">
                    </button>
                </div>
            </div>
            <div class="w-100 d-flex flex-wrap justify-content-between mb-5">
                <!--상품 목록 출력-->
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>
                <div class="card mb-4" style="width: 24%">
                    <a href="#">
                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/image/item/snack.png" alt="Card image" style="width: 100%;">                        
                    </a>                    
                    <div class="card-body">
                      <a href="#" class="text-decoration-none text-black">
                        <h4 class="card-title"><b>상품123123</b></h4>
                      </a>
                      <h5>45,000원</h5>
                      <p>상품 평점 : 4.5 리뷰 : 4개</p>
                    </div>
                </div>            
            </div>
        </div>
    </div>
	<footer>
        	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </footer>
        <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>