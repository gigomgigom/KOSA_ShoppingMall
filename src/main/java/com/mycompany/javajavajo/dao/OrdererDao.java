package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Orderer;

@Mapper
public interface OrdererDao {

	public int insert(Orderer orderer);

}
