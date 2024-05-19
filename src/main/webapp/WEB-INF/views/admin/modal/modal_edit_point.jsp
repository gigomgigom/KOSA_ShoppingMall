<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="modal fade" id="pointModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">포인트 수정</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form id="point" method="post" action="edit_point">
					<input type="hidden" value="${member.memno}" name="memno">
					<h6>${member.memname}님의잔여 포인트 : <fmt:formatNumber value="${member.mempoint}" pattern="#,###" /></h6>
					<input type="number" class="form-control" value="${member.mempoint}" name="mempoint">
				</form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="submit" form="point" class="btn btn-info">확인</button>
				<button type="button" class="btn" data-bs-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>