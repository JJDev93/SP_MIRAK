package kr.co.mirak.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.cart.CartService;
import kr.co.mirak.cart.CartVO;
import kr.co.mirak.cart.CriteriaC;
import kr.co.mirak.cart.PageMakerDTOC;

@Controller
public class CartController {
	@Autowired 
	private CartService cartService;

	// list select
	@RequestMapping(value = "/cart", method = RequestMethod.GET)   
	public String getCartList(CartVO vo, Model model, HttpSession session) {
		String mem_id = (String)session.getAttribute("mem_id");
		vo.setMem_id(mem_id);
		model.addAttribute("cartList", cartService.cartClientList(vo));
		return "cart/cart";
	}

	// insert
	@RequestMapping(value = "/cart/{pro_code}/{cart_cnt}/{cart_start}/{cart_day}")
	public String cartInsert(CartVO vo, HttpSession session, Model model, @PathVariable("pro_code") String pro_code, @PathVariable("cart_cnt") int cart_cnt, @PathVariable("cart_start") Date cart_start, @PathVariable("cart_day") String cart_day) {
		String mem_id = (String) session.getAttribute("mem_id");
		if (mem_id == null) {
			String preUrl = "/cart/" + pro_code;
			session.setAttribute("pre_url", preUrl);
			return "redirect:/login";
		}
		vo.setPro_code(pro_code);
		cartService.cartInsert(vo, session);
		return "redirect:/cart";
	}

	// delete (실제로는 show만 0으로 바꿈)
	@RequestMapping(value = "/cart/cartDelete/{cart_code}")
	public String cartDelete(CartVO vo, @PathVariable("cart_code") int cart_code) {
		cartService.cartDelete(vo);
		return "redirect:/cart";
	}   
	
	// update
	@RequestMapping(value = "/cartUpdate/{cart_code}")
	public String cartUpdate(CartVO vo, @PathVariable("cart_code") int cart_code) {
		String str1 = vo.getCart_day();
		String str2 = str1.replaceAll(",", "");
		vo.setCart_day(str2);
		cartService.cartUpdate(vo);
		return "redirect:/cart";
	}


	// admin list select
	@RequestMapping(value = "/admin/carts", method = RequestMethod.GET)
	public String cartList2(Model model,CriteriaC cri) {
		model.addAttribute("cartList", cartService.getListPaging(cri));

		int total = cartService.getTotal();
		PageMakerDTOC pageMake = new PageMakerDTOC(cri, total);
		model.addAttribute("pageMaker", pageMake);

		return "cart/cart_admin";
	}

	@RequestMapping(value = "/goPay", method = RequestMethod.POST)   // 결제하기
	public String goPay(Model model, HttpSession session) {

		model.addAttribute("CartVO", "");

		return "/cartpay";
	}

}