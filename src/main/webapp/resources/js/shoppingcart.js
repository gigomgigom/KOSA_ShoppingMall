const ul = document.querySelector("#shoppingcart").querySelector("ul");
const allCheckBtn = document.querySelector("#shoppingcart").querySelector("#allCheck");
const NOITEMIMG = "/javajavajo_mini_web/resources/image/nomorestuff.jpg"

const initialSet = data =>{
	if(!data.length){
		document.querySelector(".container-fluid").innerHTML = `<img src=${NOITEMIMG} class= \"w-75'\">`;       
	}else{
			let totalPrice = 0;
			for(let d of data){
				let newItem = document.createElement("li");
	            newItem.id = d.name;
	            newItem.className = "row border-top border-bottom m-0 py-1"
	            newItem.innerHTML = ` 
				<div class = "col-2 row border-end m-0 p-0">
					<div class="form-check col-2 d-flex justify-content-start align-items-center m-0 p-0">
						<input onclick="cancelAllCheck()" class="m-0" type="checkbox" style="accent-color: #273740;">
					</div>
					<div class="d-flex col-10 justify-content-center align-items-center p-0">
						<img  src="${d.img}" class="w-50" height="150">
					</div>
			   </div>
	            
	           	<div class="col-3 d-flex flex-column justify-content-center align-items-center border-end p-0">
	            	<p class="m-0 p-0">상품명</p>
	            	<a href="#" class="m-0 p-0 text-dark text-decoration-none">${d.name}</a>
	           	</div>
	            
	            <div class="col-3 row d-flex align-items-center border-end m-0 p-0">
	            	<div class="col-5 d-flex justify-content-end p-0">
	                	<button onclick="updateItemData(event,'-')" type="button" class="btn m-1 p-2 text-white" style="background-color: #273740">-</button>
	            	</div>
	            	<div class="col-2 text-center p-0">
	                	<p class="m-0 p-0">개수</p>
	                	<p class="m-0 p-0">${d.amount}개</p>
	            	</div>
	            	<div class="col-5 d-flex justify-content-start p-0">
	                	<button onclick="updateItemData(event,'+')" type="button" class="btn m-1 p-2 text-white" style="background-color: #273740">+</button>
	            	</div>
	            </div>
	            
	            <div class="col-2 d-flex flex-column justify-content-center align-items-center border-end p-0">
	            	<p class="m-0 p-0">단품 가격</p>
	            	<p class="m-0 p-0">${d.price}원</p>
	            </div>
	            
	            <div class="col-2 d-flex justify-content-center align-items-center p-0">
	            	<div class="w-75 text-white text-center" style="background-color: #273740">
	                <p class="m-0 p-0">총 액</p>
	                <p class="m-0 p-0">${d.price * d.amount}</p>
	            </div>
				`;
	        ul.appendChild(newItem)
			totalPrice += d.price * d.amount;
	        }
	        
			const resultBox = document.querySelector("#resultBox").children;
	 		resultBox[0].lastElementChild.textContent = totalPrice + "원";
			const deliveryPrice = (totalPrice>=100000) ? 0 : 3000;
	 		resultBox[1].lastElementChild.textContent = deliveryPrice + "원";
	 		resultBox[2].lastElementChild.textContent = totalPrice + deliveryPrice + "원";
	    }
	};

const allCheck = () =>{ 
	const lis = ul.querySelectorAll("li");
	for(let li of lis){
	    const cBox = li.querySelector("input");
	    cBox.checked = allCheckBtn.checked;
	}
};

const cancelAllCheck = () => {
	const lis = ul.querySelectorAll("li");
    if(allCheckBtn.checked === true){
        allCheckBtn.checked = false;
    }else{
		let checkedBox = 0;
		let all_box = 0;
		for(let li of lis){
			const cBox = li.querySelector("input");
			all_box += 1;
			checkedBox += (cBox.checked === true) ? 1 : 0;
			console.log(checkedBox,all_box)
		}
		if(checkedBox === all_box){
			allCheckBtn.checked = true;
		}
	}
};


const updateItemData = (event, operator) => {
    const item = event.target.parentElement.parentElement.parentElement;
	const itemName = item.id;
    const cols = item.children;
    const itemData = data.find(a=>a.name===itemName);

    if(operator === "+"){
        itemData.amount += 1
    }else if(operator === "-"){
        if(itemData.amount === 1){
            return;
        }else{
            itemData.amount -= 1;  
        }
    }

    cols[2].children[1].lastElementChild.textContent = itemData.amount + "개"
    cols[4].children[0].lastElementChild.textContent = itemData.price *  itemData.amount + "원";
    
	const resultBox = document.querySelector("#resultBox").children;
	totalPrice = (operator==="+") ? resultBox[0].lastElementChild.textContent.slice(0,-1)*1 + itemData.price : resultBox[0].lastElementChild.textContent.slice(0,-1)*1 - itemData.price;		
	resultBox[0].lastElementChild.textContent = totalPrice + "원";
	const deliveryPrice = (totalPrice>=100000) ? 0 : 3000;
	resultBox[1].lastElementChild.textContent = deliveryPrice + "원";
	resultBox[2].lastElementChild.textContent = totalPrice + deliveryPrice + "원";
}

const deleteSelect = () => {
    const lis = ul.querySelectorAll("li");
    
    for(let li of lis){
        const cBox = li.querySelector("input");
        if(cBox.checked === true){
            let itemName = li.id;
            data = data.filter(a => a.name !== itemName);
            li.remove();
        }
    }

    if(!ul.children.length){
        document.querySelector(".container-fluid").innerHTML = `<img src=${NOITEMIMG} class= \"w-75'\">`;       
    }

	let totalPrice = 0;
	for(let d of data){
	    totalPrice += d.price * d.amount;
	 }
	    
	const resultBox = document.querySelector("#resultBox").children;
	resultBox[0].lastElementChild.textContent = totalPrice + "원";
	const deliveryPrice = (totalPrice>=100000) ? 0 : 3000;
	resultBox[1].lastElementChild.textContent = deliveryPrice + "원";
	resultBox[2].lastElementChild.textContent = totalPrice + deliveryPrice + "원";


};


let data = [
    {img:"https://i.ibb.co/Sc0bSjY/dogicecream.jpg",name:"혀가 시려워 샤베트", price:30000, amount:1},
    {img:"https://i.ibb.co/f9yTBG2/doggum.png",name:"멍뭉이 쭈압쭈압 개껌", price:10000, amount:3},
    {img:"https://i.ibb.co/VNhrhcX/chickenbreast.jpg",name:"득근득근 웅장한 닭가슴살", price:20000, amount:2},
];

/*initialSet(data);*/


