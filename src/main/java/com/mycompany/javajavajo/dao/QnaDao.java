package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Qna;

@Mapper
public interface QnaDao {
	public int insertBoard(Qna qna);

	public Qna selectByQnano(@Param("qnano") int qnano, @Param("keyword") String keyword);

	public List<Qna> selectQnaList(@Param("pager") Pager pager, @Param("keyword") String keyword);

	public int updatehitcnt(int qnano);

	public int updateQna(Qna qna);

	public int deleteQna(int qnano);

	public int count(String keyword);

	public Qna selectQnaImgByqnano(int qnano);

	public int updateAttach(Qna qna);
	
}
