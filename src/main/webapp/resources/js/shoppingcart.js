const ul = document.querySelector("#shoppingcart").querySelector("ul");
const allCheckBtn = document.querySelector("#shoppingcart").querySelector("#allCheck");
const NOITEMIMG = "/javajavajo_mini_web/resources/image/nomorestuff.jpg"

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
		}
		if(checkedBox === all_box){
			allCheckBtn.checked = true;
		}
	}
};

const updateItemData = (prodno, operator) => {
    const itemElement = ul.querySelector(`#item${prodno}`);
	const qtyItemElement = itemElement.querySelector(`#qty${prodno}`);
    const priceItemElement = itemElement.querySelector(`#price${prodno}`);
    const totalPriceItemElement = itemElement.querySelector(`#totalPrice${prodno}`);
    
    let qtyItem = qtyItemElement.innerText.slice(0,-1) * 1;
    let priceItem = priceItemElement.innerText.slice(0,-1) * 1;
    let totalPriceItem = totalPriceItemElement.innerText.slice(0,-1) * 1;
    
    if(operator === "+"){
        qtyItemElement.innerText = (qtyItem + 1) + "개";
        totalPriceItemElement.innerText = (totalPriceItem + priceItem) + "원";
    }else if(operator === "-"){
        if(qtyItem === 1){
            return;
        }else{
            qtyItemElement.innerText = (qtyItem - 1) + "개";
            totalPriceItemElement.innerText = (totalPriceItem - priceItem) + "원";
        }
    }
    
    resultBoxUpdate();
    
	let params = {prodno,operator};
	
	$.ajax({
		url:"shoppingcart/updateCart",
		method:"post",
		data: params,
	});
};

const deleteSelect = () => {
    const lis = ul.querySelectorAll("li");
    const prodnos = [];
    
    for(let li of lis){
        const cBox = li.querySelector("input");
        if(cBox.checked === true){
        	const prodno = li.id.slice(4) *1 ; 
        	prodnos.push(prodno)
        	li.remove();
        }
    }
    
    if(!prodnos.length){
    	return;
    }else{
    	let params ={prodnos}
    	$.ajax({
    		url:"shoppingcart/deleteCartItems",
    		method:"post",
    		data: params,
    	});
    }
    
    if(!ul.children.length){
        document.querySelector("#shoppingcart").innerHTML = `<img src=${NOITEMIMG} class= \"w-75'\">`;
        return
    }
    
    resultBoxUpdate();
}

const resultBoxUpdate = () => {
	let itemsPrice = 0;
	const lis = ul.querySelectorAll("li");
	for(let li of lis){
		const prodno = li.id.slice(4) *1 ;
		const totalPriceItemElement = li.querySelector(`#totalPrice${prodno}`);
		const totalPriceItem = totalPriceItemElement.innerText.slice(0,-1) * 1;
		
		itemsPrice += totalPriceItem;	
	}
	
	const resultBoxElement = document.querySelector("#resultBox");
	const itemsPriceElement = resultBoxElement.querySelector("#itemsPrice");
	const deliveryPriceElement = resultBoxElement.querySelector("#deliveryPrice");
	const resultPriceElement = resultBoxElement.querySelector("#resultPrice");
	
	itemsPriceElement.innerText = itemsPrice + "원";
	const deliveryPrice = (itemsPrice >= 100000)?  0  : 3000;
	deliveryPriceElement.innerText = deliveryPrice + "원";
	resultPriceElement.innerText = itemsPrice + deliveryPrice + "원";
}



if(!ul.children.length){
    document.querySelector("#shoppingcart").innerHTML = `<img src=${NOITEMIMG} class= \"w-75'\">`;
}
resultBoxUpdate();


