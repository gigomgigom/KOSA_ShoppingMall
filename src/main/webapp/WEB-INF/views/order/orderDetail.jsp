<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<title>Insert title here</title>
</head>

<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div
		class="my-5 d-flex justify-content-center container-fluid d-flex flex-column"
		style="width: 800px;">
		<div class="d-flex justify-content-center p-2 m-2">
			<h5>주문상세내역</h5>
		</div>
		<div class="container-fluid d-flex justify-content-center bg-light">
			<div class="d-flex flex-column">

				<div class="mb-3 d-flex justify-content-center pt-3">
					<span>주문번호 2024041817582685</span>
				</div>
			</div>
		</div>


		<div class="card mb-3 d-flex justify-content-center container-fluid">
			<div class="row g-0">
				<div class="col-md-1 mt-5">
					<img
						src="${pageContext.request.contextPath}/resources/image/item/snack.png"
						width="80" height="80" class="img rounded-start" alt="...">
				</div>
				<div class="col-md-11">
					<div class="card-body">
						<div class="col text-end">
							<button type="button" class="btn btn-dark btn-sm">주문</button>
						</div>
						<h5 class="card-title">굿데이 건강한육포 닭가슴살 스틱 300g</h5>
						<div class="mx-100%">
							<hr />
							<p class="card-text">선택: 스틱</p>
							<div class="col text-end">
								<button type="button" class="btn btn-dark btn-sm">사용후기
									쓰기</button>
								<hr />
								<div class="container mt-3">
									<div class="d-flex">
										<div class="container-fluid d-flex justify-content-between">
											<span>판매가
												<div>배송비</div>
											</span> <span>8,450
												<div>선불</div>
											</span>
										</div>
										<div class="container-fluid d-flex justify-content-between">
											<span>수량
												<div>적립포인트</div>
											</span> <span>3
												<div>528</div>
											</span>
										</div>

									</div>
									<div
										class="container-fluid d-flex justify-content-between border bg-light p-2">
										<span>주문금액</span> <span>25,350</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="border border-2 container-fluid"></div>

		<div class="container-fluid border bg-light m-2 p-2">
			<div class="container-fluid d-flex justify-content-between p-2">
				<span>주문총액</span>
				<span>25,350원</span>
			</div>
			<div class="container-fluid d-flex justify-content-between p-2">
				<span>배송비</span>
				<span>2,500원</span>
			</div>
			<div class="container-fluid d-flex justify-content-between p-2">
				<span>적립포인트</span> <span>528점</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between p-2">
				<span class="fw-bold">총계</span> <span class="fw-bold">25,350원</span>
			</div>
		</div>
		<div class="mt-3 container-fluid">
			<h5>결제정보</h5>
			<hr />

			<div class="container-fluid d-flex justify-content-between">
				<span>주문번호</span> <span>2024041817582658</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>주문일시</span> <span>2024 04 18 17:59:05</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>결제방식</span> <span>2024 04 18 17:59:05</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>결제금액</span> <span>무통장</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>입금자명</span> <span>심영조</span>
			</div>
			<hr />
			<div class="container-fluid d-flex justify-content-between">
				<span>입금계좌</span> <span>농협은행 351 1037 2016 53(주)에이투젯(ATOZ)</span>
			</div>
			<hr />

			<div class="mt-4">
				<h5>주문하신 분</h5>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>이 름</span> <span>심영조</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>전화번호</span> <span>01028104870</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>핸드폰</span> <span>010 2810 4870</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>주소</span> <span>(22734)인천 서구 어쩌구 저쩌구 131, 200동
						400호(이리동, 중앙플스)</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>E-mail</span> <span>baboda@naver.com</span>
				</div>
				<hr />


			</div>

			<div class="mt-4">
				<h5>받으시는 분</h5>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>이 름</span> <span>심영조</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>전화번호</span> <span>01028104870</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>핸드폰</span> <span>010 2810 4870</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>주소</span> <span>(22734)인천 서구 어쩌구 저쩌구 131, 200동
						400호(이리동, 중앙플스)</span>
				</div>
				<hr />
			</div>

			<div class="mt-4">
				<h5>배송정보</h5>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>배송회사</span> <span>우체국 배송조회(문의전화: 1855-1300)</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>운송장번호</span> <span>6861581676379</span>
				</div>
				<hr />
				<div class="container-fluid d-flex justify-content-between">
					<span>배송일시</span> <span>2024-03-21 13:14:11</span>
				</div>
				<hr />
				<div class="mt-4">
					<h5>결제합계</h5>
					<div class="text-white">
						<div
							class="container-fluid d-flex justify-content-between mt-3 bg-secondary p-1">
							<span>총 구매액</span> <span>25,350원</span>
						</div>

						<div
							class="container-fluid d-flex justify-content-between bg-secondary mt-1 p-1">
							<span>미결제액</span> <span>25,350원</span>
						</div>

						<div
							class="container-fluid d-flex justify-content-between bg-secondary mt-1 p-1">
							<span>결제액</span> <span>0원</span>
						</div>
						<div class="mt-3">
							<div class="border border-2"></div>
							<div class="container-fluid d-flex justify-content-center mb-3">
							</div>
							<div class="container-fluid">
								<button type="button" class="btn w-100 mb-3">주문취소하기</button>
							</div>
							<input class="form-control mb-2" type="text"
								placeholder="취소사유를 적어주세요." aria-label="default input example">
							<button type="button" class="w-100 bg-secondary text-white">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>