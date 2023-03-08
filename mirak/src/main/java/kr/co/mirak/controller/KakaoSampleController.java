package kr.co.mirak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class KakaoSampleController {

	@Autowired
    private KakaoPay kakaopay;
    
	@RequestMapping(value = "/kakaoPay", method = RequestMethod.GET)
    public String kakaoPayGet(Model model) {
        return "pay/kakaoPay";
    }
	
    
	@RequestMapping(value = "/kakaoPay", method = RequestMethod.POST)
    public String kakaoPay() {
        System.out.println("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
	@RequestMapping(value = "/payApproval", method = RequestMethod.GET)
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        System.out.println("payApproval get............................................");
        System.out.println("payApproval pg_token : " + pg_token);
        
    }
	
	
	
}
