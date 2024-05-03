package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Product;

@Mapper
public interface ProductDao {

	Product selectByProdno(int prodno);

	List<Product> selectByCtgno(int ctgno);

}
