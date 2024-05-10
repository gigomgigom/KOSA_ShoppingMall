package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.PointDtl;

@Mapper
public interface PointDtlDao {
	//권우상 pointdtl 데이터 삽입
	public int insert(PointDtl pointDtl);
	
	//심영조-ordno와 action을 주었을때 해당하는 PointDtl데이터를 찾아와라
	public PointDtl selectPointDtlByOrdnoAndAction(@Param("ordno")int ordno, @Param("action")int action);
	
	//권우상 - 회원 번호에 해당하는 포인트 내역 전부 삭제
	public int delete(int ordno);

}
