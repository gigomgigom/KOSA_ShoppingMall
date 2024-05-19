const replyArea = document.querySelector("#replyArea");
let existReply = replyArea.querySelector("p").innerText;
const writeReply = () =>
	{	
		replyArea.innerHTML= `
			<textarea id='content' name="qnacontent" class="form-control w-75 m-0 mb-5 p-0  border border-2 border-secondary-subtle w-100"
			rows="5" placeholder="답변을 입력해주세요"></textarea>
			<div class="d-flex w-75 justify-content-center align-items-center m-0 mb-5 p-0">
			<a onclick="saveReply()" class="btn btn-sm border border-secondary-subtle m-0 me-3 p-0">저장</a>
			<a onclick="cancelWriteReply()" class="btn btn-sm border border-secondary-subtle m-0 p-0">취소</a>
			<div/>
		`;
	}
	
const cancelWriteReply = () =>{
	replyArea.innerHTML= `
	<div class="d-flex flex-column justify-content-center align-items-start border border-2 border-secondary-subtle w-100  m-0 mb-5 p-0"
		style="position: relative;">
		<span class="m-0  px-3 py-2 rounded-pill text-center"
			style="color: white; background-color: #27374D; position: absolute; top: -10%; left: -1%;">답변
		대기 중입니다</span>
		<p class="m-0 px-3 py-5">
			답변이 없습니다 <br /> <br />없다니까요 <br />없어요 없어 <br />돌아가요
		</p>
	</div>
	<div class="d-flex justify-content-center align-items-center w-100 m-0 mb-5 p-0 px-5" >
		<a onclick="writeReply()" class="btn" style="background-color: #273740; color: white">답변달기</a>
	</div>
	`;
}

const saveReply = () =>{
	const reply = replyArea.querySelector("textarea").value;
	const qnano = document.querySelector("#qnano").value;
	const rplysts = document.querySelector("#rplysts")
	const params = {qnano,reply};
	console.log(params);
	$.ajax({
		url:"write_reply",
		method:"post",
		data: params,
		success: function(data){
				if(data["result"] == "success"){
					replyArea.innerHTML = `
						<div class="d-flex flex-column justify-content-center align-items-start border border-2 border-secondary-subtle w-100  m-0 mb-5 p-0"
						style="position: relative;">
						<span class="m-0  px-3 py-2 rounded-pill text-center"
							style="color: white; background-color: #27374D; position: absolute; top: -10%; left: -1%;">관리자의 답변</span>
						<p class="m-0 px-3 py-5">
							
						</p>
					</div>
					<div class="d-flex justify-content-center align-items-center w-100 m-0 mb-5 p-0 px-5" >
						<a onclick="editReply()" class="btn" style="background-color: #273740; color: white">수정하기</a>
					</div>
					`;
					
					rplysts.innerHTML = `상태: 
						<span class="badge rounded-pill"
						style="background-color: #273740; color: white">완료</span>
					`;
					replyArea.querySelector("p").innerHTML= reply;
					existReply = reply;
				}
			}
		});
};

const editReply = () => {

	replyArea.innerHTML = `
		<textarea id='content' name="qnacontent" class="form-control w-75 m-0 mb-5 p-0  border border-2 border-secondary-subtle w-100"
		rows="5">${existReply}</textarea>
		<div class="d-flex w-75 justify-content-center align-items-center m-0 mb-5 p-0">
		<a onclick="saveEditReply()" class="btn btn-sm border border-secondary-subtle m-0 me-3 p-0">수정</a>
		<a onclick="cancelEditReply()" class="btn btn-sm border border-secondary-subtle m-0 p-0">취소</a>
		<div/>
	`;
};

const cancelEditReply = () =>{
	
	replyArea.innerHTML= `
		<div class="d-flex flex-column justify-content-center align-items-start border border-2 border-secondary-subtle w-100  m-0 mb-5 p-0"
			style="position: relative;">
			<span class="m-0  px-3 py-2 rounded-pill text-center"
				style="color: white; background-color: #27374D; position: absolute; top: -10%; left: -1%;">관리자의
			답변</span>
			<p class="m-0 px-3 py-5">
				${existReply}
			</p>
		</div>
		<div class="d-flex justify-content-center align-items-center w-100 m-0 mb-5 p-0 px-5" >
			<a onclick="editReply()" class="btn" style="background-color: #273740; color: white">수정하기</a>
		</div>
		`;
}

const saveEditReply = () =>{
	const reply = replyArea.querySelector("textarea").value;
	const qnano = document.querySelector("#qnano").value;
	const params = {qnano,reply};
	console.log(params);
	$.ajax({
		url:"edit_reply",
		method:"post",
		data: params,
		success: function(data){
				if(data["result"] == "success"){
					replyArea.innerHTML = `
						<div class="d-flex flex-column justify-content-center align-items-start border border-2 border-secondary-subtle w-100  m-0 mb-5 p-0"
						style="position: relative;">
						<span class="m-0  px-3 py-2 rounded-pill text-center"
							style="color: white; background-color: #27374D; position: absolute; top: -10%; left: -1%;">관리자의 답변</span>
						<p class="m-0 px-3 py-5">
							
						</p>
					</div>
					<div class="d-flex justify-content-center align-items-center w-100 m-0 mb-5 p-0 px-5" >
						<a onclick="editReply()" class="btn" style="background-color: #273740; color: white">수정하기</a>
					</div>
					`;
					replyArea.querySelector("p").innerHTML= reply;
					existReply = reply;
				}
			}
		});
}




