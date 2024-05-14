package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.OrdProd;
import com.mycompany.javajavajo.dto.Order;

@Mapper
public interface OrdProdDao {
	//ordProd 데이터 삽입
	public int insert(OrdProd ordProd);
	
	//심영조-OrdProd(주문상품)테이블에서 주문번호에 해당하는 총 구매상품수와 구매상품들중 하나의 상품번호를 가져온다.
	public Order selectOutlineOfOrdProd(int ordno);
	
	//심영조-주문번호를 주었을때 그에 해당하는 주문 상품에 대한 정보들을 가져오기(상품명, 상품 단가 포함)
	public List<OrdProd> selectOrdProdListByOrdno(int ordno);

	public List<OrdProd> selectBestOrdProd();

	

}
