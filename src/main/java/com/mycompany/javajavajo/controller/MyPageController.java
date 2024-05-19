package com.mycompany.javajavajo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.MemberAdr;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.PointDtl;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.service.ItemService;
import com.mycompany.javajavajo.service.MemberService;
import com.mycompany.javajavajo.service.OrderService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private ItemService itemService;


	@Secured("ROLE_USER")
	//황세림 - member를 받아 회원의 주소를 출력하는 경로
	@RequestMapping("")
	public String myPageMain(Authentication authentication, Model model) {
		String mid = authentication.getName();
		
		//황세림 - Mid로 member 객체 가져오기
		Member member = memberService.getMemberByMid(mid);
		int memno = member.getMemno();
		MemberAdr memberAdr = memberService.getMemberAdr(memno);
		model.addAttribute("member", member);
		model.addAttribute("memberAdr", memberAdr);
		
		//황세림 - 회원 이미지 출력
		Member memberImg = memberService.getMemberImage(memno);
		model.addAttribute("memberImg", memberImg);
		model.addAttribute("memno", memno);

		// 황세림 - 회원 주문정보 리스트 가져오기
		List<Order> orderList = memberService.getOrderListInMypage(memno);
		List<PointDtl> pointDtlList = new ArrayList<>();
		
		if(orderList.size() != 0) {
			// 주문에 상품의 수 그리고 그 들중 한 상품에 대한 정보를 찾아서 Order객체에 넣어준다.
			for (Order order : orderList) {
				log.info(""+order);
				// 주문 상품정보를 넣어주기
				int ordno = order.getOrdno();
				Order outlineOrder = orderService.getOrderProductCnt(ordno);
				
				order.setOneofordproduct(outlineOrder.getOneofordproduct());
				order.setOrdproductcnt(outlineOrder.getOrdproductcnt());
				
				Product product = itemService.getProductByProdno(order.getOneofordproduct());
				
				order.setOneproduct(product);
				
				//황세림 - 주문상태의 정보를 가져오기
				//주문번호를 주어졌을때 포인트 이력(사용, 적립)을 가져온다.
				PointDtl usedPointDtl = memberService.getPointDtlListByOrdno(order.getOrdno(), 1);

				PointDtl rewardPointDtl = memberService.getPointDtlListByOrdno(order.getOrdno(), 0);

				// 포인트 이력에서 일자를 찾기 위해 주문번호를 넘겨 해당 주문정보를 받아오는 메소드를 호출한다.
				Order orderForDate = memberService.getOrderByOrdno(order.getOrdno());
				

				if (usedPointDtl != null) {
					usedPointDtl.setDate(orderForDate.getOrddate());
					usedPointDtl.setActionStr("사용");
					log.info("사용내역" + usedPointDtl);
					pointDtlList.add(usedPointDtl);
				}
				if (rewardPointDtl != null) {
					rewardPointDtl.setDate(orderForDate.getOrddate());
					rewardPointDtl.setActionStr("적립");
					log.info("사용내역" + rewardPointDtl);
					pointDtlList.add(rewardPointDtl);
				}
			}
			model.addAttribute("orderList", orderList);
			model.addAttribute("pointDtlList", pointDtlList);
		}

		return "mypage/mypage";
	}
	
	//멤버 이미지 다운로드
	@GetMapping("/downloadMemImg")
	public void downloadMemberImg(int memno, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Member member = memberService.getMemberImage(memno);
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
	
	@Secured("ROLE_USER")
	//기존의 사용자 정보를 불러온다.
	@GetMapping("/edit_user_info")
	public String editUserInfo(Authentication authentication, Model model) {
		String mid = authentication.getName();
		Member member = memberService.getMemberByMid(mid);
		MemberAdr memberAdr = memberService.getMemberAdr(member.getMemno());


		model.addAttribute("member", member);
		model.addAttribute("memberAdr", memberAdr);

		return "mypage/edit_user_info";
	}
	
	@Secured("ROLE_USER")
	//황세림 - 사용자 정보 수정
	@RequestMapping("/update_user_info")
	public String updateMemberInformation(Member member, MemberAdr memberadr, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
	/*	log.info(member.toString());
		log.info(memberadr.toString());*/

		//이미지 수정
		if(member.getMemimgattach() !=null && !member.getMemimgattach().isEmpty()) {
			member.setMemimgoname(member.getMemimgattach().getOriginalFilename());
			member.setMemimgtype(member.getMemimgattach().getContentType());
			try {
				member.setMemimg(member.getMemimgattach().getBytes());
			} catch (Exception e) {
			}
		}

		memberService.updateMemberByMemno(member);
		memberService.updateMemberAdr(memberadr);


		return  "redirect:/mypage";
	}




}



