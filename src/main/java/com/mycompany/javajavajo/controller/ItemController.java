package com.mycompany.javajavajo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.dto.ProductImg;
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
	public String itemDetail() {
		return "item/item_detail";
	}
	
	@RequestMapping("/item_info")
	public String itemInfo(Model model) {
		return "item/item_info";
	}
	@RequestMapping("/item_review")
	public String itemReview(Model model) {
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
	//세림 : 아래 경로를 요청하여 카테고리 번호를 넘겨 받음
	@RequestMapping("/item_list")
	public String itemList(int ctgno, Model model) {
		List<Product> itemList = service.getItemListByCtgno(ctgno);
		model.addAttribute("ctgno", ctgno);
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
