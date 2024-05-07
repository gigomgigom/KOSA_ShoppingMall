package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dto.Product;

@Service
public class ItemListService {
	@Autowired
	ProductDao productDao;
	
	public List<Product> getItemListByCtgno(int ctgno) {
		List<Product> itemList = productDao.selectByCtgno(ctgno);
		return itemList;
	}

}
