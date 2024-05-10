<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
                  <tr>
                     <th scope="row">1</th>
                     <td>2024-04-27</td>
                     <td>사용</td>
                     <td>1000</td>
                  </tr>
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