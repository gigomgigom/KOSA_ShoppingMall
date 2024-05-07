package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private int ordno;
	private int memno;
	private String ordstts;
	private Date orddate;
	private int ordprice;
	private int discprice;
	private int finprice;
	private String ordrqst;
}
