package kr.co.mirak.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.mirak.cart.CartService;
import kr.co.mirak.cart.CartVO;
import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;
import kr.co.mirak.pay.CriteriaP;
import kr.co.mirak.pay.PageMakerDTOP;
import kr.co.mirak.pay.PayService;
import kr.co.mirak.pay.PayStringVO;
import kr.co.mirak.pay.PayVO;
import kr.co.mirak.pay.chart.ChartData;
import kr.co.mirak.pay.chart.ChartService;
import kr.co.mirak.pay.chart.TotalByDayVO;
import kr.co.mirak.pay.chart.TotalByMenuVO;
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
	@Autowired
	private ChartService chartService;
	@Autowired 
	private CartService cartService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String getPay() {

		return "redirect:/";
	}

	@RequestMapping(value = "/pay/{pro_code}/{cart_cnt}/{cart_start}/{cart_day}", method = RequestMethod.GET)
	public String getPayFromProduct(Model model, ProductVO productVO, HttpSession session,
			@PathVariable("pro_code") String pro_code, @PathVariable("cart_cnt") String cart_cnt,
			@PathVariable("cart_start") String cart_start, @PathVariable("cart_day") String cart_day) throws UnsupportedEncodingException {
		String mem_id = (String) session.getAttribute("mem_id");
		if (mem_id == null) {
			String preUrl = "/pay/" + pro_code + "/" + cart_cnt + "/" + cart_start + "/" + URLEncoder.encode(cart_day, "UTF-8");
			session.setAttribute("pre_url", preUrl);
			return "redirect:/login";
		}
		
		System.out.println(pro_code + ", " + cart_cnt + ", " + cart_start + ", " + cart_day);
		
		String dayWeek = "월화수목금토일";
		int j = 0;
		for(int i=0; i<cart_day.length(); i++) {
			if(dayWeek.indexOf(cart_day.charAt(i)) == -1) {
				System.out.println("어디서1 cart_day.charAt(i): " + cart_day.charAt(i));
				return "redirect:/";
			}
			
			if(j < dayWeek.indexOf(cart_day.charAt(i))) {
				System.out.println("어디서2 j: " + j + ", cart_day.charAt(i): " + cart_day.charAt(i));
				return "redirect:/";
			}
			
			j = cart_day.charAt(i);
			
		}
		
		
		System.out.println("확인 : " + productVO);

		// 회원
		model.addAttribute("memberVO", memberService.getMemberInfo(session));

		// pro or cart
		model.addAttribute("codecheck", 0);

		// 품목
		productVO = productService.productDetail(productVO);
		model.addAttribute("productList", payService.payFromProduct(productVO, cart_cnt, Date.valueOf(cart_start), cart_day));

		return "pay/pay";
	}

	// 카트에서 넘어올때
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public String cartpay(Model model, ProductVO productVO, CartVO cartVO, HttpServletRequest request, HttpSession session) {
		String[] cart_checks = request.getParameterValues("cart_check");
		String mem_id = (String)session.getAttribute("mem_id");
		System.out.println(mem_id);
		cartVO.setMem_id(mem_id);
		cartService.cartUpdateCheckAll(cartVO);
		for (int i = 0; i < cart_checks.length; i++) {
			System.out.println("카트 코드 : " + cart_checks[i]);
			cartVO.setCart_code(Integer.parseInt(cart_checks[i]));
			cartService.cartUpdateCheck(cartVO);
		}
		
		// 회원정보
		model.addAttribute("memberVO", memberService.getMemberInfo(session));

		// 상품정보 (수량넘어옴)
		// payvo 넘겨서 수량,

		model.addAttribute("codecheck", 1);
		model.addAttribute("productList", payService.cartCheckList(session));

		return "pay/pay";
	}

	@RequestMapping(value = "/payInfo", method = RequestMethod.GET)
	public String payInfo(Model model, HttpSession session) {
		
		model.addAttribute("payVOList", payService.getClientPayList(session));

		return "pay/payInfo";
	}

	@RequestMapping(value = "/payDetailInfo/{group_id}", method = RequestMethod.GET)
	public String payDetailInfo(Model model, HttpSession session, @PathVariable String group_id) {
		System.out.println("group_id : " + group_id);

		
		model.addAttribute("payVOList", payService.getProductInfo(group_id));
		

		return "pay/payDetailInfo";
	}

	@RequestMapping(value = "/payCancel", method = RequestMethod.GET)
	public String payCancel(Model model) {
		return "pay/payCancel";
	}

	@RequestMapping(value = "/payFail", method = RequestMethod.GET)
	public String payFail(Model model) {
		return "pay/payFail";
	}
	
	@RequestMapping(value = "/payConfirm/{group_id}", method = RequestMethod.GET)
	public String payConfirm(Model model, @PathVariable String group_id) {
		
		int result = payService.updateStateConfirm(group_id);
		
		return "redirect:/payInfo";
	}


	@RequestMapping(value = "/paySubmit", method = RequestMethod.POST)
	public String mypage(PayStringVO payStringVO, HttpSession session) {

		// 결제 DB 추가

		List<PayVO> list = payService.adaptPayVO(payStringVO, session);

		// 실제 결제

		// mypage 결제내역으로 이동 아직 페이지 없음
		return "redirect:/mypage";
	}

	@RequestMapping("/admin/pays")
	public String getAdminPayList(PayVO payVO, Model model, CriteriaP criP) {

		model.addAttribute("payList", payService.getAdminPayList(criP));
		int total = payService.getTotal();
		PageMakerDTOP pageMake = new PageMakerDTOP(criP, total);
		
		model.addAttribute("pageMake", pageMake);

		return "pay/adminPayments";
	}

	@RequestMapping(value = "/admin/pays/{group_id}", method = RequestMethod.GET)
	@ResponseBody
	public List<PayVO> getAdminPayListDetail(Model model, @PathVariable("group_id") String group_id) {

		List<PayVO> payListDetail = payService.getPayListDetail(group_id);
		return payListDetail;
	}
	
	@RequestMapping(value = "/admin/pays/{group_id}/updateStatus", produces = "application/json;charset=UTF-8", method = RequestMethod.PUT)
	@ResponseBody
	public List<PayVO> updateStatus(@PathVariable("group_id") String group_id, CriteriaP criP) {
		
		System.out.println("group_id는 ~~~~~~~~~~~~~ "+ group_id);
	    int result = payService.updateStatus(group_id);

	    if (result > 0) {
	        System.out.println("배송시작 완료");
	        List<PayVO> payListDetail = payService.getAdminPayList(criP);
	        return payListDetail;
	    } else {
	        System.out.println("결제 상태 변경에 실패했습니다.");
	        throw new RuntimeException("결제 상태 변경에 실패했습니다.");
	    }
	}


	@RequestMapping(value = "/admin/charts", method = RequestMethod.GET)
	public String chartList(Model model) throws Exception {

		return "pay/adminChartList";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/charts", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public String chartList() throws Exception {

		ChartData chartData = new ChartData();
	    ObjectMapper objectMapper = new ObjectMapper();

	    TotalByMenuVO mvo = new TotalByMenuVO();
	    TotalByDayVO dvo = new TotalByDayVO();

		Map<String, List<Object>> totalBymenulist = chartService.getTotalByMenuList(mvo);
		Map<String, List<Object>> totalByMonthList = chartService.getTotalByMonthList(dvo);

		chartData.setTotalByMenuList(totalBymenulist);
		chartData.setTotalByMonthList(totalByMonthList);

		String data = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(chartData);
		System.out.println(data);

		return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/charts/getTotalByDayList/{clickedMonth}", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
	public String getTotalByDayList(@PathVariable String clickedMonth) throws Exception {
	    TotalByDayVO dvo = new TotalByDayVO();
	    dvo.setPay_date(clickedMonth);
	    Map<String, List<Object>> totalByDayList = chartService.getTotalByDayList(dvo, clickedMonth);

	    ObjectMapper objectMapper = new ObjectMapper();
	    String data = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(totalByDayList);
	    System.out.println(data);

	    return data;
	}
	
	@ResponseBody
	@RequestMapping(value = "/admin/charts/getTotalByMenuList/{clickedMenu}", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
	public String getTotalByEachMenu(@PathVariable String clickedMenu) throws Exception {
		TotalByDayVO dvo = new TotalByDayVO();
		Map<String, List<Object>> totalByEachMenu = chartService.getTotalByEachMenu(dvo, clickedMenu);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String data = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(totalByEachMenu);
		System.out.println(data);
		
		return data;
	}


}