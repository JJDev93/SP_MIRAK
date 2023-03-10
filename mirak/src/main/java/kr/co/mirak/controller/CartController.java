package kr.co.mirak.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.cart.CartService;
import kr.co.mirak.cart.CartVO;

@Controller
public class CartController {
	
	@Autowired 
	private CartService service;
	
	@RequestMapping(value = "/cartClientList", method = RequestMethod.POST)	// client cart
	public String cartList(Model model, CartVO vo, HttpSession session) {
		
		String mem_id = (String)session.getAttribute("mem_id");
		vo.setMem_id(mem_id);
		
		System.out.println(mem_id + "의 카트 리스트");
		
		List<CartVO> list = service.cartClientList(vo);
		model.addAttribute("cartList", list);
		System.out.println(list);
		return "cart/cart";
	}
	
	@RequestMapping(value = "/cartAdminList", method = RequestMethod.POST)	// admin cart
	public String cartList2(Model model) {
		List<CartVO> list = service.cartAdminList();
		model.addAttribute("cartList", list);
		return "cart/cart_admin";
	}
	
	@RequestMapping(value = "/goPay", method = RequestMethod.POST)	// 결제하기
	public String goPay(Model model, HttpSession session) {

		model.addAttribute("CartVO", "");

		return "pay/pay";
	}
	
}