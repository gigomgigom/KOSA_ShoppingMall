package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PointDtl {
	private int ordno;
	private int action;
	private int amount;
	private Date date;
	
	//포인트 사용 상태를 문자열로 출력하기 위한 필드 선언
	private String actionStr;
}
