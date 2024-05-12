package com.mycompany.javajavajo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.Delivery;

@Mapper
public interface DeliveryDao {
	//심영조 - admin-orderdetail 배송정보가져오기위해 사용
	Delivery selectDeliveryByOrdno(int ordno);

}
