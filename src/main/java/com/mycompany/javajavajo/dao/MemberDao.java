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

	//심영조 - Admin-회원관리-memberList에서 총 회원수를 가져오기 위한 메소드
	public int countSelectedRows();

	//심영조 - Admin-회원관리-memberList에서 사용자가 요청한 페이지정보에 따라 List<Member>를 가져오기
	public List<Member> selectByPage(Pager pager);
	
}
