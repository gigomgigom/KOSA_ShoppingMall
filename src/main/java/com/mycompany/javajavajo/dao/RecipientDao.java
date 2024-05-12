package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Recipient;

@Mapper
public interface RecipientDao {
	//recpient 데이터 삽입
	public int insert(Recipient recipent);
	//심영조- ordno를 주었을때 이에 해당하는 수령인 정보를 가져와라
	public Recipient selectRecipientByOrdno(int ordno);

}
