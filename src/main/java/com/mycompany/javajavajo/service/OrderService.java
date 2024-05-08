package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.CartItemDao;
import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dao.OrdProdDao;
import com.mycompany.javajavajo.dao.OrderDao;
import com.mycompany.javajavajo.dao.OrdererDao;
import com.mycompany.javajavajo.dao.PointDtlDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dao.RecipientDao;
import com.mycompany.javajavajo.dto.CartItem;
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
	
	//권우상 - 주문서 폼 내용 db 등록 실행  
	public void createOrder(int memno, Order order, Orderer orderer, Recipient recipient) {

		// order 삽입
		order.setMemno(memno);
		order.setOrdstts("배달 준비 중");
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
			PointDtl pointDtl = new PointDtl();
			pointDtl.setOrdno(ordno);
			pointDtl.setAction(1);
			pointDtl.setAmount(order.getDiscprice());
			int pointDtlResult = pointDtlDao.insert(pointDtl);
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

}
