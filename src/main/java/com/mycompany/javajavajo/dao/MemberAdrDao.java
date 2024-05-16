package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;

@Mapper
public interface MemberAdrDao {

	public int insertAdr(MemberAdr memberAdr);

	public MemberAdr selectByMemno(int memno);

	public int updateMemberAddress(MemberAdr memberAdr);

	
}
