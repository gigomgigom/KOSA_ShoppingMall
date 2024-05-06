package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Qna;

@Mapper
public interface QnaDao {
	public int insertBoard(Qna qna);

	public Qna selectByQnano(int qnano);

	public List<Qna> selectQnaList();

	public List<Qna> selectQnaListByKeyword(String keyword);
	
	
}
