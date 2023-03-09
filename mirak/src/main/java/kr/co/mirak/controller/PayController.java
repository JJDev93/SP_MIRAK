package kr.co.mirak.controller;

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
import kr.co.mirak.member.MemberVO;
import kr.co.mirak.pay.PayService;
import kr.co.mirak.pay.PayVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PayController {
   @Autowired
   private PayService payService;
   @Autowired
   private MemberService memberService;
   
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   /**
    * Simply selects the home view to render by returning its name.
    */

   @RequestMapping(value = "/pay", method = RequestMethod.GET)
   public String getPay(HttpSession session) {
      session.setAttribute("mem_id", "abc@naver.com");
      return "pay/forDevPay";
   }

   // 상품에서 바로 넘어올때
   @RequestMapping(value = "/pay", method = RequestMethod.POST)
   public String postPay(Model model, PayVO payVO, MemberVO vo ,HttpSession session) {
      MemberVO member = memberService.getMemberInfo(session);
       model.addAttribute("member", member);
      model.addAttribute("payVO", payVO);
      return "pay/pay";
   }

   // 카트에서 넘어올때
   @RequestMapping(value = "/Cartpay", method = RequestMethod.POST)
   public String cartpay(Model model, HttpSession session) {
      
      

      model.addAttribute("payVO", "");

      return "pay/pay";
   }

//   @RequestMapping(value = "/payApproval", method = RequestMethod.GET)
//   public String payApproval(Model model) {
//      return "pay/payApproval";
//   }

   @RequestMapping(value = "/payCancel", method = RequestMethod.GET)
   public String payCancel(Model model) {
      return "pay/payCancel";
   }

   @RequestMapping(value = "/payFail", method = RequestMethod.GET)
   public String payFail(Model model) {
      return "pay/payFail";
   }

   @RequestMapping(value = "pay/asdf", method = RequestMethod.POST)
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
   public String mypage(PayVO payVO) {

      // 실제 결제

      // 결제 DB 추가

      // mypage 결제내역으로 이동 아직 페이지 없음
      return "redirect:/mypage";
   }

}