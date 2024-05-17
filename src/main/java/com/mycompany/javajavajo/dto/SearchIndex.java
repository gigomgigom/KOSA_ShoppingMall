package com.mycompany.javajavajo.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SearchIndex {
	//페이지 번호
	private String pageno;
	
	private int sortindex; //정렬기준
	private int ctgindex; //분류기준
	
	private String searchkeyword; //검색키워드
	private int searchindex; //검색키워드 기준(만약 제목으로 검색할거야 그럼 제목 선택, 내용물로 검색할거야 그럼 내용물 선택)
	
	//기간별
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startdate; // 시작일자
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enddate; //종료일자
	
	//페이저DTO 객체
	private Pager pager;
	
}
