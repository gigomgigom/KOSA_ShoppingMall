package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.PointDtl;

@Mapper
public interface PointDtlDao {
	//권우상 pointdtl 데이터 삽입
	public int insert(PointDtl pointDtl);

}
