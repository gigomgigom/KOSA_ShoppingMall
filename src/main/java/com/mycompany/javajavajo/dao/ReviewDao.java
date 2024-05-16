package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.Review;

@Mapper
public interface ReviewDao {

	int insert(Review review);

	int count(@Param("ordno") int ordno, @Param("prodno") int prodno);

	//메인 페이지에 리뷰를 가져오기 위함
	public List<Review> selectRecentReviews();


	List<Review> selectReviewListByProdNo(int prodno);

	Review selectReviewByProdNo(int prodno);

}
