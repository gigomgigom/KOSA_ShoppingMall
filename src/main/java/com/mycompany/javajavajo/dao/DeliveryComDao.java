package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.DeliveryCom;

@Mapper
public interface DeliveryComDao {

	List<DeliveryCom> selectDelComList();

}
