package com.mycompany.javajavajo.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {
	
	//Main페이지 이동 컨트롤러
	@RequestMapping("/main")
	public String adminMain(Model model) {
		model.addAttribute("menuNum", -1);
		return "admin/adminMain";
	}
	
	//회원관리 컨트롤러
	@GetMapping("/admin_member_view")
	public String adminMemberView(Model model) {
		model.addAttribute("menuNum", 0);
		return "admin/member/admin_member";
	}
	
	@RequestMapping("/member_detail")
	public String memberDetail(Model model) {
		model.addAttribute("menuNum", 0);
		return "admin/member/admin_member_detail";
	}
	
	//상품관리 컨트롤러
	@GetMapping("/product_list")
	public String productList(Model model) {
		model.addAttribute("menuNum", 1);
		return "admin/product/admin_product_list";
	}
	
	@GetMapping("/product_detail")
	public String productDetail(Model model) {
		model.addAttribute("menuNum", 1);
		return "admin/product/admin_product_detail";
	}
	
	@GetMapping("/add_product")
	public String addProduct(Model model) {
		model.addAttribute("menuNum", 1);
		return "admin/product/admin_add_product";
	}
	
	//주문관리 컨트롤러
	@GetMapping("/uncom_order")
	public String uncomOrder(Model model) {
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_uncom_order";
	}
	
	@GetMapping("/com_order")
	public String comOrder(Model model) {
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_com_order";
	}
	
	@GetMapping("/order_detail")
	public String orderDetail(Model model) {
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_order_detail";
	}
}
