package kr.co.mirak.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorHandler {
    
//	@RequestMapping("/error")
//	public String errorview() {
//		System.out.println("error 이동");
//		return "error";
//	}
	
	@RequestMapping("/error404")
	public ModelAndView error404(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("code", "ERROR_404");
        mav.addObject("message", "NotFoundException occurred");
        mav.setViewName("error");
        System.out.println(mav);
		return mav;
	}
	@RequestMapping("/error400")
	public ModelAndView error400(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("code", "ERROR_400");
        mav.addObject("message", "IllegalArgumentException occurred");
        mav.setViewName("error");
        System.out.println(mav);
		return mav;
	}
	
	@RequestMapping("/error500")
	public ModelAndView error500(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("code", "ERROR_500");
        mav.addObject("message", "NullPointerException occurred");
        mav.setViewName("error");
        System.out.println(mav);
		return mav;
	}
    
    
	
	
	// NullPointerException 발생 예시
    @RequestMapping("/500")
    public String test1() {
        String str = null;
        str.length(); 
        return "error";
    }
    //404
    @RequestMapping("/404")
    public String test2() {
        // some logic
        return "404";
    }
    //400
    @RequestMapping("/400")
    public String test(@RequestParam("id") String id) {
        if (!id.matches("\\d+")) {
            throw new IllegalArgumentException("Invalid ID: " + id);
        }
        // ...
        return "success";
    }
}