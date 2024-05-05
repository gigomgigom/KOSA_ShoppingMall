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
	
	private String qnawriter;
}
