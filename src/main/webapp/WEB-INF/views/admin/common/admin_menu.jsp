<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-flex flex-column"
	style="height: 100vh; width: 250px; background-color: #9DB2BF;">
	<div class="d-flex justify-content-center align-items-center"
		style="height: 75px; background-color: #27374D;">
		<h4 class="m-0 text-white fw-bold">관리자 페이지</h4>
	</div>
	<div class="btn d-flex justify-content-center align-items-center"
		style="height: 52px" onclick="location.href='${pageContext.request.contextPath}/admin/main'">대쉬보드</div>
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button class="accordion-button ${menuNum==0 ? '' : 'collapsed'}" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="${menuNum==0}" aria-controls="collapseOne">
					<img
						src="${pageContext.request.contextPath}/resources/image/icon/member_icon.png"
						class="me-2" style="width: 20px;" /> 회원관리
				</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse ${menuNum==0?'show':''}"
				aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<div class="d-flex flex-column">
						<a class="btn row-1"
							href="move_nav_location?url=admin_member_view">회원조회</a>
						<a class="btn row-1">관리자
							계정 관리</a>
					</div>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTwo">
				<button class="accordion-button ${menuNum==1 ? '' : 'collapsed'}" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseTwo"
					aria-expanded="${menuNum==1}" aria-controls="collapseTwo">
					<img
						src="${pageContext.request.contextPath}/resources/image/icon/product_icon.png"
						class="me-2" style="width: 20px;" /> 상품관리
				</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse ${menuNum==1?'show':''}"
				aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<div class="d-flex flex-column">
						<a class="btn row-1" href="move_nav_location?url=product_list">상품 조회</a>
						<a class="btn row-1" onclick="openAddProduct()">상품 추가</a>
					</div>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingThree">
				<button class="accordion-button ${menuNum==2 ? '' : 'collapsed'}" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseThree"
					aria-expanded="${menuNum==2}" aria-controls="collapseThree">
					<img
						src="${pageContext.request.contextPath}/resources/image/icon/order_icon.png"
						class="me-2" style="width: 20px;" /> 주문관리
				</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse ${menuNum==2?'show':''}"
				aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<div class="d-flex flex-column">
						<a class="btn row-1" href="move_nav_location?url=uncom_order">주문 조회</a>
						<!-- <a class="btn row-1" href="move_nav_location?url=com_order"></a> -->
					</div>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingFour">
				<button class="accordion-button ${menuNum==3 ? '' : 'collapsed'}" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseFour"
					aria-expanded="${menuNum==3}" aria-controls="collapseFour">
					<img
						src="${pageContext.request.contextPath}/resources/image/icon/board_icon.png"
						class="me-2" style="width: 20px;" /> 게시판 관리
				</button>
			</h2>
			<div id="collapseFour" class="accordion-collapse collapse ${menuNum==3?'show':''}"
				aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<div class="d-flex flex-column">
						<a class="btn row-1" href="move_nav_location?url=qna_board">QA게시판</a>
						<button class="btn row-1">후기조회</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
