package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.SearchIndex;

@Mapper
public interface ProductDao {
	
	//심영조-Admin-memberDetail, ProductDetail
	//상품번호를 주었을때 이에 해당하는 상품정보를 가져오는 메소드
	Product selectByProdno(int prodno);

	//세림-ProductList - 카테고리별 상품 리스트 가져오기
	List<Product> selectByCtgno(int ctgno);
	
	//심영조-Admin-mainpage - 재고가 부족한(10개 이하)인 상품의 리스트가져오기
	List<Product> selectLackStock();
	
	//심영조-Admin-Product관리 - 상품들의 총 갯수를 가져와
	int selectTotalProductCnt(SearchIndex searchIndex);
	
	//심영조-Admin-Product관리 - Pager에 따른 상품들의 리스트를 가져오기 (사용자화면에서도 사용가능할듯? 해보고 안되면 말씀좀)
	List<Product> selectProductByPager(SearchIndex searchIndex);
	
	//심영조-Admin-Product관리 - 상품의 재고 수치를 수정하기
	int updateProdStock(Product product);
	
	//심영조-Admin-Product관리 - 상품의 정보 수정하기
	int updateProductInfo(Product product);
	
	//심영조-Admin-Product관리 - 상품 삭제
	int deleteProductByProdno(int prodno);
	
	//심영조-Admin-Product관리 - 상품 추가
	int insertProduct(Product product);
	int insertProductImg(Product product);

	int countbyCtgKeyword(@Param("ctgno")int ctgno, @Param("keyword")String keyword);

	List<Product> selectItemList(@Param("ctgno") int ctgno, @Param("keyword") String keyword,@Param("sorting") String sorting, @Param("pager") Pager pager);

	List<Product> selectBestProduct();

	// 신우호 - prodno를 사용해서 product정보 불러옴
	Product selectReviewByProdNo(int prodno);
	
	//심영조 - 판매량 순 베스트상품을 가져와!
	List<Product> selectBestProductFromAdmin();

	List<Product> selectProductListByProdNo(int prodno);

	
}
