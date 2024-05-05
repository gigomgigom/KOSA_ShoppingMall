package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Member;


@Mapper
public interface MemberDao {

	Member selectByMid(String username);

	
	public Member selectByMemid(String memid);
	
	// insert = int 타입으로 받기
	public int insert(Member member);


	public Member selectByMemno(int memno);
	
	
}
