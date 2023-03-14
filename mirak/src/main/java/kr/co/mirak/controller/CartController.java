package kr.co.mirak.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.cart.CartService;
import kr.co.mirak.cart.CartVO;
import kr.co.mirak.member.MemberService;

@Controller
public class CartController {
	@Autowired 
	private CartService cartService;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)   
	public String getCartList(CartVO vo, Model model, HttpSession session) {
		String mem_id = (String)session.getAttribute("mem_id");
		if(mem_id == null) {
			return "/login";
		}else {
		    vo.setMem_id(mem_id);
			model.addAttribute("cartList", cartService.cartClientList(vo));
			return "cart/cart";
		}
	}

	@RequestMapping(value = "/cart/{pro_code}/{cart_cnt}", method = RequestMethod.GET)
	public String cartList(CartVO vo, HttpSession session, Model model, @PathVariable("pro_code") String pro_code, @PathVariable("cart_cnt") String cart_cnt) {
		String mem_id = (String)session.getAttribute("mem_id");
		if(mem_id == null) {
			String preUrl = "/cart/" + pro_code + "/" + cart_cnt;
			session.setAttribute("pre_url", preUrl);
			return "redirect:/login";
		}
		vo.setPro_code(pro_code);
		cartService.insert(vo, session);
		return "redirect:/cart";
	}


	@RequestMapping(value = "/admin/carts", method = RequestMethod.GET)
	public String cartList2(Model model) {
		List<CartVO> list = cartService.cartAdminList();
		model.addAttribute("cartList", list);
		return "cart/cart_admin";
	}

	@RequestMapping(value = "/goPay", method = RequestMethod.POST)   // 결제하기
	public String goPay(Model model, HttpSession session) {

		model.addAttribute("CartVO", "");

		return "/cartpay";
	}

}