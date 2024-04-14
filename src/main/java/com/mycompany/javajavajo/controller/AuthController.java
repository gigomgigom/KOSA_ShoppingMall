package com.mycompany.javajavajo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/auth")
public class AuthController {
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
}
