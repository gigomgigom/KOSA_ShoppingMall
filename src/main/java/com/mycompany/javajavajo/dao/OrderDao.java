package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Order;

@Mapper
public interface OrderDao {
	//권우상 - 오더 데이터 삽입
	public int insert(Order order);

}
