package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Qna;

@Mapper
public interface QnaDao {
	public int insertBoard(Qna qna);

	public Qna selectByQnano(int qnano);
}
