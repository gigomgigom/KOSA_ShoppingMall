package com.mycompany.javajavajo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.OrderDao;
import com.mycompany.javajavajo.dao.OrdererDao;
import com.mycompany.javajavajo.dao.PointDtlDao;
import com.mycompany.javajavajo.dao.RecipientDao;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Orderer;
import com.mycompany.javajavajo.dto.PointDtl;
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
	
	public void createOrder(Order order) {
		int result = orderDao.insert(order);
	}
	public void createorderer(Orderer orderer) {
		int result = ordererDao.insert(orderer);
	}
	public void createRecipient(Recipient recipient) {
		int result = recipientDao.insert(recipient);
		
	}
	public void createPointDtl(PointDtl pointDtl) {
		int result = pointDtlDao.insert(pointDtl);
		
	}

}
