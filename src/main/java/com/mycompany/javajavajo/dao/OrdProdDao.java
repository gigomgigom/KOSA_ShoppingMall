package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.OrdProd;
import com.mycompany.javajavajo.dto.Order;

@Mapper
public interface OrdProdDao {
	//ordProd 데이터 삽입
	public int insert(OrdProd ordProd);
	
	//심영조-OrdProd(주문상품)테이블에서 주문번호에 해당하는 총 구매상품수와 구매상품들중 하나의 상품번호를 가져온다.
	public Order selectOutlineOfOrdProd(int ordno);

}
