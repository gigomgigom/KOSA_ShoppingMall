package com.mycompany.javajavajo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Product;

@Mapper
public interface CartItemDao {
	
	//권우상 - memno에 해당하는 모든 cartitem select 
	List<CartItem> selectByMemno(int memno);
	
	//권우상 - memno와 prodno 둘다 일치하는 cartitem을 찾아 operator에 따라 + 혹은 - 연산을 해준다
	int updateCart(@Param("memno") int memno, @Param("prodno") int prodno, @Param("operator") String operator);
	
	//권우상 - int형 배열에 prodno를 담아 memno에 해당하면서 배열에 들어있는 prodno도 만족하는 모든 cartitem을 삭제한다
	int deleteCartItems(@Param("memno") int memno, @Param("prodnos")int[] prodnos);
	
	// 신우호 - memNo를 사용하여 cartItem목록을 불러옴
	List<CartItem> selectCartItemByMemNo(int memNo);

	// 신우호 - 상품번호를 사용해 상품들의 정보를 불러옴
	Product selectProductByprodNo(int prodNo);
	
	// 신우호 - 카트아이템을 사용해 정보들을 넣어줌
	int insertCartItems(CartItem cartItem);

	// 신우호 - 중복 아이템이 추가될 시 수량을 증가시킴
	public int updateByAddQty(int qty);

	// 신우호 - 카트아이템정보로 회원번호와 상품번호를 넣어줌
	CartItem insertCartItem(int memNo, int prodno);
	
	// 신우호 - 장바구니 카트아이템 추가
	int insertCartItem(CartItem cartItem);
	
	// 신우호 - 장바구니 같은 아이템 추가 시 아이템 업데이트
	int updateCartItem(CartItem cartItem);

	

	

}
