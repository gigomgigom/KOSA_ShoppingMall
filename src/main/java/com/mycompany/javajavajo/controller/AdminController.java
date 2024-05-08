package com.mycompany.javajavajo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//Main페이지 이동 컨트롤러
	@RequestMapping("/main")
	public String adminMain(Model model) {
		List<Product> lackProducts = adminService.getOutOfStock();
		
		model.addAttribute("lackproducts", lackProducts);
		model.addAttribute("menuNum", -1);
		return "admin/adminMain";
	}
	
	//회원관리 컨트롤러
	@GetMapping("/admin_member_view")
	public String adminMemberView(String pageNo, Model model, HttpSession session) {
		if(pageNo == null) {
			//pageNo를 받지 못했을 경우 세션에 저장되어 있는 값을 가져와서 확인한다.
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo == null) {
				//세션에 마저도 pageNo가 저장되어있지 않다면 "1"로 강제 세팅
				pageNo="1";
			}
		}
		//세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);
		int intPageNo = Integer.parseInt(pageNo);
		
		int rowsPagingTarget = adminService.getTotalRows();
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);
		
		
		List<Member> memberList = adminService.getMemberList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("memberList", memberList);
		
		model.addAttribute("menuNum", 0);
		return "admin/member/admin_member";
	}
	
	@RequestMapping("/member_detail")
	public String memberDetail(Model model, int memno) {
		Member member = adminService.getMemberByMemno(memno);
		
		model.addAttribute("menuNum", 0);
		model.addAttribute("member", member);
		return "admin/member/admin_member_detail";
	}
	
	//문제 발생 메소드
	@RequestMapping("/update_member")
	public String updateMember(Member member,  Model model) {
		/*Member member = new Member();
		member.setMememail(mememail);
		member.setMemtel(memtel);
		member.setMemno(memno);*/
		//log.info(member.getMemid());
		//log.info(member.getMememail());
		adminService.editMemberInfo(member);
		return "redirect:/admin/admin_member_view";
	}
	
	//상품관리 컨트롤러
	@GetMapping("/product_list")
	public String productList(Model model) {
		model.addAttribute("menuNum", 1);
		return "admin/product/admin_product_list";
	}
	
	@GetMapping("/product_detail")
	public String productDetail(Model model) {
		model.addAttribute("menuNum", 1);
		return "admin/product/admin_product_detail";
	}
	
	@GetMapping("/add_product")
	public String addProduct(Model model) {
		model.addAttribute("menuNum", 1);
		return "admin/product/admin_add_product";
	}
	
	//주문관리 컨트롤러
	@GetMapping("/uncom_order")
	public String uncomOrder(Model model) {
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_uncom_order";
	}
	
	@GetMapping("/com_order")
	public String comOrder(Model model) {
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_com_order";
	}
	
	@GetMapping("/order_detail")
	public String orderDetail(Model model) {
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_order_detail";
	}
}
