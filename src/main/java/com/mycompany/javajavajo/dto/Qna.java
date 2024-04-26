package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Qna {
	private int qnano;
	private int memno;
	private String qnatitle;
	private Date qnadate;
	private int qnahitcnt;
	private String admrply;
}
