<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 포인트 내역 모달창 -->
<div class="modal" id="myModal">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">포인트 사용내역</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">주문번호</th>
							<th scope="col">일자</th>
							<th scope="col">포인트 적립/사용</th>
							<th scope="col">금액</th>
						</tr>
					</thead>
					<tbody>
						 <c:forEach var="point" items="${pointDtlList}">
							<tr>
								<th scope="row">${point.ordno}</th>
								<td><fmt:formatDate value="${point.date}" pattern="yyyy-MM-dd" /></td>
								<td>${point.actionStr}</td>
								<td>${point.amount}</td>
								
							</tr>
						</c:forEach> 

						

					</tbody>
				</table>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>