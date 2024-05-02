package com.mycompany.javajavajo.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.javajavajo.dto.Member;

public class Tm1UserDetails extends User {
	
	private Member member;

	public Tm1UserDetails(Member member, List<GrantedAuthority> authorities) {
		super(member.getMemid(), member.getMempw(), member.isMemenabled(), true, true, true, authorities);
		this.member = member;	
	}

	public Member getMember() {
		return member;
	}
	
	
	
}
