package com.mycompany.javajavajo.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/auth")
public class AuthController {
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping("/signup")
	public String signUp() {
		log.info("회원가입 실행");
		return "auth/signup";
	}
	
	@RequestMapping("/signin")
	public String signIn() {
		log.info("로그인 실행");
		return "auth/signin";
	}
	
	@GetMapping("/auth/signup")
	public String singup() {
		return "auth/signin";
	}
	
	@PostMapping("/auth")
	public String auth(Member member) {
		service.auth(member);
		return "redirect:/auth/signin";
	}
	
}
