<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 포인트 내역 모달창 -->
<div class="modal" id="myModal">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">후기 남기기</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<!-- 후기 추가 매핑메소드 구현하고 action에서 요청 경로 작성 -->
				<form method="post" id="writeReview" action="">
					<div class="form-group">
						<label for="review-title" class="col-form-label">제목:</label> <input
							type="text" class="form-control" id="review-title" name="rvtitle">
					</div>
					<div class="form-group">
						<label for="review-content" class="col-form-label">작성 내용:</label>
						<textarea class="form-control" id="review-content"
							name="rvcontent"></textarea>
					</div>
					<div class="form-check mt-5">
						<input class="form-check-input" type="radio" name="rvrating" id="onestar" value=1> 
						<label class="form-check-label" for="onestar">⭐</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="rvrating" id="twostar" value=2> 
						<label class="form-check-label" for="twostar">⭐⭐</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="rvrating" id="twostar" value=3> 
						<label class="form-check-label" for="twostar">⭐⭐⭐</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="rvrating" id="fourstar" value=4> 
						<label class="form-check-label" for="fourstar">⭐⭐⭐⭐</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="rvrating" id="fivestar" value=5 checked> 
						<label class="form-check-label" for="fivestar">⭐⭐⭐⭐⭐</label>
					</div>
				</form>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="submit" form="writeReview" class="btn btn-danger" data-bs-dismiss="modal">제출하기</button>
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>