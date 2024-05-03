package com.mycompany.javajavajo.dto;

import java.sql.Blob;

import lombok.Data;

@Data
public class ProductImg {
	private int prodno;
	private	byte[] repimg;
	private byte[] dtlimg;
	private String repimgoname;
	private String repimgtype;
	private String dtlimgoname;
	private String dtlimgtype;
	
}
