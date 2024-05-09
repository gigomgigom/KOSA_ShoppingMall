package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Category;

@Mapper
public interface CategoryDao {
	
	//심영조-Category정보들을 전부 긁어와라
	List<Category> selectAllCategory();

}
