<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">운송장 정보 입력</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div>
					<label for="selcom"></label> <select class="form-control my-4"
						id="selcom" name="comno">
						<c:forEach var="delCom" items="${orderInfoMap.delComList}">
							<option value="${delCom.comno}">${delCom.comname}</option>
						</c:forEach>
					</select>
					<div class="form-group my-4">
						<label for="trackingNum">운송장번호</label> <input type="text"
							class="form-control" id="trackingNum" name="trckno">
					</div>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
				<button type="button" class="btn" data-bs-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>