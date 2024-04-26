package com.mycompany.javajavajo.dto;

import lombok.Data;

@Data
public class Delivery {
	private int ordno;
	private int comno;
	private String trckno;
	private String deldate;
	private String delrqst;
}
