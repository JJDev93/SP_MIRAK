package kr.co.mirak.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.mirak.member.MemberService;
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
			@PathVariable("cart_start") Date cart_start, @PathVariable("cart_day") String cart_day) {
		String mem_id = (String) session.getAttribute("mem_id");
		if (mem_id == null) {
			String preUrl = "/product/" + pro_code;
			session.setAttribute("pre_url", preUrl);
			return "redirect:/login";
		}
//		productVO.setCart_start(Date.valueOf(cart_start));
//		productVO.setCart_day(cart_day);
		System.out.println("확인 : " + productVO);

		// 회원
		model.addAttribute("memberVO", memberService.getMemberInfo(session));

		// pro or cart
		model.addAttribute("codecheck", 0);

		// 품목
		productVO = productService.productDetail(productVO);
		model.addAttribute("productList", payService.payFromProduct(productVO, cart_cnt, cart_start, cart_day));

		return "pay/pay";
	}

	// 카트에서 넘어올때
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public String cartpay(Model model, ProductVO productVO, HttpSession session) {

		// 회원정보
		model.addAttribute("memberVO", memberService.getMemberInfo(session));

		// 상품정보 (수량넘어옴)
		// payvo 넘겨서 수량,

		model.addAttribute("codecheck", 1);
		model.addAttribute("productList", payService.cartCheckList(session));

		return "pay/pay";
	}

	@RequestMapping(value = "/payInfo", method = RequestMethod.GET)
	public String payApproval(Model model, HttpSession session) {

		model.addAttribute("payVOList", payService.getClientPayList(session));

		return "pay/payInfo";
	}

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

	@RequestMapping(value = "/paySubmit", method = RequestMethod.POST)
	public String mypage(PayStringVO payStringVO, HttpSession session) {

		// 결제 DB 추가

		System.out.println(payStringVO);
		List<PayVO> list = payService.adaptPayVO(payStringVO, session);

		// 실제 결제

		// mypage 결제내역으로 이동 아직 페이지 없음
		return "redirect:/mypage";
	}

	@RequestMapping("/admin/pays")
	public String getAdminPayList(Model model) {

		List<PayVO> payList = payService.getAdminPayList();

		model.addAttribute("payList", payList);

		return "pay/adminPayments";
	}

	@RequestMapping(value = "/admin/pays/{group_id}", method = RequestMethod.GET)
	@ResponseBody
	public List<PayVO> getAdminPayListDetail(Model model, @PathVariable("group_id") String group_id) {

		List<PayVO> payListDetail = payService.getPayListDetail(group_id);

		return payListDetail;
	}

	@RequestMapping(value = "/admin/charts", method = RequestMethod.GET)
	public String chartList(Model model) throws Exception {

		return "pay/adminChartList";
	}

	@ResponseBody
	@RequestMapping(value = "/admin/charts", produces = "application/json;charset=UTF-8", method = RequestMethod.POST)
	public String chartList(ChartData chartData, TotalByMenuVO mvo, TotalByDayVO dvo) throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();

		Map<String, List<Object>> totalBymenulist = chartService.getTotalByMenuList(mvo);
		Map<String, List<Object>> totalByDayList = chartService.getTotalByDayList(dvo);

		chartData.setTotalByMenuList(totalBymenulist);
		chartData.setTotalByDayList(totalByDayList);

		String data = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(chartData);
		System.out.println(data);

		return data;
	}

}