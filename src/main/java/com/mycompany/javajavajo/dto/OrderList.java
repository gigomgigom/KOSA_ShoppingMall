package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderList {
	private int ordNo; // 주문번호
	private String prodName; // 삼품이름
	private int prodCnt; // 상품갯수
	private int totalPrice; // 총 가격
	private String prodStatus; // 주문상태
	private Date ordDate; // 주문날짜

}