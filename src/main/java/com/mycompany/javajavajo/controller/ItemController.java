package com.mycompany.javajavajo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.service.ItemListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	ItemListService service;
	
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
}
