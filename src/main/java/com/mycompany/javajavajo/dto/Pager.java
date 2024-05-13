package com.mycompany.javajavajo.dto;

import lombok.Data;

@Data
public class Pager {
	//만약 테이블에서 불러온 행의 수가 10000개라면
	
		private int totalRows;      //페이징 대상이 되는 전체 행수 (10000개)
		private int totalPageNo;   //전체 페이지 수 (한페이지당 10개씩 들어간다 하면 1000개)
		private int totalGroupNo;   //전체 그룹 수 (페이지 인덱스들을 10개씩 그룹으로 구성한다면 100개)
		private int startPageNo;   //그룹의 시작 페이지 번호
		private int endPageNo;      //그룹의 끝 페이지 번호
		private int pageNo;         //현재 페이지 번호
		private int pagesPerGroup;   //그룹당 페이지 수
		private int groupNo;      //현재 그룹 번호 (현재 보여지는 페이지가 몇번 그룹에 속해있는가)
		private int rowsPerPage;   //페이지당 행 수
		private int startRowNo;      //페이지의 시작 행 번호(1, ..., n)
		//데이터베이스 별로 RowNum 시작 번호가 다르다 (Oracle 시작번호:1, MySql 시작번호:0)
		private int startRowIndex;   //페이지의 시작 행 인덱스(0, ..., n-1) for mysql	
		private int endRowNo;      //페이지의 마지막 행 번호
		private int endRowIndex;   //페이지의 마지막 행 인덱스

		public Pager(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo) {
			this.rowsPerPage = rowsPerPage;
			this.pagesPerGroup = pagesPerGroup;
			this.totalRows = totalRows;
			this.pageNo = pageNo;

			totalPageNo = totalRows / rowsPerPage;
			if(totalRows % rowsPerPage != 0) totalPageNo++;

			totalGroupNo = totalPageNo / pagesPerGroup;
			if(totalPageNo % pagesPerGroup != 0) totalGroupNo++;

			groupNo = (pageNo - 1) / pagesPerGroup + 1;

			startPageNo = (groupNo-1) * pagesPerGroup + 1;

			endPageNo = startPageNo + pagesPerGroup - 1;
			if(groupNo == totalGroupNo || totalGroupNo == 0) endPageNo = totalPageNo;

			startRowNo = (pageNo - 1) * rowsPerPage + 1;
			startRowIndex = startRowNo - 1;
			endRowNo = pageNo * rowsPerPage;
			endRowIndex = endRowNo - 1; 
		}
}
