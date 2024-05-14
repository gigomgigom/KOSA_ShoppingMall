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
		// cartItem(jsp에서 form으로 전달받은 cartItem)
		public String cartCart(Authentication authentiaction, Model model, CartItem cartItem) {
			Tm1UserDetails t1UserDetails = (Tm1UserDetails) authentiaction.getPrincipal();
			int memNo = t1UserDetails.getMember().getMemno();
			log.info("" + memNo);
			log.info("" + cartItem);
			Cart cart = service.getCartByMemNo(memNo);
			if(cart == null) {
				// 카트가 없을경우 카트를 새로 만들어 줘야 함
				service.createCart(memNo);
				cart = service.getCartByMemNo(memNo);
			}
			// 들어온 아이템이 카트에 있는지 알기위함 (dto객체로 받은 CartItem)
			List<CartItem> cartItemList = service.getCartItemListByMemNo(memNo);
			
			// 중복인 상품이 들어있을 경우 (여기 다시 복습해야할 듯 합니다. 너무 이해가 안됩니다.)
			boolean productCheck = false;
			for(CartItem cartItemIn : cartItemList) {
			// prodNo = 기본키 (유니크), 같으면 같은 아이템을 의미, 다르면 서로 다른 아이템을 의미
				if(cartItem.getProdno() == cartItemIn.getProdno()) {
					// 들어있는 상품이라고 알려준다.
					productCheck = true;
				}
			}
			// 기존에 있던 상품이라면 선택한 수량만큼 카트아이템의 수량을 증가시킴 (update해줌)
			if(productCheck == true) {
				cartItem.setMemno(memNo);
				service.addQty(cartItem);
			// 기존에 있던 상품이 아니라면 새로운 데이터를 추가 후 수량을 넣어줌
				// update , insert  cartItem(dto) cartItem에 회원번호를 담아야 함.
			}else {
				cartItem.setMemno(memNo);
				// cartItem (dto = 수량, 회원번호, 상품번호를 보내줌)
				service.addCartItem(cartItem);
			}
			return "redirect:/cart";
		}
}
