package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.CategoryDao;
import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dao.OrdProdDao;
import com.mycompany.javajavajo.dao.OrderDao;
import com.mycompany.javajavajo.dao.PointDtlDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.ProductImgDao;
import com.mycompany.javajavajo.dto.Category;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.PointDtl;
import com.mycompany.javajavajo.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {

	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductImgDao productImgDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrdProdDao ordProdDao;
	@Autowired
	private PointDtlDao pointDtlDao;
	@Autowired
	private CategoryDao categoryDao;

	//심영조-admin-Category 정보들을 전부 가져와줘
	public List<Category> getAllCategory() {
		return categoryDao.selectAllCategory();
	}

	//--------------------------------------------------------
	//Admin-main페이지
	//심영조-admin-main페이지-재고부족상품들 가져오기
	public List<Product> getOutOfStock() {
		return productDao.selectLackStock();
	}
	//--------------------------------------------------------
	//Admin-Member관리
	//심영조-admin-memberList페이지-조건에 맞는 member들의 총 갯수를 가져옴
	public int getTotalMemberRows() {
		int totalRows = memberDao.selectTotalRows();
		return totalRows;
	}

	//심영조-admin-memberList페이지-Pager 조건에 맞는 데이터(List<Member>)를 받아와라
	public List<Member> getMemberList(Pager pager) {
		List<Member> memberList = memberDao.selectByPage(pager);
		return memberList;
	}

	//심영조-admin-memberDetail페이지- 회원번호를 주었을때 회원의 정보를 가져와라
	public Member getMemberByMemno(int memno) {
		Member member = memberDao.selectByMemno(memno);
		return member;
	}

	//심영조-admin-memberDetail페이지- 해당 회원의 정보를 변경해라
	public int editMemberInfo(Member member) {
		int updatedRowNo = memberDao.updateMemberInfo(member);
		return updatedRowNo;
	}

	//심영조-admin-memberDetail페이지- 해당 회원의 비밀번호를 초기화시켜라
	public int resetPassword(Member member) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String newPassword = passwordEncoder.encode("54321");
		member.setMempw(newPassword);
		log.info(member.getMemno() + member.getMempw());
		return memberDao.updatePassword(member);
	}

	//심영조-admin-memberDetail페이지- 해당 회원의 주문리스트를 가져와라
	public List<Order> getOrderListByMemno(int memno) {
		List<Order> orderList = orderDao.selectOrderByMemno(memno);
		return orderList;
	}

	//심영조-admin-memberDetail페이지- 건당 주문 상품 수를 가져와
	public Order getOrderProductCnt(int ordno) {
		return ordProdDao.selectOutlineOfOrdProd(ordno);
	}

	//심영조-admin-memberDetail페이지- 건당 주문 상품들중 하나를 가져와
	public Product getProductByProdNo(int oneofordproduct) {
		return productDao.selectByProdno(oneofordproduct);
	}

	//심영조-admin-memberDetail페이지 - 회원의 포인트 사용내역 가져오기
	public PointDtl getPointDtlListByOrdno(int ordno, int action) {
		PointDtl pointDtl = pointDtlDao.selectPointDtlByOrdnoAndAction(ordno, action);
		return pointDtl;
	}

	//심영조-admin-memberDetail페이지- 회원의 포인트 사용기록 별 일자를 얻기위해 orderDTO객체를 찾아온다.
	public Order getOrderByOrdno(int ordno) {
		Order order = orderDao.selectOrderByOrdno(ordno);
		return order;
	}

	//심영조-admin-memberDetail페이지- 회원의 포인트를 주어진 값으로 변경한다.
	public int editPoint(Member member) {
		return memberDao.updatePointByAdmin(member);
	}
	//--------------------------------------------------------
	//Admin-Product관리
	//심영조-admin-product관리 페이지 - 상품들의 갯수를 가져와
	public int getTotalProductRows() {
		return productDao.selectTotalProductCnt();
	}

	//심영조-admin-product관리 페이지 - 페이지 상태 별 상품들의 리스트를 가져와
	public List<Product> getProductList(Pager pager) {
		List<Product> productList = productDao.selectProductByPager(pager);
		return productList;
	}

	//심영조-admin-product관리 페이지 - 해당 상품의 재고를 수정해줘
	public int editProdStock(Product product) {
		return productDao.updateProdStock(product);
	}
	//심영조-admin-product 수정 페이지 - 선택한 상품의 데이터를 가져와줘
	public Product getProductByProdno(int prodno) {
		return productDao.selectByProdno(prodno);
	}
	
	//심영조-admin-product 수정 페이지 - 선택한 상품의 정보와 사진들을 수정해줘
	public int editProduct(Product product) {
		log.info(product.getProdname() + product.getProductImg().getRepimgoname());
		
		//상품정보 수정 (PRODUCT 테이블)
		int info = productDao.updateProductInfo(product);
		//상품사진 수정 (PRODUCTIMG 테이블)
		int img = productImgDao.updateProductImg(product);
		
		int result = info+img;
		return result;
	}

}
