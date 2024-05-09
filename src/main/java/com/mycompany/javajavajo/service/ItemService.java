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
	
	
	// 세림 : 카테고리를 매개변수로 받음 -> 카테고리별로 상품 리스트 가져오기
	public List<Product> getItemListByCtgno(int ctgno) {
		List<Product> itemList = productDao.selectByCtgno(ctgno);
		return itemList;
	}

	
	//세림씨 과제에요!
	//1. Dao객체 내부의 메소드를 호출하면서 전달받은 prodno(상품번호)를 매개값으로 전달해준다.
	//2. Dao객체의 메소드를 호출됬을 때 반환하는 타입은 무엇일까?
	//3. Dao의 추상메소드를 resources/mybatis/mapper/product.xml에서 구현이 됬습니둥
	//다음단계는 mybatis에서의 product.xml로 이동!
	public Product getProductByProdno(int prodno) {
		Product product = productDao.selectByProdno(prodno);
		return product;
	}


}
