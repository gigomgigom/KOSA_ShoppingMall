package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mycompany.javajavajo.dao.CartItemDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.ProductImgDao;
import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartService {

	@Autowired
	private CartItemDao cartItemDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductImgDao productImgDao;

	//권우상 - memno에 해당하는 cartItem 전부를 찾아옴
	public List<CartItem> findCartItems(int memno) {
		List<CartItem> cartItems = cartItemDao.selectByMemno(memno);
		for(CartItem cartItem : cartItems) {
			int prodno = cartItem.getProdno();
			Product product = productDao.selectByProdno(prodno);
			cartItem.setProduct(product);
		}
		
		return cartItems;
	}

	//권우상 - operator에 따라서  memeno와 prodno를 둘다 만족한는 cartitem에 "+"나 "-" 연산을 해준다 
	public int updateCart(int memno, int prodno, String operator) {
		int result = cartItemDao.updateCart(memno, prodno, operator);;
		return result;
	}
	
	//권우상 - memno에 해당하면서 prodnos안에 있는 prodno에 해당하는 cartitem을 전부 삭제한다
	public	int deleteCartItems(int memno, int[] prodnos) {
		int result = cartItemDao.deleteCartItems(memno, prodnos);
		return result;
	}
	
	// 신우호 - 회원번호를 사용하여 cartItem의 정보들을 불러옴
	public List<CartItem> getCartItemListByMemNo(int memNo) {
		return cartItemDao.selectByMemno(memNo);
	}
		
	// 신우호 - 상품번호를 사용해서 상품의 정보들을 불러옴
	public Product getproductByprodNo(int prodNo) {
		return cartItemDao.selectProductByprodNo(prodNo);
	}
		
	// 신우호 - 장바구니 카트 아이템 추가
	public int addCartItem(CartItem cartItem) {
		return cartItemDao.insertCartItem(cartItem);
	}
		
	// 신우호 - 장바구니 같은 아이템 추가 시 업데이트
	public int addQty(CartItem cartItem) {
		return cartItemDao.updateCartItem(cartItem);
	}	
}



