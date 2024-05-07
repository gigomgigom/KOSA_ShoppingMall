package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.OrdProd;

@Mapper
public interface OrdProdDao {

	public int insert(OrdProd ordProd);

}
