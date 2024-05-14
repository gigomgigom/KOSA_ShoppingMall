package com.mycompany.javajavajo.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.javajavajo.dto.Cart;
import com.mycompany.javajavajo.dto.CartItem;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Product;
import com.mycompany.javajavajo.security.Tm1UserDetails;
import com.mycompany.javajavajo.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private CartService service;
	
	//권우상 - 쇼핑카트 불러오기
	@RequestMapping("")
	public String shoppingCart(Authentication authentication, Model model) {
		//로그인한 유저의 Memno를 얻어옴
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    Member member = t1UserDetails.getMember();
	    
	    //멤버 번호에 해당하는 카트아이템을 불러와서 request범위로 저장
	    Cart cart = service.findCart(member.getMemno());
	    List<CartItem> cartItems = service.findCartItems(cart.getMemno());
	    model.addAttribute("cartItems", cartItems);
	
	    return "/cart/cart";
	}
	
	//권우상 - 카트아이템 수량 업데이트 컨트롤러
	@PostMapping(value="/update_cart", produces="application/json; charset=UTF-8")
	@ResponseBody()
	public String updateCart(Authentication authentication, int prodno, String operator) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    Member member = t1UserDetails.getMember();
	    int memno = member.getMemno();
		int result = service.updateCart(memno, prodno, operator);
		
		String jsonResult = (result > 0) ? "success" : "fail";
		JSONObject jo = new JSONObject();
		jo.put("result", jsonResult);
		return jo.toString();
	}
	
	//권우상 - 카트아이템 삭제 컨트롤러
	@PostMapping(value="/delete_cart_items", produces="application/json; charset=UTF-8")
	@ResponseBody()
	public String deleteCartItems(Authentication authentication, @RequestParam(value="prodnos[]")int[] prodnos) {
		Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentication.getPrincipal();
	    Member member = t1UserDetails.getMember();
	    int memno = member.getMemno();
		int result = service.deleteCartItems(memno, prodnos);
		
		String jsonResult = (result > 0) ? "success" : "fail";
		JSONObject jo = new JSONObject();
		jo.put("result", jsonResult);
		return jo.toString();
	}
	
	// 신우호 - 장바구니 추가할 시 카트페이지 이동
		@PostMapping("/cartAdd")
		public String cartCart(Authentication authentiaction, Model model, CartItem cartItem) {
			Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentiaction.getPrincipal();
			int memNo = t1UserDetails.getMember().getMemno();
			Product product = service.getproductByprodNo(cartItem.getProdno());
			cartItem.setProduct(product);
			cartItem.setMemno(memNo);
			service.registCartItem(cartItem);
			//카트아이템을 리스트로 가져오기(멤버의 기본키를 이용해서)
			/*List<CartItem> cartItemList = service.getCartItemListByMemNo(memNo);
			//카트 리스트를 for문을 돌려서 product를 set해주기
			for(CartItem cartItem1 : cartItemList) {
				//카트아이템의 prodno를 int타입 변수에 저장해준다.
				int prodNo = cartItem1.getProdno();
				//prodno을 이용해서 product를 찾아준다.
				Product product = service.getproductByprodNo(prodNo);
				//찾은 product를 카트아이템의 product에 세팅해준다.
				cartItem.setProduct(product);
				log.info("ww" + cartItem);
			}
			model.addAttribute("cartItemList", cartItemList);*/
			return "redirect:/cart";
		}

}
