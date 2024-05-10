package com.mycompany.javajavajo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.MemberAdrDao;
import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberAdrDao memberAdrDao;

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


}
