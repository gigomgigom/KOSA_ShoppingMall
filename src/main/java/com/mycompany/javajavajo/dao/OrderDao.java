package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Order;

@Mapper
public interface OrderDao {

	public int insert(Order order);

}
