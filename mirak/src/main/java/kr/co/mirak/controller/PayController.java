package kr.co.mirak.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.HomeController;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.pay.PayService;
import kr.co.mirak.pay.PayStringVO;
import kr.co.mirak.pay.PayVO;
import kr.co.mirak.product.ProductService;
import kr.co.mirak.product.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PayController {
	@Autowired
	private PayService payService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String getPay(HttpSession session) {
		session.setAttribute("mem_id", "abc@naver.com");
		//session.invalidate();
		return "pay/forDevPay";
	}

	// 상품에서 바로 넘어올때
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public String postPay(Model model, ProductVO productVO, HttpSession session) {
		
		//회원정보
	    model.addAttribute("memberVO", memberService.getMemberInfo(session));
	    
	    //상품정보 (수량넘어옴)
	    // payvo 넘겨서 수량, 
	    int cnt = productVO.getCart_cnt();
	    productVO = productService.productDetail(productVO);
	    productVO.setCart_cnt(cnt);
	    List<ProductVO> list = new ArrayList<ProductVO>();
	    list.add(productVO);
	    
	    model.addAttribute("codecheck", 0);
	    model.addAttribute("productList", list);
	    
		
		
		return "pay/pay";
	}

	// 카트에서 넘어올때
	@RequestMapping(value = "/cartpay", method = RequestMethod.POST)
	public String cartpay(Model model, ProductVO productVO, HttpSession session) {
		
		//회원정보
	    model.addAttribute("memberVO", memberService.getMemberInfo(session));
	    
	    //상품정보 (수량넘어옴)
	    // payvo 넘겨서 수량, 
	    
	    model.addAttribute("codecheck", 1);
	    model.addAttribute("productList", payService.cartCheckList(session));
	    


		return "pay/pay";
	}

//	@RequestMapping(value = "/payApproval", method = RequestMethod.GET)
//	public String payApproval(Model model) {
//		return "pay/payApproval";
//	}

	@RequestMapping(value = "/payCancel", method = RequestMethod.GET)
	public String payCancel(Model model) {
		return "pay/payCancel";
	}

	@RequestMapping(value = "/payFail", method = RequestMethod.GET)
	public String payFail(Model model) {
		return "pay/payFail";
	}

	@RequestMapping(value = "/pay/asdf", method = RequestMethod.POST)
	public String home(PayVO payVO) {
		System.out.println(payVO);
		payService.insert(payVO);

		return "redirect:payList";
	}

	@RequestMapping("/pay/payList")
	public String getEmpList(Model model) {

		List<PayVO> list = payService.list();
		model.addAttribute("payList", list);
		return "pay";
	}

	@RequestMapping(value = "/paySubmit", method = RequestMethod.POST)
	public String mypage(PayStringVO payStringVO, HttpSession session) {

		// 결제 DB 추가
		
		System.out.println(payStringVO);
		List<PayVO> list = payService.adaptPayVO(payStringVO, session);
 
		// 실제 결제
		
		
		
		
		// mypage 결제내역으로 이동 아직 페이지 없음
		return "redirect:/mypage";
	}

}
