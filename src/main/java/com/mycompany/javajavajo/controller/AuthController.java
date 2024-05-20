package com.mycompany.javajavajo.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;
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
	
	//신우호 - member, memberAdr 매개변수로 받아 서비스 호출하여 로직처리 함
	@PostMapping("/auth")
	public String auth(Member member, MemberAdr memberadr) {
		service.auth(member, memberadr);
		log.info(memberadr.getAdr());
		return "redirect:/auth/signin";
	}
	
	
	
}
