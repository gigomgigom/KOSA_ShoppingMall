package com.mycompany.javajavajo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.javajavajo.dto.Category;
import com.mycompany.javajavajo.dto.Delivery;
import com.mycompany.javajavajo.dto.DeliveryCom;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.OrdProd;
import com.mycompany.javajavajo.dto.OrdStts;
import com.mycompany.javajavajo.dto.Order;
import com.mycompany.javajavajo.dto.Orderer;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.PointDtl;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;
import com.mycompany.javajavajo.dto.Qna;
import com.mycompany.javajavajo.dto.Recipient;
import com.mycompany.javajavajo.dto.SearchIndex;
import com.mycompany.javajavajo.service.AdminService;
import com.mycompany.javajavajo.service.PagerService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@Secured("ROLE_ADMIN")
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private PagerService pagerService;

	//메뉴바를 눌렀을때 세션에 저장되어있는 페이저 인덱스 초기화 를 위한 요청 메소드
	@GetMapping("/move_nav_location")
	public String moveNavLocation(String url, HttpSession session) {

		//세션 데이터 삭제
		session.removeAttribute("searchIndex");
		
		//매개값으로 전달받은 url로 다시 재요청하도록 재요청 주소를 생성함
		String requestUrl = "redirect:/admin/"+url;
		return requestUrl;
	}

	//Main페이지 이동 컨트롤러(DashBoard)
	@RequestMapping("/main")
	public String adminMain(Model model) {
		//재고 부족 상품 가져오기
		List<Product> lackProducts = adminService.getOutOfStock();
		//판매량 기준 베스트 상품 가져오기
		List<Product> bestProducts = adminService.getBestSoldProducts();

		//이번 주 주문 현황 데이터 가져오기
		int weeklyTotOrd = adminService.getWeeklyTotalOrd();
		int weeklyNoneDelivery = adminService.getWeeklyNonDel();
		int weeklyRdyDelivery = adminService.getWeeklyRdyDel();

		//매출 현황 데이터 가져오기
		int todaySales = adminService.getTodaySales();
		int monthSales = adminService.getMonthSales();
		int maxDaySales = adminService.getMaxDaySales();
		
		//Model 영역에 이번주 주문 현황 데이터들을 넣기 위해 Map타입 객체를 만들어둠
		Map<String, Integer> thisWeekOrdInfo = new HashMap<>();
		thisWeekOrdInfo.put("weeklyTotOrd", weeklyTotOrd);
		thisWeekOrdInfo.put("weeklyNoneDelivery", weeklyNoneDelivery);
		thisWeekOrdInfo.put("weeklyRdyDelivery", weeklyRdyDelivery);
		//Model 영역에 매출 현황 데이터들을 넣기 위해 Map타입 객체를 만들어둠
		Map<String, Integer> salesInfo = new HashMap<>();
		salesInfo.put("todaySales", todaySales);
		salesInfo.put("monthSales", monthSales);
		salesInfo.put("maxDaySales", maxDaySales);
		
		//JSP에 전달할 데이터들을 Model로 전달
		model.addAttribute("thisWeekOrdInfo", thisWeekOrdInfo);
		model.addAttribute("salesInfo", salesInfo);
		model.addAttribute("bestProducts", bestProducts);
		model.addAttribute("lackproducts", lackProducts);
		model.addAttribute("menuNum", -1);
		return "admin/adminMain";
	}
	//-----------------------------------------------------------------------------------------
	//회원관리 컨트롤러
	@GetMapping("/admin_member_view")
	public String adminMemberView(Model model, HttpSession session, SearchIndex searchIndex) {

		//세션에 저장되어있는 SearchIndex 데이터를 가져오기
		SearchIndex sessionSearchIndex = (SearchIndex) session.getAttribute("searchIndex");
		//세션에 저장되어있는 SearchIndex DTO객체와 파라미터로 전달받은 SearchIndex DTO객체를 대조해서 쿼리문에 전달할 SearchIndex 객체를 Set한다.
		searchIndex = pagerService.setSearchIndex(searchIndex, sessionSearchIndex);
		//그렇게 찾은 SearchIndex DTO 객체 내부에 존재하는 페이지 번호를 Int형으로 변환한다. (페이지 번호가 Pager객체 생성자에 필요한 매개값들중 하나이기 때문에)
		int intPageNo = Integer.parseInt(searchIndex.getPageno());
		//검색조건들이 담긴 SearchIndex DTO객체를 통해 DB에서 도출된 데이터 행의 수를 가져온다.
		int rowsPagingTarget = adminService.getTotalMemberRows(searchIndex);
		//요청 페이지번호와 검색결과 행 수들을 통해 Pager 객체를 생성한다.
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);
		//생성된 Pager객체를 SearchIndexDTO 객체 내부 필드에 set해준다.
		searchIndex.setPager(pager);
		//SearchIndex 내부의 검색조건들과 Pager객체를 통해 조건에 해당하는 회원(MemberDto)들의 리스트를 받아온다.
		List<Member> memberList = adminService.getMemberList(searchIndex);
		//다음 요청작업에서도 검색결과가 유지될 수 있도록 세션에 SearchIndex 객체를 등록시킨다.
		session.setAttribute("searchIndex", searchIndex);
		//찾아온 회원정보리스트들을 JSP파일에 보내기위해 Model에 저장한다.
		model.addAttribute("memberList", memberList);
		//0번 아코디언이 확장되어 보여줄 수 있도록 모델에 menuNum을 지정해준다.
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
		//회원 포인트 내역(PointDtl DTO)을 담을 수 있는 List타입의 객체를 생성한다.
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
			
			//포인트를 사용했는데 결제금액이 없어서 적립 포인트가 없는 경우 또는 포인트를 사용하지 않았고 포인트 적립이 이루어진 경우를 반영하기 위해 작성했다.
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
	public String updateMember(Member member) {
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
	public String productList(SearchIndex searchIndex, Model model, HttpSession session) {
		//세션에 등록되어있는 SearchIndex 객체를 받아온다.
		SearchIndex sessionSearchIndex = (SearchIndex) session.getAttribute("searchIndex");
		//세션에 등록되어있는 SearchIndex 객체와 파라미터로 받아온 SearchIndex객체를 대조하여 검색에 반영할 SearchIndex객체를 세팅해준다.
		searchIndex = pagerService.setSearchIndex(searchIndex, sessionSearchIndex);
		
		//검색 작업을 하기전에 SearchIndex객체 내부의 페이지번호를 1로 초기화 시켜주는 작업
		if(searchIndex.getSearchkeyword() != null && !searchIndex.getSearchkeyword().equals("") && searchIndex.getCtgindex() != sessionSearchIndex.getCtgindex()) {
			searchIndex.setPageno("1");
		}
		//그렇게 찾은 SearchIndex DTO 객체 내부에 존재하는 페이지 번호를 Int형으로 변환한다. (페이지 번호가 Pager객체 생성자에 필요한 매개값들중 하나이기 때문에)
		int intPageNo = Integer.parseInt(searchIndex.getPageno());
		//검색조건들이 담긴 SearchIndex DTO객체를 통해 DB에서 도출된 데이터 행의 수를 가져온다.
		int rowsPagingTarget = adminService.getTotalProductRows(searchIndex);
		//요청 페이지번호와 검색결과 행 수들을 통해 Pager 객체를 생성한다.
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);
		//생성된 Pager객체를 SearchIndexDTO 객체 내부 필드에 set해준다.
		searchIndex.setPager(pager);
		session.setAttribute("searchIndex", searchIndex);
		//SearchIndex 내부의 검색조건들과 Pager객체를 통해 조건에 해당하는 회원(MemberDto)들의 리스트를 받아온다.
		List<Product> productList = adminService.getProductList(searchIndex);
		model.addAttribute("productList", productList);

		List<Category> ctgList = adminService.getAllCategory();
		model.addAttribute("ctgList", ctgList);

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

	//상품 수정 삭제
	@PostMapping(value="/edit_product")
	@ResponseBody
	public String edit_product(Product product, ProductImg prodimg) {
		log.info(product.toString());
		////DTO에 추가 설정(첨부파일의 정보들을 DB에 저장)
		//대표사진 추가 설정
		if(prodimg.getRepattach() != null && !prodimg.getRepattach().isEmpty()) {
			prodimg.setRepimgoname(prodimg.getRepattach().getOriginalFilename());
			log.info(prodimg.getRepimgoname());
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
		product.setProductImg(prodimg);

		String result = "fail";
		int updatedRows = adminService.editProduct(product);

		if(updatedRows > 0) {
			result = "success";
		}
		return result;
	}
	//상품 삭제 작업
	@PostMapping("/delete_product")
	@ResponseBody
	public String deleteProduct(int prodno) {

		String result = "fail";
		int deletedRow = adminService.deleteProduct(prodno);

		if(deletedRow > 0) {
			result = "success";
		}
		return result;
	}
	//상품 추가 페이지 이동
	@GetMapping("/add_product")
	public String addProduct(Model model) {
		model.addAttribute("menuNum", 1);
		return "admin/product/admin_add_product";
	}
	//상품 추가 작업
	@PostMapping("/adding_product")
	@ResponseBody
	public String addingProduct(Product product, ProductImg prodimg) {
		log.info(product.toString());
		if(prodimg.getRepattach() != null && !prodimg.getRepattach().isEmpty()) {
			prodimg.setRepimgoname(prodimg.getRepattach().getOriginalFilename());
			log.info(prodimg.getRepimgoname());
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
		product.setProductImg(prodimg);

		String result = "fail";
		int insertedRow = adminService.addProduct(product);

		if(insertedRow > 0) {
			result = "success";
		}
		return result;
	}

	//----------------------------------------------------------------------------
	//주문관리 컨트롤러
	//미완료 주문 리스트 화면으로 이동
	@GetMapping("/uncom_order")
	public String uncomOrder(SearchIndex searchIndex, Model model, HttpSession session) {

		SearchIndex sessionSearchIndex = (SearchIndex) session.getAttribute("searchIndex");
		
		searchIndex = pagerService.setSearchIndex(searchIndex, sessionSearchIndex);

		int intPageNo = Integer.parseInt(searchIndex.getPageno());

		int rowsPagingTarget = adminService.getTotalUncomRows(searchIndex);
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);

		searchIndex.setPager(pager);
		session.setAttribute("searchIndex", searchIndex);

		List<Order> ordList = adminService.getUncomOrderList(searchIndex);
		//--위의 코드들은 다른 테이블화면과 가져오는 방식이 동일함
		//가져온 ordList내부에 존재하는 OrderDto객체가 갖는 주문번호를 통해 주문자, 수령인, 주문상품정보(전부 DTO로 받음)들을 찾아서 해당 OrderDTO객체 내부에 set해준다.
		for(Order order : ordList) {
			order.setOrderer(adminService.getOrdererByOrdno(order.getOrdno()));
			order.setRecipient(adminService.getRcptByOrdno(order.getOrdno()));
			order.setOrdproductcnt(adminService.getOrderProductCnt(order.getOrdno()).getOrdproductcnt());
		}
		//데이터베이스에 존재하는 주문상태정보들의 리스트를 받아온다.
		List<OrdStts> ordSttsList = adminService.getOrdSttsList();

		model.addAttribute("ordSttsList", ordSttsList);
		model.addAttribute("totRows", rowsPagingTarget);
		model.addAttribute("pager", pager);
		model.addAttribute("ordList", ordList);
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_uncom_order";
	}
	//완료 및 취소된 주문 리스트 페이지 이동 (현재 사용X 미완료 주문화면에 병합시킴.)
	@GetMapping("/com_order")
	public String comOrder(Model model, String pageNo, HttpSession session) {
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("comPageNo");
			if(pageNo == null) {
				pageNo="1";
			}
		}

		session.setAttribute("comPageNo", pageNo);
		int intPageNo = Integer.parseInt(pageNo);

		int rowsPagingTarget = adminService.getTotalComRows();
		log.info(rowsPagingTarget+"");
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);

		List<Order> ordList = adminService.getComOrderList(pager);

		for(Order order : ordList) {
			order.setOrderer(adminService.getOrdererByOrdno(order.getOrdno()));
			order.setRecipient(adminService.getRcptByOrdno(order.getOrdno()));
			order.setOrdproductcnt(adminService.getOrderProductCnt(order.getOrdno()).getOrdproductcnt());
		}

		model.addAttribute("totRows", rowsPagingTarget);
		model.addAttribute("pager", pager);
		model.addAttribute("ordList", ordList);
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_com_order";
	}
	//주문 상세 페이지 이동
	@GetMapping("/order_detail")
	public String orderDetail(int ordno, Model model) {

		Map<String, Object> orderInfoMap = new HashMap<String, Object>();

		//주문상태 종류 가져오기
		List<OrdStts> ordSttsList = adminService.getOrdSttsList();
		orderInfoMap.put("ordSttsList", ordSttsList);

		//주문정보 가져오기
		Order order = adminService.getOrderByOrdno(ordno);
		orderInfoMap.put("order", order);

		//주문상품목록 가져오기
		List<OrdProd> ordProdList = adminService.getOrdProdList(ordno);
		orderInfoMap.put("ordProdList", ordProdList);

		//주문자정보 가져오기
		Orderer orderer = adminService.getOrdererByOrdno(ordno);
		orderInfoMap.put("orderer", orderer);

		//수령인정보 가져오기
		Recipient rcpt = adminService.getRcptByOrdno(ordno);
		orderInfoMap.put("rcpt", rcpt);

		//배송정보 가져오기
		Delivery del = adminService.getDeliveryInfoByOrdno(ordno);
		//만약 해당 주문건이 갖고 있는 배송정보가 존재하지않는다면 Model에 넣을 데이터에 배송정보를 제외한다.
		if(del != null) {
			orderInfoMap.put("delivery", del);
		}

		//배송회사 정보 가져오기
		List<DeliveryCom> delComList = adminService.getDelComList();
		orderInfoMap.put("delComList", delComList);

		model.addAttribute("orderInfoMap", orderInfoMap);
		model.addAttribute("menuNum", 2);
		return "admin/order/admin_order_detail";
	}
	//주문 상태 및 배송정보 수정
	@PostMapping("/updateStatus")
	@ResponseBody
	public String updateStatus(Order order, Delivery del) {
		log.info(order.toString() + del.toString());
		int updatedRow = adminService.updateStatus(order, del);

		String result = "fail";

		if(updatedRow > 0) {
			result = "success";
		}
		return result;
	}
	//Q&A 게시판으로 이동
	@GetMapping("/qna_board")
	public String qnaBoard(Model model, SearchIndex searchIndex, HttpSession session) {

		SearchIndex sessionSearchIndex = (SearchIndex) session.getAttribute("searchIndex");

		searchIndex = pagerService.setSearchIndex(searchIndex, sessionSearchIndex);

		int intPageNo = Integer.parseInt(searchIndex.getPageno());
		
		int rowsPagingTarget = adminService.getTotalQnaRows(searchIndex);
		Pager pager = new Pager(10, 10, rowsPagingTarget, intPageNo);

		searchIndex.setPager(pager);
		session.setAttribute("searchIndex", searchIndex);
		
		List<Qna> qnaList = adminService.getQnaList(searchIndex);

		model.addAttribute("totRows", rowsPagingTarget);
		model.addAttribute("pager", pager);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("menuNum", 3);

		return "admin/board/admin_qna_board";
	}
}
