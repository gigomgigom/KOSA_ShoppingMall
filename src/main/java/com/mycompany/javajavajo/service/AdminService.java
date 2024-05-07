package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private MemberDao memberDao;
	
	public List<Product> getOutOfStock() {
		return productDao.selectLackStock();
	}

	public int getTotalRows() {
		int totalRows = memberDao.countSelectedRows();
		return totalRows;
	}

	public List<Member> getMemberList(Pager pager) {
		List<Member> memberList = memberDao.selectByPage(pager);
		return memberList;
	}

	public Member getMemberByMemno(int memno) {
		Member member = memberDao.selectByMemno(memno);
		return member;
	}
	
}
