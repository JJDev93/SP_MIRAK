package kr.co.mirak.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;


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
	public String cartInsert(CartVO vo, HttpSession session, Model model, @PathVariable("pro_code") String pro_code, @PathVariable("cart_cnt") int cart_cnt, @PathVariable("cart_start") Date cart_start, @PathVariable("cart_day") String cart_day) throws UnsupportedEncodingException {
		String mem_id = (String) session.getAttribute("mem_id");
		if (mem_id == null) {
			String preUrl = "/cart/" + pro_code + "/" + cart_cnt + "/" + cart_start + "/" + URLEncoder.encode(cart_day, "UTF-8");
			session.setAttribute("pre_url", preUrl);
			session.setAttribute("message", "로그인 후 이용해주세요.");
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
	@RequestMapping(value = "/cartUpdate")
	public String cartUpdate(CartVO vo) {
		String str1 = vo.getCart_day();
		String str2 = str1.replaceAll(",", "");
		vo.setCart_day(str2);
		cartService.cartUpdate(vo);
		return "redirect:/cart";
	}

	// Admin 리스트
	   @RequestMapping("/admin/carts/{page}")
	   public String cartAdminList(CartVO vo, Model model, CriteriaC cri, @PathVariable("page") int page) {
		  cri.setPageNum(page);
	      model.addAttribute("cartList", cartService.getListPaging(cri));
	      model.addAttribute("curPage", page);
	      int total = cartService.getTotal();
	      PageMakerDTOC pageMake = new PageMakerDTOC(cri, total);
	      model.addAttribute("pageMaker", pageMake);
	      return "/cart/cart_admin";
	   }
	   
	// Admin 상세 페이지
	   @RequestMapping(value = "/admin/cart/{curPage}/{cart_code}")
	   public String cartDetail(CartVO vo, Model model, CriteriaC cri, @PathVariable("curPage") int curPage) {
	      model.addAttribute("cart", cartService.cartDetail(vo));
	      model.addAttribute("curPage", curPage);
	      cartService.cartDetail(vo);
	          
	      int total = cartService.getTotal();
	      PageMakerDTOC pageMake = new PageMakerDTOC(cri, total);
	      model.addAttribute("pageMaker", pageMake);

	      return "/cart/cart_adminDetail";
	   }
	
	   
	// Admin 카트 진짜 삭제
		@RequestMapping(value = "/admin/cartAdminDelete")
		public String cartAdminDelete(CartVO vo) {
			cartService.cartAdminDelete(vo);
			return "redirect:/admin/carts/1";
		} 
		
	// Admin update
		@RequestMapping(value = "/admin/cartUpdate")
		public String cartAdminUpdate(CartVO vo) {
			String str1 = vo.getCart_day();
			String str2 = str1.replaceAll(",", "");
			vo.setCart_day(str2);
			cartService.cartAdminUpdate(vo);
			return "redirect:/admin/carts/1";
		}
		
	// Admin 에서 회원정보 열람
		@RequestMapping(value="/admin/cartmember/{curPage}/{mem_code}", method=RequestMethod.GET)	
		public String adminMemDetail2(MemberVO mvo, Model model, @PathVariable("mem_code") String mem_code, @PathVariable("curPage") int curPage) {
			System.out.println("====== 관리자 회원 상세페이지로 이동 ======");
			mvo.setMem_code(Integer.parseInt(mem_code));
			model.addAttribute("cartmember", cartService.adminMemberDetail2(mvo));
			model.addAttribute("curPage", curPage);
			return "member/admin_member_detail";
		}
		
		
	   

	@RequestMapping(value = "/goPay", method = RequestMethod.POST)   // 결제하기
	public String goPay(Model model, HttpSession session) {

		model.addAttribute("CartVO", "");

		return "/cartpay";
	}

}