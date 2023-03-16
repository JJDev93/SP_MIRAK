package kr.co.mirak;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mirak.product.Criteria;
import kr.co.mirak.product.ProductService;
import kr.co.mirak.product.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
	
	@RequestMapping("/byGet")
	public String resultByGet(String key1, String key2, Model model) {
		
		System.out.println("Get key1 : " + key1);
		System.out.println("Get key2 : " + key2);
		
		model.addAttribute("key1", key1 );
		model.addAttribute("key2", key2 );
		
		return "RestfulExample/path";
	}
	
	// PathVariable 방식
	@RequestMapping("/page/{var}")
	public String page(@PathVariable("var") String var1) {
		String returnUrl = "";
		if(var1.equals("one")) {
			returnUrl = "RestfulExample/page1";
		} else if(var1.equals("two")) {
			returnUrl = "RestfulExample/page2";
		}		
		return returnUrl;
	}
	
	@RequestMapping("/byPath/{key1}/{key2}")
	public String resultByGet(@PathVariable String key1, @PathVariable String key2) {
		
		System.out.println("Path key1 :: " + key1);
		System.out.println("Path key2 :: " + key2);

		return "RestfulExample/path";
	}
	
	@RequestMapping("/byPath/key1/{key1}/key2/{key2}")
	public String resultByPath2(@PathVariable String key1, @PathVariable String key2) {
		
		System.out.println("Path key1 ::: " + key1);
		System.out.println("Path key2 ::: " + key2);

		return "RestfulExample/path";
	}
	
}
