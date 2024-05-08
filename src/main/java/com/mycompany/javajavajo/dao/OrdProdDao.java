package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.OrdProd;

@Mapper
public interface OrdProdDao {
	//ordProd 데이터 삽입
	public int insert(OrdProd ordProd);

}
