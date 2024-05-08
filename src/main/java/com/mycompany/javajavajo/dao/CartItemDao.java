package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.CartItem;

@Mapper
public interface CartItemDao {
	
	//권우상 - memno에 해당하는 모든 cartitem select 
	List<CartItem> selectByMemno(int memno);
	
	//권우상 - memno와 prodno 둘다 일치하는 cartitem을 찾아 operator에 따라 + 혹은 - 연산을 해준다
	int updateCart(@Param("memno") int memno, @Param("prodno") int prodno, @Param("operator") String operator);
	
	//권우상 - int형 배열에 prodno를 담아 memno에 해당하면서 배열에 들어있는 prodno도 만족하는 모든 cartitem을 삭제한다
	int deleteCartItems(@Param("memno") int memno, @Param("prodnos")int[] prodnos);

}
