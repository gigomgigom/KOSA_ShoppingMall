package com.mycompany.javajavajo.dto;

import java.io.File;
import java.util.Date;

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
	private String mempoint;
	private File memimg;
	private Date memdate;
}
