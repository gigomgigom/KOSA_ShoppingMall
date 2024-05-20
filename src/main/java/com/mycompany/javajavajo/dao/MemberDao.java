package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.SearchIndex;


@Mapper
public interface MemberDao {
	
	//심영조 - SpringSecurity를 위한 MemberDao메소드
	public Member selectByMid(String username);
	
	//신우호 - 회원정보를 넣어주기 위함 
	public int insert(Member member);

	//심영조 - 회원번호를 통해 해당 회원의 정보들을 가져오기
	public Member selectByMemno(int memno);
	
	public Member selectByMemnoMemImg(int memno);

	//심영조 - Admin-회원관리-memberList에서 총 회원수를 가져오기 위한 메소드
	public int selectTotalRows(SearchIndex searchIndex);

	//심영조 - Admin-회원관리-memberList에서 사용자가 요청한 페이지정보에 따라 List<Member>를 가져오기
	public List<Member> selectByPage(SearchIndex searchIndex);

	//심영조 - MemberDTO에 담겨진 데이터로 변경해라
	public int updateMemberInfo(Member member);

	//권우상 - memno에 해당하는 유저의 mempoint를 operator에 따라 "+" 혹은 "-" amount 양만큼 연산을 해준다 
	public int updatePoint(@Param("memno") int memno,@Param("amount") int amount,@Param("operator") String operator);

	//심영조 - Admin-회원관리-memberDetail에서 회원의 비밀번호를 초기화할때 사용함
	//근데 사용자화면에서 사용자정보 수정할때 사용할 수 있을듯?
	public int updatePassword(Member member);

	//심영조 - Admin-회원관리-memberDetail에서 회원의 포인트를 관리자가 수정할 때 사용함
	public int updatePointByAdmin(Member member);
	
	//황세림 - MemberDTO에 담겨진 데이터로 변경해라 ver2
	public int updateMemberInformation(Member member);
	


	
}
