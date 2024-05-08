package com.mycompany.javajavajo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.javajavajo.dto.Cart;
import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.security.Tm1UserDetails;
import com.mycompany.javajavajo.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartService service;
	
	//권우상 - 쇼핑카트 불러오기
	@RequestMapping("")
	public String shoppingCart(Authentication authentication, Model model) {
		//로그인한 유저의 Memno를 얻어옴
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    Member member = t1UserDetails.getMember();
	    
	    //멤버 번호에 해당하는 카트아이템을 불러와서 request범위로 저장
	    Cart cart = service.findCart(member.getMemno());
	    List<CartItem> cartItems = service.findCartItems(cart.getMemno());
	    model.addAttribute("cartItems", cartItems);
	
	    return "/cart/cart";
	}
	
	//권우상 - 카트아이템 수량 업데이트 컨트롤러
	@PostMapping("/update_cart")
	public void updateCart(Authentication authentication, int prodno, String operator) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    Member member = t1UserDetails.getMember();
	    int memno = member.getMemno();
		service.updateCart(memno, prodno, operator);
	}
	
	//권우상 - 카트아이템 삭제 컨트롤러
	@PostMapping("/delete_cart_items")
	public void deleteCartItems(Authentication authentication, @RequestParam(value="prodnos[]")int[] prodnos) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    Member member = t1UserDetails.getMember();
	    int memno = member.getMemno();
		service.deleteCartItems(memno, prodnos);
	}
}
