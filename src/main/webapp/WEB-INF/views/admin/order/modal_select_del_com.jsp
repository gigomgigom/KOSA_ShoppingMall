<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<form>
					<label for="selcom"></label> <select class="form-control my-4"
						id="selcom" name="comno">
						<option value="0">CJ대한통운</option>
						<option value="1">우체국택배</option>
						<option value="2">한진택배</option>
					</select>
					<div class="form-group my-4">
						<label for="trackingNum">운송장번호</label> <input type="text"
							class="form-control" id="trackingNum" name="trckno">
					</div>
				</form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
				<button type="button" class="btn" data-bs-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>