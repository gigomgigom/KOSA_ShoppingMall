package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PointDtl {
	private int ordno;
	private int action;
	private int amount;
	private Date date;
}
