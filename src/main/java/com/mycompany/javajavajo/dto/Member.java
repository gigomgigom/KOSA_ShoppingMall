package com.mycompany.javajavajo.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Member {
	private int memno; //form
	private String memid; //form
	private String mempw;
	private String memname; 
	private String memnicknm;
	private String mememail; //form
	private String memtel; //form
	private boolean memenabled;
	private String memrole;
	private int mempoint;
	private byte[] memimg;
	private String memimgtype;
	private String memimgoname;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date memdate; //form
}
