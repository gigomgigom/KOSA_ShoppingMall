package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.ProductImgDao;
import com.mycompany.javajavajo.dao.ReviewDao;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;
import com.mycompany.javajavajo.dto.Review;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ItemService {
	@Autowired
	private ProductImgDao productImgDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	//번호에 해당하는 productimg 객체 받아오기
	public ProductImg getProductImages(int prodno) {
		ProductImg productImg = productImgDao.selectByProdno(prodno);
		return productImg;
	}
	
	
	// 권우상 - 카테고리 번호, 페이지 번호, 검색어, 정렬 조건을 받아 그에 맞게 상품 리스트를 받아옴
	public List<Product> getItemListByCtgno(int ctgno, String keyword, String sorting, Pager pager) {
		List<Product> itemList = productDao.selectItemList(ctgno,keyword,sorting,pager);
		return itemList;
	}

	
	//세림씨 과제에요!
	//1. Dao객체 내부의 메소드를 호출하면서 전달받은 prodno(상품번호)를 매개값으로 전달해준다.
	//2. Dao객체의 메소드를 호출됬을 때 반환하는 타입은 무엇일까?
	//3. Dao의 추상메소드를 resources/mybatis/mapper/product.xml에서 구현이 됬습니둥
	//다음단계는 mybatis에서의 product.xml로 이동!
	// Prodno를 사용해서 product의 정보들을 불러옴
	public Product getProductByProdno(int prodno) {
		Product product = productDao.selectReviewByProdNo(prodno);
		return product;
	}

	//권우상 - 카테고리와 검색어에 맞는 총 상품 데이터수를 받아옴
	public int getTotalRows(int ctgno, String keyword) {
		return productDao.countbyCtgKeyword(ctgno, keyword);
	}


	public List<Product> getBestProduct() {
		return productDao.selectBestProduct();
	}


	public List<Review> getReviewListByProdNo(int prodno) {
		
		return reviewDao.selectReviewListByProdNo(prodno);
	}


	public Review getReviceByProdNo(int prodno) {
		Review review = reviewDao.selectReviewByProdNo(prodno);
		return review;
	}


	


	
	
	// 상품번호를 사용해서 리뷰정보를 불러옴
	


}
