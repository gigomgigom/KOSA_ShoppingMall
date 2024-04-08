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
		log.info("실행2");
		log.info("실행3");
		log.info("실행4");
		return "home";
	}
}
