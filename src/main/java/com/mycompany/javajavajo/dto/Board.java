package com.mycompany.javajavajo.dto;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Board {
	private int bno;
	private String btitle;
	private String bcontent;
	private String bid;
	private List<String> battach;
	private int hitcount;
	private Date bdate;
}
