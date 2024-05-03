package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Cart;

@Mapper
public interface CartDao {
	public int insert(int memno);

	public Cart selectByMemno(int memno);
}
