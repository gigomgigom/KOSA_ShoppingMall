package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Product;

@Mapper
public interface ProductDao {
	
	//심영조-Admin-memberDetail 상품번호를 주었을때 이에 해당하는 상품정보를 가져오는 메소드
	Product selectByProdno(int prodno);

	//세림-ProductList 카테고리별 상품 리스트 가져오기
	List<Product> selectByCtgno(int ctgno);
	
	//심영조-Admin-mainpage 재고가 부족한(10개 이하)인 상품의 리스트가져오기
	List<Product> selectLackStock();

}
