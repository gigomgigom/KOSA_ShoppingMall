package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.MemberAdr;

@Mapper
public interface MemberAdrDao {

	public int insertAdr(MemberAdr memberAdr);

	
}
