package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.CartItem;

@Mapper
public interface CartItemDao {

	List<CartItem> selectByMemno(int memno);

}
