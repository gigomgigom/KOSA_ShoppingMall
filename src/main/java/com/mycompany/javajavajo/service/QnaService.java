package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dao.QnaDao;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Qna;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaService {
	@Autowired
	private QnaDao qnaDao;
	@Autowired
	private MemberDao memberDao;

	// 게시판 글쓰기 
	public void writeBoard(Qna qna) {
		// 비지니스 로직 처리
		int rowNum = qnaDao.insertBoard(qna); // insert, update, delete = int형으로 (몇행이 바뀌는지 리턴해줌)
		log.info("rowNum: " + rowNum + ", bno: " + qna.getQnano());
	}

	// service에서 dao를 호출 qnano 테이블얻어옴
	public Qna getQna(int qnano, String keyword) {
		int qnahitcnt = qnaDao.updatehitcnt(qnano);
		Qna qna = qnaDao.selectByQnano(qnano,keyword);
		if(qna.getQnacontent() != null) {
			qna.setQnacontent(qna.getQnacontent().replace("\r\n", "<br/>"));
		}
		return qna;
	}

	// 전체 행수 가져오기
	public int getTotalRows(String keyword) {
		int totalRows = qnaDao.count(keyword);
		return totalRows;
	}

	// 페이징 게시물 목록 요청
	public List<Qna> getQnaList(Pager pager, String keyword) {
		List<Qna> qnaList = qnaDao.selectQnaList(pager, keyword);
		return qnaList;
	}

	// 게시물 수정
	public void updateQna(Qna qna) {
		int rowNum = qnaDao.updateQna(qna);
	}

	// 게시물 삭제
	public void deleteQna(int qnano) {
		int rowNum = qnaDao.deleteQna(qnano);
	}

	public Qna getQnaAttach(int qnano) {
		
		return qnaDao.selectQnaImgByqnano(qnano);
	}

	public int deleteAttach(int qnano) {
		Qna qna = new Qna();
		qna.setQnano(qnano);
		int result = qnaDao.updateAttach(qna);
		return result;
	}

	public int writeReply(int qnano, String reply) {
		int result = qnaDao.updateAdmrply(qnano,reply);
		return result;
	}


}
