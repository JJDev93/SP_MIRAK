//package kr.co.mirak.controller;
//
//import java.text.DateFormat;
//import java.util.Date;
//import java.util.List;
//import java.util.Locale;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import kr.co.mirak.HomeController;
//import kr.co.mirak.pay.PayService;
//import kr.co.mirak.pay.PayVO;
//
///**
// * Handles requests for the application home page.
// */
//@Controller
//public class LoginController {
//	@Autowired
//	private LoginController service;
//	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	
//	/**
//	 * Simply selects the home view to render by returning its name.
//	 */
//	@RequestMapping(value = "/member", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
//	
	
//	@RequestMapping("/pay/payList")
//	public String getEmpList(Model model) {
//		
//		List<PayVO> list = service.list();
//		model.addAttribute("payList", list);
//		return "pay";
//	}
//}
