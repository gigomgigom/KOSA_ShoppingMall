package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.CartDao;
import com.mycompany.javajavajo.dao.CartItemDao;
import com.mycompany.javajavajo.dto.Cart;
import com.mycompany.javajavajo.dto.CartItem;

@Service
public class cartService {
	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartItemDao cartItemDao;
	
	public Cart findCart(int memno) {
		Cart cart = cartDao.selectByMemno(memno);
		if(cart == null) {
			cartDao.insert(memno);
			cart = cartDao.selectByMemno(memno);
		}
		return cart;
	}
	
	public List<CartItem> findCartItems(int memno) {
		List<CartItem> cartItems = cartItemDao.selectByMemno(memno);
		return cartItems;
	}

}
