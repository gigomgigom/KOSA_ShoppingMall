package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.ProductImgDao;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ItemService {
	@Autowired
	private ProductImgDao productImgDao;
	
	@Autowired
	private ProductDao productDao;
	
	//번호에 해당하는 productimg 객체 받아오기
	public ProductImg getProductImages(int prodno) {
		ProductImg productImg = productImgDao.selectByProdno(prodno);
		
		return productImg;
	}
	
	public List<Product> getItemListByCtgno(int ctgno) {
		List<Product> itemList = productDao.selectByCtgno(ctgno);
		return itemList;
	}

	//세림이 - 상세페이지에 나올 이미지들을 product를 받아 로직을 수행
	public Product getProductByProdno(int prodno) {
		Product product = productDao.selectByProdno(prodno);
		return product;
		
	}

}
