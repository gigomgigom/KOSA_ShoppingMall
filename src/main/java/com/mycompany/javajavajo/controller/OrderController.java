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
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Orderer;
import com.mycompany.javajavajo.dto.PointDtl;
import com.mycompany.javajavajo.dto.Recipient;
import com.mycompany.javajavajo.security.Tm1UserDetails;
import com.mycompany.javajavajo.service.AdminService;
import com.mycompany.javajavajo.service.CartService;
import com.mycompany.javajavajo.service.MemberService;
import com.mycompany.javajavajo.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private AdminService adminService;
	
	//오더 폼 정보 불러오는 곳 - 권우상
	@PostMapping("/order_form")
	public String orderForm(int itemsPrice, int deliveryPrice, Authentication authentication, Model model) {
		model.addAttribute("itemsPrice", itemsPrice);
		model.addAttribute("deliveryPrice", deliveryPrice);
		
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    int memno = t1UserDetails.getMember().getMemno();
	    Member member = adminService.getMemberByMemno(memno);
		model.addAttribute("member", member);
		
		List<CartItem> cartItemList = cartService.findCartItems(memno);
		model.addAttribute("cartItemList", cartItemList);
				
		MemberAdr memberAdr = memberService.getMemberAdr(memno);
		model.addAttribute("memberAdr", memberAdr);
		
		return "order/orderForm";
	}
	
	//주문서 작성 - 권우상
	@PostMapping("/create_order")
	public String createOrder(Order order, Orderer orderer, Recipient recipient, Authentication authentication) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    Member member = t1UserDetails.getMember();
	    int memno = member.getMemno();
		
		orderService.createOrder(memno, order, orderer,recipient);
		
		return "redirect:/order/order_detail";
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
