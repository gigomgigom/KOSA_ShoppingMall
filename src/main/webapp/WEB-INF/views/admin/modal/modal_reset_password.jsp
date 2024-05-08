<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal fade" id="resetpw">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">비밀번호 초기화</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<h6>${member.memname}님의 비밀번호를 초기화하시겠습니까?</h6>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-info" onclick="resetPassword(${member.memno});">확인</button>
				<button type="button" class="btn" data-bs-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>