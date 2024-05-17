package com.mycompany.javajavajo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Delivery {
	private int ordno;
	private int comno;
	private String trckno;
	private Date deldate;
	private String delrqst;
	
	private String comname;
	private String comtel;
}
