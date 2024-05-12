package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Orderer;

@Mapper
public interface OrdererDao {
	//권우상 - orderer데이터 삽입
	public int insert(Orderer orderer);
	//심영조 - ordno를 주었을때 해당하는 주문자 정보를 가져와라
	public Orderer selectOrdererByOrdno(int ordno);

}
