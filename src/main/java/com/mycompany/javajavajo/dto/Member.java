package com.mycompany.javajavajo.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	private int memno;
	private String memid;
	private String mempw;
	private String memname; 
	private String memnicknm;
	private String mememail;
	private String memtel;
	private boolean memenabled;
	private String memrole;
	private int mempoint;
	private byte[] memimg;
	private String memimgtype;
	private String memimgoname;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date memdate;
	
	private MultipartFile memimgattach;
}
