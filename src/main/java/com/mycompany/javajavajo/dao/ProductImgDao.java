package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;

@Mapper
public interface ProductImgDao {

	ProductImg selectByProdno(int prodno);
	
	//심영조-Admin-Product관리 상품정보 수정시 이미지파일 정보 및 데이터 수정
	int updateProductImg(Product product);

}
