package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.CartDao;
import com.mycompany.javajavajo.dao.CartItemDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.ProductImgDao;
import com.mycompany.javajavajo.dto.Cart;
import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;

@Service
public class CartService {
	@Autowired
	private CartDao cartDao;
	@Autowired
	private CartItemDao cartItemDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductImgDao productImgDao;

	
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
		for(CartItem cartItem : cartItems) {
			int prodno = cartItem.getProdno();
			Product product = productDao.selectByProdno(prodno);
			ProductImg productImg = productImgDao.selectByProdno(prodno);
			product.setProductImg(productImg);
			cartItem.setProduct(product);
		}
		
		return cartItems;
	}

}
