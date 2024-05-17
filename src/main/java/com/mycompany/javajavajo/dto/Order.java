package com.mycompany.javajavajo.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Order {
	private int ordno;
	private int memno;
	private int ordstts;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orddate;
	private int ordprice;
	private int discprice;
	private int finprice;
	private String rqst;
	
	//주문상태 문자열로 보여주기(배송, 입금, 취소, 완료)
	private String ordsttschar;
	
	//주문건 상품수
	private int ordproductcnt;
	//주문 상품들중 하나에 대한 정보
	private int oneofordproduct;
	private Product oneproduct;
	
	//주문 상품의 목록
	private List<OrdProd> ordProdList;
	
	//주문자, 수령자 정보
	private Orderer orderer;
	private Recipient recipient;
	
}
