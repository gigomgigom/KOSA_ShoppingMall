package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private int ordno;
	private int prodno;
	private String rvtitle;
	private Date rvdate;
	private String rvcontent;
	private int rvrating;
}
