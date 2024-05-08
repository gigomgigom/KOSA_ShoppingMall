package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

	//문제발생 메소드
	public int updateMemberInfo(Member member);
	
	//권우상 - memno에 해당하는 유저의 mempoint를 operator에 따라 "+" 혹은 "-" amount 양만큼 연산을 해준다 
	public int updatePoint(@Param("memno") int memno,@Param("amount") int amount,@Param("operator") String operator);
}
