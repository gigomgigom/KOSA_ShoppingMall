package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Orderer;

@Mapper
public interface OrdererDao {
	//권우상 - orderer데이터 삽입
	public int insert(Orderer orderer);

}
