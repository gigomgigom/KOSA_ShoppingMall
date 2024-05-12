package com.mycompany.javajavajo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class HomeController {
	@RequestMapping("")
	public String index() {
		log.info("실행");
		return "home";
	}
	
	//황세림 - 마이페이지에서 로그아웃 버튼 클릭시 로그인 페이지로 전환
	@RequestMapping("/auth")
	public String logout() {
		return "/signin";
	}
}
