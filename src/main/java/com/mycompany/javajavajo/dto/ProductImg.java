package com.mycompany.javajavajo.dto;

import java.io.File;

import lombok.Data;

@Data
public class ProductImg {
	private int prodno;
	private byte[] prodrepimg;
	private byte[] proddtlimg;
	private String repimgoname;
	private String repimgtype;
	private String dtlimgoname;
	private String dtlimgtype;
	
}
