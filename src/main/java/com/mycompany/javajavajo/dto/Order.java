package com.mycompany.javajavajo.dto;

import java.util.Date;
import java.util.List;

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
	
	//주문건 상품수
	private int ordproductcnt;
	//주문 상품들중 하나에 대한 정보
	private int oneofordproduct;
	private Product oneproduct;
}
