package com.mycompany.javajavajo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.Review;
import com.mycompany.javajavajo.service.ItemService;
import com.mycompany.javajavajo.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
	ReviewService reviewService;
	@Autowired
	ItemService itemService;
	
	//권우상 - 메인페이지 메소드
	@RequestMapping("")
	public String reviewRespone(Model model) {
		//권우상 - 주문 건수 기준으로(count)가장 높은 수치를 기록한 상품 4개를 불러옴
		List<Product> prodList= itemService.getBestProduct();
		List<Review> review = new ArrayList<>();
		review = reviewService.review();
		
		model.addAttribute("prodList", prodList);
		model.addAttribute("review", review);
		log.info("실행");
		return "home";
	}
	
	//황세림 - 마이페이지에서 로그아웃 버튼 클릭시 로그인 페이지로 전환
	@RequestMapping("/auth")
	public String logout() {
		return "/signin";
	}
	
}
