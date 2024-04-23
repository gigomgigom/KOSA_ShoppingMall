package com.mycompany.javajavajo.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Uplload {
	private String title;
	private String id;
	private String content;
	private List<MultipartFile> attach;
}
