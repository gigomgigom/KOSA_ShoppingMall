package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.Review;

@Mapper
public interface ReviewDao {

	int insert(Review review);

	int count(@Param("ordno") int ordno, @Param("prodno") int prodno);

	int select(Review review);

	Review getReviewByProdno(int prodno);

	

	

}
