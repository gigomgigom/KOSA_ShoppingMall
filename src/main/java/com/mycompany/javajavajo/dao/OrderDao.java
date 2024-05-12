package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Pager;

@Mapper
public interface OrderDao {
	//권우상 - 오더 데이터 삽입
	public int insert(Order order);
	
	//심영조 - memno를 통해 해당 회원의 주문내역을 불러온다.
	public List<Order> selectOrderByMemno(int memno); 

	//심영조 - ordno를 통해 해당 주문정보들을 받아온다.
	public Order selectOrderByOrdno(int ordno);
	
	//권우상 - 주문 번호와 주문 상태를 받아서 변경 한다
	public int updateOrdStts(@Param("ordno") int ordno, @Param("ordstts") int ordstts);

	//심영조 - 완료/취소가 되지않은 주문들의 수를 조회한다.
	public int getTotalUncomOrders();

	//심영조 - Pager에 따른 주문 데이터를 조회하라
	public List<Order> selectUncomOrderByPager(Pager pager);

}
