package com.mycompany.javajavajo.dto;

import lombok.Data;

@Data
public class CartItem {
	private int memno;
	private int prodno;
	private int qty;
	
	private Product product;
}
