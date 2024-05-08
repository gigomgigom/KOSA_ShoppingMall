package com.mycompany.javajavajo.dto;

import lombok.Data;

@Data
public class Recipient {
	private int ordno;
	private String rcptname;
	private String rcpttel;
	private String rcptpostno;
	private String rcptadr;
	private String rcptadrdtl;
	private String rcptemail;
}
