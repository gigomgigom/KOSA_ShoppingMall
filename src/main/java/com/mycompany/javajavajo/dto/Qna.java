package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Qna {
	private int qnano;
	private int memno;
	private String qnatitle;
	private String qnacontent;
	private Date qnadate;	
	private int qnahitcnt;
	private String admrply;
	private String qnaattachoname;
	private String qnaattachtype;
	private byte[] qnaattachdata;
	private int qnalock;
	
	private String qnawriter;
	
	private String pretitle;
	private int preno;
	private String prememno; 
	private int prelock;

	private String nexttitle;
	private int nextno;
	private String nextmemno; 
	private int nextlock;
}
