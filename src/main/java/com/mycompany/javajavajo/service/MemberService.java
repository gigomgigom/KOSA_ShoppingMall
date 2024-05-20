package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.MemberAdrDao;
import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dao.OrderDao;
import com.mycompany.javajavajo.dao.PointDtlDao;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.PointDtl;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberAdrDao memberAdrDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private PointDtlDao pointDtlDao;
	
	//신우호 - dto로 받아온 매개변수를 통해 memberDto의 비밀번호를 암호화 처리 
	public void auth(Member member, MemberAdr memberAdr) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		member.setMempw(passwordEncoder.encode(member.getMempw())); // 암호화해서 다시 반환
		member.setMemenabled(true);
		memberDao.insert(member);
		// member의 memno를 불러와서 memberAdr의 setting
		memberAdr.setMemno(member.getMemno());
		memberAdrDao.insertAdr(memberAdr);
		log.info(member.getMemno() + "");
	}

	public Member getMemberImage(int memno) {
		Member member = memberDao.selectByMemnoMemImg(memno);
		return member;
	}

	public MemberAdr getMemberAdr(int memno) {
		MemberAdr memberAdr = memberAdrDao.selectByMemno(memno);
		return memberAdr;
	}
	public Member getMemberByMid(String mid) {
		return memberDao.selectByMid(mid);
	}

	public Member getMemberPoint(int memno) {
		Member memPoint = memberDao.selectByMemno(memno);
		return memPoint;
	}
	public List<Order> getOrderListByMemno(int memno) {
		List<Order> orderList = orderDao.selectOrderByMemno(memno);
		return orderList;
	}
	public PointDtl getPointDtlListByOrdno(int ordno, int action) {
		PointDtl pointDtl = pointDtlDao.selectPointDtlByOrdnoAndAction(ordno, action);
		return pointDtl;
	}
	public Order getOrderByOrdno(int ordno) {
		Order order = orderDao.selectOrderByOrdno(ordno);
		return order;
	}

	public void updateMemberByMemno(Member member) {
		//mempw가 공백란일 경우 암호화 하지 않음
		if (member.getMempw() != null && !member.getMempw().isEmpty()) {
			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
			member.setMempw(passwordEncoder.encode(member.getMempw())); 
		}
		memberDao.updateMemberInformation(member);
	}

	public void updateMemberAdr(MemberAdr memberAdr) {
		memberAdrDao.updateMemberAddress(memberAdr);
		
	}

	public List<Order> getOrderListInMypage(int memno) {
		return orderDao.getOrderListInMyPage(memno);
	}
}