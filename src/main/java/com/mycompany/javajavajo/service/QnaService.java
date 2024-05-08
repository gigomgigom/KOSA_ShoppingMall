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
	
	public void writeBoard(Qna qna) {
		// 비지니스 로직 처리
		log.info("바보입니다.");
		int rowNum = qnaDao.insertBoard(qna); // insert, update, delete = int형으로 (몇행이 바뀌는지 리턴해줌)
		log.info("rowNum: " + rowNum + ", bno: " + qna.getQnano());
		log.info("바보");
	}
	
	// service에서 dao를 호출 memid 테이블얻어옴
	public Qna getQna(int qnano) {
		int qnahitcnt = qnaDao.updatehitcnt(qnano);
		Qna qna = qnaDao.selectByQnano(qnano);
		qna.setQnacontent(qna.getQnacontent().replace("\r\n", "<br/>"));
		int memno = qna.getMemno();
		Member member = memberDao.selectByMemno(memno);
		qna.setQnawriter(member.getMemid());
		log.info(qna.getNextno()+"");
		log.info(qna.getPreno()+"");
		return qna;
	}
	
	// 게시물 검색 (제목으로 검색, 내용으로 검색)
	public List<Qna> getQnaList(String keyword) {
		List<Qna> qna = qnaDao.selectQnaListByKeyword(keyword);
		for(Qna q : qna) {
			int memno = q.getMemno();
			Member member = memberDao.selectByMemno(memno);
			q.setQnawriter(member.getMemid());
		}
		return qna;
	}
	
	// 게시물 수정
	public void updateQna(Qna qna) {
		int rowNum = qnaDao.updateQna(qna);
	}

	// 게시물 삭제
	public void deleteQna(int qnano) {
		int rowNum = qnaDao.deleteQna(qnano);
	}
	
	// 전체 행수 가져오기
	public int getTotalRows() {
		int totalRows = qnaDao.count();
		return totalRows;
	}

	// 게시물 목록 요청
	public List<Qna> getQnaList(Pager pager) {
		List<Qna> qnaList = qnaDao.selectByPage(pager);
		return qnaList;
	}

	
	

	
	
}
