package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.javajavajo.dto.OrdStts;

@Mapper
public interface OrdSttsDao {

	List<OrdStts> selectAllStts();

}
