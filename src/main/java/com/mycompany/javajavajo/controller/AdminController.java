package com.mycompany.javajavajo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
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
	@RequestMapping("/admin_member_view")
	public String adminMemberView() {
		return "admin/admin_member_view";
	}
}
