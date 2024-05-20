package com.mycompany.javajavajo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Delivery;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;
import com.mycompany.javajavajo.dto.OrdProd;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.OrderList;
import com.mycompany.javajavajo.dto.Orderer;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.Recipient;
import com.mycompany.javajavajo.security.Tm1UserDetails;
import com.mycompany.javajavajo.service.AdminService;
import com.mycompany.javajavajo.service.CartService;
import com.mycompany.javajavajo.service.MemberService;
import com.mycompany.javajavajo.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Secured("ROLE_USER")
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
	
	// 신우호 - 바로구매 시  오더 폼으로 바로 이동 
	@PostMapping("/direct")
	public String direct(Authentication authentication, Model model, int prodno, int qty) {
		String mid = authentication.getName();
		Member member = memberService.getMemberByMid(mid);
		int memno = member.getMemno();
		MemberAdr memberAdr = memberService.getMemberAdr(memno);
		Product product = orderService.getProductByProdNo(prodno);
		model.addAttribute("memberAdr", memberAdr);
		model.addAttribute("member", member);
		model.addAttribute("product", product);
		model.addAttribute("qty", qty);
		return "order/orderDirect";
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
	
	// 권우상 - 바로 구매로 주문시 주문 관련 테이블을 작성하는 메소드
	@PostMapping("/create_order_direct")
	public String createOrderDirect(int prodno,int qty,Order order, Orderer orderer, Recipient recipient, Authentication authentication) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
		Member member = t1UserDetails.getMember();
		int memno = member.getMemno();
		orderService.createOrderDirect(memno, order, orderer, recipient,prodno, qty);
		return "redirect:/order/order_detail?ordno=" + order.getOrdno();
	}

	// 권우상 - 주문 상세 페이지
	@RequestMapping("/order_detail")
	public String orderDetail(int ordno, Model model) {
		Order order = orderService.getOrderByOrdno(ordno);
		List<OrdProd> ordProdList = orderService.getOrdProdListByOrdno(ordno);
		Orderer orderer = orderService.getOrdererByOrdno(ordno);
		Recipient recipient = orderService.getRecipientByOrdno(ordno);
		Delivery delivery = orderService.getDelivery(ordno);
		model.addAttribute("order", order);
		model.addAttribute("ordProdList", ordProdList);
		model.addAttribute("orderer", orderer);
		model.addAttribute("recipient", recipient);
		model.addAttribute("delivery",	delivery);
		
		
		return "order/orderDetail";
	}
	
	
	// 신우호 - 주문 내역 페이지
	@RequestMapping("/order_history")
	public String orderHistory(Model model, Authentication authentication) {
		// 인증된 객체를 확인한다.
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
		int memNo = t1UserDetails.getMember().getMemno();
		// orderDtoList를 선언한다.
		List<OrderList> orderDtoList = new ArrayList<>();
		// 해당 유저의 주문목록을 돌려준다.
		List<Order> orderList = orderService.getOrderListByMemno(memNo);
		// orderList Null Check
		if(orderList != null) {
			for(Order order : orderList) {
				// 주문한건에 대한 주문상품 목록을 돌려준다.
				List<OrdProd> ordProdList = orderService.getOrdProdListByOrdno(order.getOrdno());
				if(ordProdList.size() != 0) {
					// 주문건에 대한 주문상품 갯수를 돌려준다. 상품명 외 몇건 이기 때문에 -1을 해줘야한다.
					int ordCount = ordProdList.size() - 1;
					// OrderList DTO 객체를 생성한다.
					OrderList orderListDto = new OrderList();
					orderListDto.setOrdNo(order.getOrdno());
					orderListDto.setProdName(ordProdList.get(0).getProdname());
					orderListDto.setTotalPrice(order.getFinprice());
					orderListDto.setOrdDate(order.getOrddate());
					orderListDto.setProdCnt(ordCount);
					int ordSttsNum = order.getOrdstts();
					if(ordSttsNum == 1) {
						orderListDto.setProdStatus("주문");
					}else if(ordSttsNum == 2) {
						orderListDto.setProdStatus("입금");
					}else if(ordSttsNum == 3) {
						orderListDto.setProdStatus("배송");
					}else if(ordSttsNum == 4) {
						orderListDto.setProdStatus("완료");
					}else if(ordSttsNum == 5) {
						orderListDto.setProdStatus("취소");
					}
					orderDtoList.add(orderListDto); // orderDto 객체를 넣어준다.
				}
			}
			model.addAttribute("orderList", orderDtoList);
		}
		return "order/orderHistory";
	}

	//권우상 - 주문 취소
	@GetMapping("cancel_order")
	public String cancelOrder(int ordno, Authentication authentication) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
		int memno = t1UserDetails.getMember().getMemno();
		int reuslt = orderService.cancelOrder(memno,ordno);
		return "redirect:/order/order_detail?ordno=" + ordno;
	}
	
	//권우상 - 수령확인 눌렀을 시 작동하는 메소드
	@PostMapping("complete_order")
	public String completeOrder(int ordno,int amount,Authentication authentication) {
		log.info("실행1");
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
		int memno = t1UserDetails.getMember().getMemno();
		int reuslt = orderService.completeOrder(memno,ordno,amount);
		return "redirect:/order/order_detail?ordno=" + ordno;
	}
	
	
	
	
}
