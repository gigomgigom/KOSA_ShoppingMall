package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.CartItemDao;
import com.mycompany.javajavajo.dao.DeliveryDao;
import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dao.OrdProdDao;
import com.mycompany.javajavajo.dao.OrderDao;
import com.mycompany.javajavajo.dao.OrdererDao;
import com.mycompany.javajavajo.dao.PointDtlDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.RecipientDao;
import com.mycompany.javajavajo.dao.ReviewDao;
import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Delivery;
import com.mycompany.javajavajo.dto.OrdProd;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Orderer;
import com.mycompany.javajavajo.dto.PointDtl;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.Recipient;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderService {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrdererDao ordererDao;
	@Autowired
	private RecipientDao recipientDao;
	@Autowired
	private PointDtlDao pointDtlDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CartItemDao cartItemDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private OrdProdDao ordProdDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private DeliveryDao deliveryDao;
	
	//권우상 - 주문서 폼 내용 db 등록 실행  
	public void createOrder(int memno, Order order, Orderer orderer, Recipient recipient) {

		// order 삽입
		order.setMemno(memno);
		order.setOrdstts(1);
		order.setFinprice(order.getFinprice() - order.getDiscprice());
		int orderResult = orderDao.insert(order);

		// orderer 삽입
		orderer.setOrdno(order.getOrdno());
		int ordererResult = ordererDao.insert(orderer);
		int ordno = order.getOrdno();
		
		// recipient 삽입
		recipient.setOrdno(ordno);
		int recipientResult = recipientDao.insert(recipient);
		
	
		//사용한 포인트가 0 이상이라면
		if(order.getDiscprice() != 0) {
			// 멤버 포인트 차감
			memberDao.updatePoint(memno, order.getDiscprice(), "-");
	
			// pointDtl 삽입
			PointDtl pointMinus = new PointDtl();
			pointMinus.setOrdno(ordno);
			pointMinus.setAction(1);
			pointMinus.setAmount(order.getDiscprice());
			int pointDtlResult = pointDtlDao.insert(pointMinus);
		}
		
		//memno에 해당하는 cartitem을 얻어 온 후 ordprod추가 및 cartitem삭제
		List<CartItem> cartItemList = cartItemDao.selectByMemno(memno);
		int[] prodnos = new int[cartItemList.size()];
		int i = 0;
		for(CartItem cartItem : cartItemList) {
			int prodno = cartItem.getProdno();
			int qty = cartItem.getQty();
			Product product = productDao.selectByProdno(prodno);
			int price = product.getProdprice();
			
			OrdProd ordProd = new OrdProd();
			ordProd.setOrdno(ordno);
			ordProd.setProdno(prodno);
			ordProd.setQty(qty);
			ordProd.setSubtot(price * qty);
			int ordProdResult = ordProdDao.insert(ordProd);
			
			prodnos[i] = prodno;
			i += 1;
		}
		int carItemDeleteResult = cartItemDao.deleteCartItems(memno, prodnos);
		
	}
	
	//권우상 - 주문번호로 주문자의 정보를 얻어옴
	public Order getOrderByOrdno(int ordno) {
		Order order = orderDao.selectOrderByOrdno(ordno);
		return order;
	}
	
	//수정해야함(변수명)
	//권우상 - 주문번호로 주문에 해당하는 주문상품의 목록을 불러옴
	public List<OrdProd> getOrdProdListByOrdno(int ordno) {
		List<OrdProd> ordProdList = ordProdDao.selectOrdProdListByOrdno(ordno);
		
		//주문상품에 리뷰를 쓴 기록이 있는지 확인
		for(OrdProd ordProd : ordProdList) {
			int prodno = ordProd.getProdno();
			int result = reviewDao.count(ordno, prodno);
			boolean hasReview = (result > 0) ? true : false;
			ordProd.setHasReview(hasReview);
		}
		
		return ordProdList;
	}
	
	
	//권우상 - 주문번호로 주문자의 정보를 얻어옴
	public Orderer getOrdererByOrdno(int ordno) {
		Orderer orderer = ordererDao.selectOrdererByOrdno(ordno);
		return orderer;
	}
	
	//권우상 - 주문번호로 수령인의 정보를 받아옴
	public Recipient getRecipientByOrdno(int ordno) {
		Recipient recipient = recipientDao.selectRecipientByOrdno(ordno);
		return recipient;
	}
	
	// 신우호 - 회원번호로 주문목록 정보를 받아옴
	public List<Order> getOrderListByMemno(int memno) {
		List<Order> orderList = orderDao.selectOrderByMemno(memno);
		return orderList;
	}

	public Product getProductByProdNo(int oneofordproduct) {
		return productDao.selectByProdno(oneofordproduct);
	}

	public int cancelOrder(int memno, int ordno) {
		int ordstts = 5;
		
		//포인트 사용내역을 가져와서 멤버에 다시 넣어 줌
		PointDtl pointMinus = pointDtlDao.selectPointDtlByOrdnoAndAction(ordno, 1);
		if(pointMinus != null) {
			int memberPointResult = memberDao.updatePoint(memno, pointMinus.getAmount(), "+");
		}
		
		//주문이 취소 되어서 포인트 내역도 삭제
		int poinDtlDeleteResult = pointDtlDao.delete(ordno);
		
		int orderResult = orderDao.updateOrdStts(ordno, ordstts);
		return orderResult;
	}
	
		// 주문상품의 수를 가져옴, 상품의 1개의 상품번호를 가져옴
	public Order getOrderProductCnt(int ordno) {
		return ordProdDao.selectOutlineOfOrdProd(ordno);
	}

	public Product getProductByproduct(int oneofordproduct) {
		return productDao.selectByProdno(oneofordproduct);
	}

	public int completeOrder(int memno, int ordno, int amount) {
	    //결제 금액의 5퍼센트를 point로 적립
		PointDtl pointPlus = new PointDtl();
		pointPlus.setOrdno(ordno);
		pointPlus.setAction(0);
		pointPlus.setAmount(amount * 5 / 100);
		int pointDtlResult = pointDtlDao.insert(pointPlus);
		memberDao.updatePoint(memno, pointPlus.getAmount(), "+");
		
		int ordstts = 4;
		int ordsttsresult = orderDao.updateOrdStts(ordno, ordstts);
		return pointDtlResult;
	}

	public void createOrderDirect(int memno, Order order, Orderer orderer, Recipient recipient, int prodno, int qty) {

		// order 삽입
		order.setMemno(memno);
		order.setOrdstts(1);
		order.setFinprice(order.getFinprice() - order.getDiscprice());
		int orderResult = orderDao.insert(order);

		// orderer 삽입
		orderer.setOrdno(order.getOrdno());
		int ordererResult = ordererDao.insert(orderer);
		int ordno = order.getOrdno();
		
		// recipient 삽입
		recipient.setOrdno(ordno);
		int recipientResult = recipientDao.insert(recipient);
		
	
		//사용한 포인트가 0 이상이라면
		if(order.getDiscprice() != 0) {
			// 멤버 포인트 차감
			memberDao.updatePoint(memno, order.getDiscprice(), "-");
	
			// pointDtl 삽입
			PointDtl pointMinus = new PointDtl();
			pointMinus.setOrdno(ordno);
			pointMinus.setAction(1);
			pointMinus.setAmount(order.getDiscprice());
			int pointDtlResult = pointDtlDao.insert(pointMinus);
		}
		
		Product product = productDao.selectByProdno(prodno);
		int price = product.getProdprice();
		OrdProd ordProd = new OrdProd();
		ordProd.setOrdno(ordno);
		ordProd.setProdno(prodno);
		ordProd.setQty(qty);
		ordProd.setSubtot(price * qty);
		int ordProdResult = ordProdDao.insert(ordProd);
		
	}

	public Delivery getDelivery(int ordno) {
		Delivery delivery = deliveryDao.selectDeliveryByOrdno(ordno);
		return delivery;
	}

	



	


}
