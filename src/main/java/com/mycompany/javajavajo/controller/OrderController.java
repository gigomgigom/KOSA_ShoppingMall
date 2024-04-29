package com.mycompany.javajavajo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/order")
public class OrderController {
	
	@RequestMapping("/order_form")
	public String orderForm() {
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
