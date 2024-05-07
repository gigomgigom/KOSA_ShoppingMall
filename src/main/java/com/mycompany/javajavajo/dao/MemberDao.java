package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Pager;


@Mapper
public interface MemberDao {

	public Member selectByMid(String username);

	
	public Member selectByMemid(String memid);
	
	// insert = int 타입으로 받기
	public int insert(Member member);


	public Member selectByMemno(int memno);


	public Member selectByMemnoMemImg(int memno);


	public int countSelectedRows();


	public List<Member> selectByPage(Pager pager);
	
}
