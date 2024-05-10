package com.mycompany.javajavajo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;
import com.mycompany.javajavajo.dto.OrdProd;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Orderer;
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

	// 오더 폼 정보 불러오는 곳 - 권우상
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

	// 권우상 - 주문 데이터를 데이터 베이스에 등록
	@PostMapping("/create_order")
	public String createOrder(Order order, Orderer orderer, Recipient recipient, Authentication authentication) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
		Member member = t1UserDetails.getMember();
		int memno = member.getMemno();

		orderService.createOrder(memno, order, orderer, recipient);

		return "redirect:/order/order_detail?ordno=" + order.getOrdno();
	}

	// 권우상 - 주문 상세 페이지
	@RequestMapping("/order_detail")
	public String orderDetail(int ordno, Model model) {
		Order order = orderService.getOrderByOrdno(ordno);
		List<OrdProd> ordProdList = orderService.getOrdProdListByOrdno(ordno);
		Orderer orderer = orderService.getOrdererByOrdno(ordno);
		Recipient recipient = orderService.getRecipientByOrdno(ordno);

		model.addAttribute("order", order);
		model.addAttribute("ordProdList", ordProdList);
		model.addAttribute("orderer", orderer);
		model.addAttribute("recipient", recipient);

		return "order/orderDetail";
	}

	@RequestMapping("/order_history")
	// 신우호 - 인증된 객체 확인 
	public String orderHistory(Model model, Authentication authentication) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
		int memno = t1UserDetails.getMember().getMemno();
		// memno를 통해 order정보를 얻어옴
		List<Order> orderList = orderService.getOrderListByMemno(memno);
		log.info("" + memno);
		// order 정보가 제대로 얻어와졌는지 확인
		for (Order order : orderList) {
			log.info("" + order);
			// 신우호 - ordProdList에서 order을 통해 order안의 orderNo를 얻음,(상품이름 얻기) 
			List<OrdProd> ordProdList = orderService.getOrdProdListByOrdno(order.getOrdno());
			for(OrdProd ordProd : ordProdList) {
				log.info("" + ordProd);
			}
			model.addAttribute("ordProdList", ordProdList);
		}

		model.addAttribute("orderList", orderList);

		return "order/orderHistory";
	}

	//권우상 - 주문 취소
	@GetMapping("cancel_order")
	public String cancelOrder(int ordno) {
		String ordstts = "주문 취소";
		int reuslt = orderService.changeOrdStts(ordno, ordstts);
		return "redirect:/order/order_detail?ordno=" + ordno;
	}
}
