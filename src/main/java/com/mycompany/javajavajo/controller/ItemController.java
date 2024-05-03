package com.mycompany.javajavajo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	@RequestMapping("/item_list")
	public String itemList(int ctgno, Model model) {
		List<Product> itemList = service.getItemListByCtgno(ctgno);
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
