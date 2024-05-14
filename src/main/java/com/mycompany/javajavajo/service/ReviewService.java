package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.ReviewDao;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.Review;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	
	//권우상 - 새로운 리뷰 데이터를 데이터베이스에 삽입
	public int createReview(Review review) {
		int result = reviewDao.insert(review);
		return  result;
	}
	
	//황세림 - 메인 페이지에 리뷰 데이터 출력
	public List<Review> review() {
		List<Review> review = reviewDao.selectRecentReviews();
		return review;
	}



	
}
