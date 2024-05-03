package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.ProductImg;

@Mapper
public interface ProductImgDao {

	ProductImg selectByProdno(int prodno);

}
