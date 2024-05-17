package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.CategoryDao;
import com.mycompany.javajavajo.dao.DeliveryComDao;
import com.mycompany.javajavajo.dao.DeliveryDao;
import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dao.OrdProdDao;
import com.mycompany.javajavajo.dao.OrdSttsDao;
import com.mycompany.javajavajo.dao.OrderDao;
import com.mycompany.javajavajo.dao.OrdererDao;
import com.mycompany.javajavajo.dao.PointDtlDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.ProductImgDao;
import com.mycompany.javajavajo.dao.QnaDao;
import com.mycompany.javajavajo.dao.RecipientDao;
import com.mycompany.javajavajo.dto.Category;
import com.mycompany.javajavajo.dto.Delivery;
import com.mycompany.javajavajo.dto.DeliveryCom;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.OrdProd;
import com.mycompany.javajavajo.dto.OrdStts;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Orderer;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.PointDtl;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.Qna;
import com.mycompany.javajavajo.dto.Recipient;
import com.mycompany.javajavajo.dto.SearchIndex;

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
	private OrdSttsDao sttsDao;
	@Autowired
	private OrdererDao ordererDao;
	@Autowired
	private RecipientDao recipientDao;
	@Autowired
	private OrdProdDao ordProdDao;
	@Autowired
	private PointDtlDao pointDtlDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private DeliveryDao delDao;
	@Autowired
	private DeliveryComDao delComDao;
	@Autowired
	private QnaDao qnaDao;

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
	public int getTotalMemberRows(SearchIndex searchIndex) {
		int totalRows = memberDao.selectTotalRows(searchIndex);
		return totalRows;
	}

	//심영조-admin-memberList페이지-Pager 조건에 맞는 데이터(List<Member>)를 받아와라
	public List<Member> getMemberList(SearchIndex searchIndex) {
		List<Member> memberList = memberDao.selectByPage(searchIndex);
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
	public int getTotalProductRows(SearchIndex searchIndex) {
		return productDao.selectTotalProductCnt(searchIndex);
	}

	//심영조-admin-product관리 페이지 - 페이지 상태 별 상품들의 리스트를 가져와
	public List<Product> getProductList(SearchIndex searchIndex) {
		List<Product> productList = productDao.selectProductByPager(searchIndex);
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
	//심영조-admin-product 수정 페이지 - 선택한 상품을 목록에서 삭제한다.
	public int deleteProduct(int prodno) {
		int deletedRow = productDao.deleteProductByProdno(prodno);
		return deletedRow;
	}
	//심영조-admin-product 추가 페이지 - 상품을 목록에 추가한다.
	public int addProduct(Product product) {
		int insertedProductRow = productDao.insertProduct(product);
		int insertedProductImgRow = productDao.insertProductImg(product);
		int result = insertedProductRow + insertedProductImgRow;
		return result;
	}
	//심영조-admin-Uncom Order - 완료/취소되지않은 주문들의 총 갯수를 찾는다.
	public int getTotalUncomRows(SearchIndex searchIndex) {
		int totalUncomRows = orderDao.getTotalUncomOrders(searchIndex);
		return totalUncomRows;
	}
	//심영조-admin-Uncom Order - 완료/취소되지않은 주문들의 목록을 찾아!
	public List<Order> getUncomOrderList(SearchIndex searchIndex) {
		List<Order> orderList = orderDao.selectUncomOrderByPager(searchIndex);
		return orderList;
	}
	//심영조-admin-Uncom Order - 주문번호를 통해 주문자 정보 가져오기
	public Orderer getOrdererByOrdno(int ordno) {
		Orderer orderer = ordererDao.selectOrdererByOrdno(ordno);
		return orderer;
	}
	//심영조-admin-Uncom Order - 주문번호를 통해 수령인 정보 가져오기
	public Recipient getRcptByOrdno(int ordno) {
		Recipient rcpt = recipientDao.selectRecipientByOrdno(ordno);
		return rcpt;
	}
	//심영조-admin-Uncom Order - 주문번호를 통해 해당 주문의 상품들의 리스트를 가져오기
	public List<OrdProd> getOrdProdList(int ordno) {
		List<OrdProd> ordProdList = ordProdDao.selectOrdProdListByOrdno(ordno);
		return ordProdList;
	}
	//심영조-admin-Uncom Order - 주문상태의 목록을 가져와!
	public List<OrdStts> getOrdSttsList() {
		List<OrdStts> ordSttsList = sttsDao.selectAllStts();
		return ordSttsList;
	}
	//심영조-admin-Uncom Order - 주문의 배송정보를 가져와!
	public Delivery getDeliveryInfoByOrdno(int ordno) {
		Delivery del = delDao.selectDeliveryByOrdno(ordno);
		return del;
	}
	//심영조-admin-OrderDetail - 배송회사들의 정보들을 가져와줘!
	public List<DeliveryCom> getDelComList() {
		List<DeliveryCom> delComList = delComDao.selectDelComList();
		return delComList;
	}
	//심영조-admin-OrderStts Update - 주문상태 및 배송정보를 업데이트해줘!
	public int updateStatus(Order order, Delivery del) {
		int orderResult = orderDao.updateOrdStts(order.getOrdno(), order.getOrdstts());
		int delResult = 0;
		if(!del.getTrckno().equals("")) {
			log.info(del.getTrckno());
			delResult = delDao.insertDeliveryInfo(del);
		}
		return orderResult+delResult;
	}
	//심영조-admin-Order-완료, 취소된 주문의 총 갯수를 가져와줘!
	public int getTotalComRows() {
		int totalComRows = orderDao.getTotalComOrder();
		return totalComRows;
	}
	//심영조-admin-Order-완료, 취소된 주문의 리스트를 가져와줘!
	public List<Order> getComOrderList(Pager pager) {
		List<Order> comOrderList = orderDao.getComOrderListByPager(pager);
		return comOrderList;
	}
	//심영조 -admin-대시보드 판매량순 베스트 상품의 정보들을 가져와줘!
	public List<Product> getBestSoldProducts() {
		List<Product> bestProducts = productDao.selectBestProductFromAdmin();
		return bestProducts;
	}
	//심영조 - admin-main에서 사용할 주문 현황 데이터 가져오기 
	public int getWeeklyTotalOrd() {
		return orderDao.getWeeklyTotalOrd();
	}
	public int getWeeklyNonDel() {
		return orderDao.getWeeklyNonDel();
	}
	public int getWeeklyRdyDel() {
		return orderDao.getWeeklyRdyDel();
	}
	//심영조-admin-main에서 사용할 매출 현황 데이터 가져오기
	public int getTodaySales() {
		return orderDao.getTodaySales();
	}
	public int getMonthSales() {
		return orderDao.getMonthSales();
	}
	public int getMaxDaySales() {
		return orderDao.getMaxDaySales();
	}
	//심영조-admin-board-qna 게시판의 모든 게시글의 수를 가져오기
	public int getTotalQnaRows(SearchIndex searchIndex) {
		return qnaDao.getQnaCntByAdmin(searchIndex);
	}
	//심영조-admin-board-qna 게시글들을 가져오기
	public List<Qna> getQnaList(SearchIndex searchIndex) {
		return qnaDao.getQnaListByAdmin(searchIndex);
	}
}
