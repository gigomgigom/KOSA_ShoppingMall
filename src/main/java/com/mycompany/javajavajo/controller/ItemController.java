package com.mycompany.javajavajo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;
import com.mycompany.javajavajo.dto.Review;
import com.mycompany.javajavajo.security.Tm1UserDetails;
import com.mycompany.javajavajo.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ItemService service;
	
	//세림씨 숙제에요!
	//1. itemList.jsp에서 'item_detail'URL로 요청했을때 prodno(상품번호)를 전달한다.
	//2. 요청매핑메소드(아래 메소드)에서 service의 메소드를 호출하며 prodno(상품번호)를 전달한다.
	//   뭘 하기 위해서? 상품번호에 해당하는 상품의 정보들을 가져오기 위해서(그럼 리턴타입이 어떻게 되야할까?)
	
	//다음단계는 ItemService로!
	@RequestMapping("/item_detail")
	public String itemDetail(int prodno, Model model,  Authentication authentication) {
		log.info("hi");
		//권우상 - 유저의 로그인 여부를 파악 이는 상품 상세 페이지에서 장바구니 추가, 바로 구매 시 스프링 시큐리티 처리를 위해 존재함
		boolean isLogin = false;
		if(authentication != null) {
			isLogin = true;
		}
		Product product = service.getProductByProdno(prodno);
		model.addAttribute("product", product);
		model.addAttribute("isLogin", isLogin);
		return "item/item_detail";
	}
	
	
	@RequestMapping("/item_info")
	public String itemInfo(Model model, int prodno) {
		Product product = new Product();
		product.setProdno(prodno);
		model.addAttribute("product", product);
		return "item/item_info";
	}
	// 신우호 - 
	@RequestMapping("/item_review")
	public String itemReview(Model model, int prodno) {
		log.info("aJax" + prodno);
		List<Review> reviewList = service.getReviewListByProdNo(prodno);
		for(Review review : reviewList) {
			log.info("내용: " + review.getRvcontent());
		}
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("prodno", prodno);
		return "item/item_review";
	}
	
	@RequestMapping("/item_qa")
	public String itemQa(Model model) {
		return "item/item_qa";
	}
	@RequestMapping("/item_delievery")
	public String itemDelievery(Model model) {
		return "item/item_delievery";
	}
	
	//위 경로로 요청했을 때 카테고리번호를 넘겨받는다.
	//Service의 메소드 이름은 getItemListByCtgno이다.
	//권우상 - 카테고리 번호, 페이지 번호, 검색어, 정렬 조건을 받아 그에 맞게 상품 리스트를 받아옴
	@RequestMapping("/item_list")
	public String itemList(int ctgno, String pageNo, String keyword, String sorting,
				HttpSession session,Model model) {
		//권우상 - 페이지 네이션시 페이지 번호
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
		}
		
		//권우상 - 검색어 유지를 위한 변수
		if(keyword == null) {
			keyword = (String) session.getAttribute("keyword");
		}
		
		//권우상 - 정렬 기준 유지를 위한 변수
		if(sorting == null) {
			sorting = (String) session.getAttribute("sorting");
		}
		
		// 세션에 페이지 번호, 검색어, 정려조건 변수를 선언하고 값을 할당
		session.setAttribute("pageNo", pageNo);
		session.setAttribute("keyword", keyword);
		session.setAttribute("sorting", sorting);
		
		// pageNo를 정수형으로 변환
		int intPageNo = Integer.parseInt(pageNo);
		// Pager 객체 생성
		int rowsPagingTarget = service.getTotalRows(ctgno,keyword);
		log.info(rowsPagingTarget+"");
		Pager pager = new Pager(8, 5, rowsPagingTarget, intPageNo);
		List<Product> itemList = service.getItemListByCtgno(ctgno,keyword,sorting,pager);
		model.addAttribute("ctgno", ctgno);
		model.addAttribute("pager",pager);
		model.addAttribute("itemList", itemList);
		return "item/itemList";
	}
	
	//대표이미지를 다운로드
	@GetMapping("/downloadRepimg")
	public void downloadRepimg(int prodno, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		ProductImg productRepImg = service.getProductImages(prodno);
		log.info("run");
		byte[] repimgData = productRepImg.getRepimg();
		
		
		response.setContentType(productRepImg.getRepimgtype());
		String fileName = new String(productRepImg.getRepimgoname().getBytes("UTF-8"),"ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");
		if(repimgData == null) {
			log.info("null"); 
		}
		log.info("run2");
		OutputStream os = response.getOutputStream();
		os.write(repimgData);
		os.flush();
		os.close();
	}
	
	//상세이미지를 다운로드
	@GetMapping("/downloadDtlimg")
	public void downloadDtlimg(int prodno, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ProductImg productRepImg = service.getProductImages(prodno);
		byte[] dtlimgData = productRepImg.getDtlimg();
		
		response.setContentType(productRepImg.getDtlimgtype());
		String fileName = new String(productRepImg.getDtlimgoname().getBytes("UTF-8"),"ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileName+"\"");
		if(dtlimgData == null) {
			log.info("null");
		}
		OutputStream os = response.getOutputStream();
		os.write(dtlimgData);
		os.flush();
		os.close();
	}
	
	
}
