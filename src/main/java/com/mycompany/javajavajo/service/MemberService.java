package com.mycompany.javajavajo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	

	public void auth(Member member) {
		PasswordEncoder passwordEncoder = 
				PasswordEncoderFactories.createDelegatingPasswordEncoder();
		member.setMempw(passwordEncoder.encode(member.getMempw())); // 암호화해서 다시 반환
		member.setMemenabled(true);
		
		memberDao.insert(member);
	}
}
