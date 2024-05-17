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
    
    if(qtyItem === 1 && operator === "-"){
    	return
    }
    
	let params = {prodno,operator};
	
	$.ajax({
		url:"/javajavajo_mini_web/cart/update_cart",
		method:"post",
		data: params,
		success: function(data){
			if(data["result"] == "success"){
				if(operator === "+"){
			        qtyItemElement.innerText = (qtyItem + 1) + "개";
			        totalPriceItemElement.innerText = (totalPriceItem + priceItem) + "원";
			    }else if(operator === "-"){
			         qtyItemElement.innerText = (qtyItem - 1) + "개";
			         totalPriceItemElement.innerText = (totalPriceItem - priceItem) + "원";
			    }
			    resultBoxUpdate();
			}
		}
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
        }
    }
    
    if(!prodnos.length){
    	return;
    }else{
    	let params ={prodnos}
    	$.ajax({
    		url:"/javajavajo_mini_web/cart/delete_cart_items",
    		method:"post",
    		data: params,
    		success: function(data){
    			if(data["result"] == "success"){
    				const ul = document.querySelector("#cartItemList");
    
    				for(let prodno of prodnos){
    						li = ul.querySelector("#item" + prodno);
    						li.remove();
    					}
    			    
    				if(!ul.children.length){
    			        document.querySelector("#shoppingcart").innerHTML = `<img src=${NOITEMIMG} class= \"w-75'\">`;
    			        return
    			    }
    				
    			    resultBoxUpdate();
    			}
    		}
    	});
    }
};

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
	const inputItemsPriceElement = resultBoxElement.querySelector("#inputItemsPrice")
	const deliveryPriceElement = resultBoxElement.querySelector("#deliveryPrice");
	const inputDeliveryPriceElement = resultBoxElement.querySelector("#inputDeliveryPrice");
	const resultPriceElement = resultBoxElement.querySelector("#resultPrice");
	
	
	
	itemsPriceElement.innerText = itemsPrice + "원";
	inputItemsPriceElement.value = itemsPrice;
	const deliveryPrice = (itemsPrice >= 100000)?  0  : 3000;
	inputDeliveryPriceElement.value = deliveryPrice;
	deliveryPriceElement.innerText = deliveryPrice + "원";
	resultPriceElement.innerText = itemsPrice + deliveryPrice + "원";
}



if(!ul.children.length){
    document.querySelector("#shoppingcart").innerHTML = `<img src=${NOITEMIMG} class= \"w-75'\">`;
}else{
	resultBoxUpdate();
}



