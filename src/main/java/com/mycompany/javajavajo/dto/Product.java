package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Product {
	private int prodno;
	private int ctgno;
	private String prodname;
	private int prodprice;
	private Date proddate;
	private int prodstock;
	
	private ProductImg productImg;
	private int ordcount;
	private int rvcount;
	private double avgrating;
	
	//판매량 
	private int soldcnt;
}