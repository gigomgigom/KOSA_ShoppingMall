package com.mycompany.javajavajo.dto;

import lombok.Data;

@Data
public class OrdProd {
	private int ordno;
	private int prodno;
	private int qty;
	private int subtot;
	
	private String prodname;
	private int prodprice;
	private boolean hasReview;

}
