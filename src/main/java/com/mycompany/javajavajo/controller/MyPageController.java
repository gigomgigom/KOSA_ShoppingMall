package com.mycompany.javajavajo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	private MemberService service;
	
	//황세림 - member를 받아 회원의 주소를 출력하는 경로
	@RequestMapping("")
	public String myPageMain(Authentication authentication, Model model) {
		String mid = authentication.getName();
		Member member = service.getMemberByMid(mid);
		int memno = member.getMemno();
		MemberAdr memberAdr = service.getMemberAdr(memno);
		model.addAttribute("member", member);
		model.addAttribute("memberAdr", memberAdr);
		log.info(member.toString());
		
		return "mypage/mypage";
	}

	
	
	//멤버 이미지 다운로드
	@GetMapping("/downloadMemImg")
	public void downloadMemberImg(int memno, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Member member = service.getMemberImage(memno);
		byte[] memImgData = member.getMemimg();
		
		response.setContentType(member.getMemimgtype());
		String fileName = new String(member.getMemimgoname().getBytes("UTF-8"),"ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");
		if(memImgData == null) {
			log.info("null"); 
		}
		log.info("run2");
		OutputStream os = response.getOutputStream();
		os.write(memImgData);
		os.flush();
		os.close();
	}
}
