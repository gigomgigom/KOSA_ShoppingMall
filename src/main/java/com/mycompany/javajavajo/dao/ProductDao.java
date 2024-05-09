package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.OrdProd;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Product;

@Mapper
public interface ProductDao {
	
	//심영조-Admin-memberDetail, ProductDetail
	//상품번호를 주었을때 이에 해당하는 상품정보를 가져오는 메소드
	Product selectByProdno(int prodno);

	//세림-ProductList 카테고리별 상품 리스트 가져오기
	List<Product> selectByCtgno(int ctgno);
	
	//심영조-Admin-mainpage 재고가 부족한(10개 이하)인 상품의 리스트가져오기
	List<Product> selectLackStock();
	
	//심영조-Admin-Product관리 상품들의 총 갯수를 가져와
	int selectTotalProductCnt();
	
	//심영조-Admin-Product관리 Pager에 따른 상품들의 리스트를 가져오기 (사용자화면에서도 사용가능할듯? 해보고 안되면 말씀좀)
	List<Product> selectProductByPager(Pager pager);
	
	//심영조-Admin-Product관리 상품의 재고 수치를 수정하기
	int updateProdStock(Product product);

	
	

	
	

	
	

	

	
	
}
