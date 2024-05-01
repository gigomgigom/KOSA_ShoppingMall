package com.mycompany.javajavajo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shoppingcart")
public class ShoppingCartController {
	@RequestMapping("")
	public String shoppingCart() {
		log.info("모달 창 띄우면서 기능 호출");
		return "/shoppingcart/shoppingcart";
	}
}
