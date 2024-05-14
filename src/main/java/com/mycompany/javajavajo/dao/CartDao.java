package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Cart;

@Mapper
public interface CartDao {
	public int insert(int memno);

	public Cart selectByMemno(int memno);

	public List<Cart> selectByMemNo(int memNo);

	
	
	 
	
}
