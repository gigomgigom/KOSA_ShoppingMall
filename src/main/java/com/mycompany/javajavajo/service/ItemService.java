package com.mycompany.javajavajo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.ProductImgDao;
import com.mycompany.javajavajo.dto.ProductImg;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ItemService {
	@Autowired
	private ProductImgDao productImgDao;
	
	//번호에 해당하는 productimg 객체 받아오기
	public ProductImg getProductImages(int prodno) {
		ProductImg productImg = productImgDao.selectByProdno(prodno);
		
		return productImg;
	}

}
