package com.mycompany.javajavajo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;
import com.mycompany.javajavajo.security.Tm1UserDetails;
import com.mycompany.javajavajo.service.CartService;
import com.mycompany.javajavajo.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService memberservice;
	
	//오더 폼 정보 불러오는 곳 - 권우상
	@PostMapping("/order_form")
	public String orderForm(int itemsPrice, int deliveryPrice, Authentication authentication, Model model) {
		model.addAttribute("itemsPrice", itemsPrice);
		model.addAttribute("deliveryPrice", deliveryPrice);
		
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    Member member = t1UserDetails.getMember();
		model.addAttribute("member", member);
		
	    int memno = member.getMemno();
		List<CartItem> cartItemList = cartService.findCartItems(memno);
		model.addAttribute("cartItemList", cartItemList);
				
		MemberAdr memberAdr = memberservice.getMemberAdr(memno);
		model.addAttribute("memberAdr", memberAdr);
		
		return "order/orderForm";
	}
	
	@RequestMapping("/order_detail")
	public String orderDetail() {
		return "order/orderDetail";
	}
	
	@RequestMapping("/order_history")
	public String orderHistory() {
		return "order/orderHistory";
	}
}
