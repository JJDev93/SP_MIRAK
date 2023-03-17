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
   @RequestMapping(value = "/cart/{pro_code}/{cart_cnt}")
   public String cartInsert(CartVO vo, HttpSession session, Model model, @PathVariable("pro_code") String pro_code, @PathVariable("cart_cnt") String cart_cnt) {
      vo.setPro_code(pro_code);
      cartService.cartInsert(vo, session);
      return "redirect:/cart";
   }
   
   // delete
   @RequestMapping(value = "/cartdelete")
   public String cartDelete(CartVO vo, HttpSession session, Model model, @PathVariable("cart_code") int cart_code) {
	  vo.setCart_code(cart_code);
      cartService.cartDelete(vo, session);
      return "redirect:/cart";
   }
   
   // update
   @RequestMapping(value = "/cart/{cart_day}/{cart_cnt}")
   public String cartUpdate(CartVO vo, HttpSession session, Model model, @PathVariable("cart_day") String cart_day, @PathVariable("cart_cnt") String cart_cnt) {
	  vo.setCart_day(cart_day);
	  cartService.cartUpdate(vo, session);
	  return "redirect:/cart";
   }
   
   // admin list select
   @RequestMapping(value = "/cartAdminList", method = RequestMethod.GET)
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