package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.PointDtl;

@Mapper
public interface PointDtlDao {

	public int insert(PointDtl pointDtl);

}
