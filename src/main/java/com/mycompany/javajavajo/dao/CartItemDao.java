package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.CartItem;

@Mapper
public interface CartItemDao {

	List<CartItem> selectByMemno(int memno);

	int updatePlus(int prodno);

	int updateMinus(int prodno);

	int deleteCartItems(@Param("memno") int memno, @Param("prodnos")int[] prodnos);

}
