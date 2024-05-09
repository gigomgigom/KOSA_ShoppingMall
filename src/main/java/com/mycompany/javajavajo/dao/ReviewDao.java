package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Review;

@Mapper
public interface ReviewDao {

	int insert(Review review);

}
