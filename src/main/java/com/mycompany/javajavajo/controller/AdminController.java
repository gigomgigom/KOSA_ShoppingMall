package com.mycompany.javajavajo.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/main")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/admin_dashboard")
	public String adminDashBoard() {
		return "admin/admin_dashboard";
	}
	
	@GetMapping("/admin_member_view")
	public String adminMemberView() {
		return "admin/admin_member";
	}
	
	@RequestMapping("/member_detail")
	public String memberDetail() {
		return "admin/admin_member_detail";
	}
	
	@GetMapping("/add_product")
	public String addProduct() {
		return "admin/admin_add_product";
	}
}
