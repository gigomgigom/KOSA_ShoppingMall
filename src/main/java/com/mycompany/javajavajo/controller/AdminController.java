package com.mycompany.javajavajo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.javajavajo.dto.Category;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.PointDtl;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;
import com.mycompany.javajavajo.service.AdminService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	//Main페이지 이동 컨트롤러(DashBoard)
	@RequestMapping("/main")
	public String adminMain(Model model) {
		List<Product> lackProducts = adminService.getOutOfStock();

		model.addAttribute("lackproducts", lackProducts);
		model.addAttribute("menuNum", -1);
		return "admin/adminMain";
	}
	//-----------------------------------------------------------------------------------------
	//회원관리 컨트롤러
	@GetMapping("/admin_member_view")
	public String adminMemberView(String pageNo, Model model, HttpSession session) {
		if(pageNo == null) {
			//pageNo를 받지 못했을 경우 세션에 저장되어 있는 값을 가져와서 확인한다.
			pageNo = (String) session.getAttribute("memberPageNo");
			if(pageNo == null) {
				//세션에 마저도 pageNo가 저장되어있지 않다면 "1"로 강제 세팅
				pageNo="1";
			}
		}
		//세션에 pageNo 저장
		session.setAttribute("memberPageNo", pageNo);
		int intPageNo = Integer.parseInt(pageNo);

		int rowsPagingTarget = adminService.getTotalMemberRows();
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);


		List<Member> memberList = adminService.getMemberList(pager);

		model.addAttribute("pager", pager);
		model.addAttribute("memberList", memberList);

		model.addAttribute("menuNum", 0);
		return "admin/member/admin_member";
	}

	//회원 상세정보 보기
	@RequestMapping("/member_detail")
	public String memberDetail(Model model, int memno) {
		//회원 데이터가져오기
		Member member = adminService.getMemberByMemno(memno);
		//회원 주문정보 리스트 가져오기
		List<Order> orderList = adminService.getOrderListByMemno(memno);

		List<PointDtl> pointDtlList = new ArrayList<>();

		//주문에 상품의 수 그리고 그 들중 한 상품에 대한 정보를 찾아서 Order객체에 넣어준다.
		for(Order order : orderList) {
			//주문마다 몇개의 상품을 구매했는지 찾는다.
			int ordno = order.getOrdno();
			Order outlineOrderProduct = adminService.getOrderProductCnt(ordno);
			//주문의 총상품 수를 Order객체에 넣어준다.
			order.setOrdproductcnt(outlineOrderProduct.getOrdproductcnt());
			//주문한 상품들 중 하나를 찾아서 oneOfProduct에 넣어준다.
			Product oneOfProduct = adminService.getProductByProdNo(outlineOrderProduct.getOneofordproduct());
			order.setOneproduct(oneOfProduct);



			//주문번호를 주어졌을때 포인트 이력(사용, 적립)을 가져온다.
			PointDtl usedPointDtl = adminService.getPointDtlListByOrdno(order.getOrdno(), 1);
			PointDtl rewardPointDtl = adminService.getPointDtlListByOrdno(order.getOrdno(), 0);
			//포인트 이력에서 일자를 찾기 위해 주문번호를 넘겨 해당 주문정보를 받아오는 메소드를 호출한다.
			Order orderForDate = adminService.getOrderByOrdno(order.getOrdno());

			if(usedPointDtl != null) {
				usedPointDtl.setDate(orderForDate.getOrddate());
				pointDtlList.add(usedPointDtl);
			}
			if(rewardPointDtl != null) {
				rewardPointDtl.setDate(orderForDate.getOrddate());
				pointDtlList.add(rewardPointDtl);
				
			}
		}

		model.addAttribute("menuNum", 0);
		model.addAttribute("member", member);
		model.addAttribute("orderList", orderList);
		model.addAttribute("pointDtlList", pointDtlList);
		return "admin/member/admin_member_detail";
	}

	//회원 상세정보 보기 - 회원 정보 변경(수정)
	@RequestMapping("/update_member")
	public String updateMember(Member member,  Model model) {
		adminService.editMemberInfo(member);
		return "redirect:/admin/admin_member_view";
	}

	//회원 상세정보 보기 - 회원 비밀번호 초기화
	@RequestMapping("/reset_password")
	public String resetPassword(int memno) {
		Member member = new Member();
		member.setMemno(memno);
		log.info(member.getMemno()+"");
		adminService.resetPassword(member);
		return "redirect:/admin/admin_member_view";
	}

	//회원 상세정보 보기 - 회원 마일리지 수정
	@PostMapping("/edit_point")
	public String editPoint(Member member) {
		adminService.editPoint(member);
		return "redirect:/admin/admin_member_view";
	}
	//-----------------------------------------------------------------------------------------
	//상품관리 컨트롤러
	//상품 리스트 출력하기
	@GetMapping("/product_list")
	public String productList(Model model, String pageNo, HttpSession session) {
		if(pageNo == null) {
			//pageNo를 받지 못했을 경우 세션에 저장되어 있는 값을 가져와서 확인한다.
			pageNo = (String) session.getAttribute("productPageNo");
			if(pageNo == null) {
				//세션에 마저도 pageNo가 저장되어있지 않다면 "1"로 강제 세팅
				pageNo="1";
			}
		}
		//세션에 pageNo 저장
		session.setAttribute("productPageNo", pageNo);
		int intPageNo = Integer.parseInt(pageNo);

		int rowsPagingTarget = adminService.getTotalProductRows();
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);

		List<Product> productList = adminService.getProductList(pager);


		model.addAttribute("pager", pager);
		model.addAttribute("productList", productList);

		model.addAttribute("menuNum", 1);
		return "admin/product/admin_product_list";
	}
	
	//상품 재고 수정
	@PostMapping("/updateProdStock")
	public String editProdStock(Product product) {
		adminService.editProdStock(product);
		return "redirect:/admin/product_list";
	}
	
	//상품 수정 화면으로 이동
	@GetMapping("/product_detail")
	public String productDetail(int prodno, Model model) {
		Product product = adminService.getProductByProdno(prodno);
		List<Category> ctg = adminService.getAllCategory();
		model.addAttribute("ctgList", ctg);
		model.addAttribute("product", product);
		model.addAttribute("menuNum", 1);
		return "admin/modal/admin_product_detail";
	}
	
	@PostMapping(value="/edit_product", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String edit_product(Product product) {
		log.info(product.toString());
		////DTO에 추가 설정(첨부파일의 정보들을 DB에 저장)
		/*//대표사진 추가 설정, @RequestBody ProductImg prodimg
		if(prodimg.getRepattach() != null && !prodimg.getRepattach().isEmpty()) {
			prodimg.setRepimgoname(prodimg.getRepattach().getOriginalFilename());
			prodimg.setRepimgtype(prodimg.getRepattach().getContentType());
			try {
				prodimg.setRepimg(prodimg.getRepattach().getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//상세사진 추가 설정
		if(prodimg.getDtlattach() != null && !prodimg.getDtlattach().isEmpty()) {
			prodimg.setDtlimgoname(prodimg.getDtlattach().getOriginalFilename());
			prodimg.setDtlimgtype(prodimg.getDtlattach().getContentType());
		
			try {
				prodimg.setDtlimg(prodimg.getDtlattach().getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		product.setProductImg(prodimg);*/
		
		//int result = adminService.editProduct(product);
		return "success";
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
