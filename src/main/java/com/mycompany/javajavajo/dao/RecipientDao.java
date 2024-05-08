package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Recipient;

@Mapper
public interface RecipientDao {
	//recpient 데이터 삽입
	public int insert(Recipient recipent);

}
