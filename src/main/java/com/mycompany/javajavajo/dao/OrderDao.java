package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Order;

@Mapper
public interface OrderDao {
	//권우상 - 오더 데이터 삽입
	public int insert(Order order);
	
	//심영조 - memno를 통해 해당 회원의 주문내역을 불러온다.
	public List<Order> selectOrderByMemno(int memno);

	//심영조 - ordno를 통해 해당 주문정보들을 받아온다.
	public Order selectOrderByOrdno(int ordno);

}
