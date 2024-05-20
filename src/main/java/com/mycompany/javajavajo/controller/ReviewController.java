package com.mycompany.javajavajo.controller;



import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.javajavajo.dto.Review;
import com.mycompany.javajavajo.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

	//권우상 - 상품 상세 페이지에서 리뷰를 등록 
	@PostMapping(value="/write_review", produces="application/json; charset=UTF-8")
	@ResponseBody()
	public String writeReview(Review review) {
		int result = reviewService.createReview(review);
		String jsonResult = (result > 0) ? "success" : "fail";
		JSONObject jo = new JSONObject();
		jo.put("result", jsonResult);
		return jo.toString();
	}
}
