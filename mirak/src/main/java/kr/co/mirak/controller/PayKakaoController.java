package kr.co.mirak.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mirak.pay.PayVO;
import kr.co.mirak.pay.paymethod.ApproveResponse;
import kr.co.mirak.pay.paymethod.KakaoPayService;
import kr.co.mirak.pay.paymethod.PayKakaoOrderVO;
import kr.co.mirak.pay.paymethod.PayKakaoVO;
import kr.co.mirak.pay.paymethod.ReadyResponse;

@Controller
public class PayKakaoController {
	@Autowired
	private KakaoPayService kakaoPayService;

	private static final Logger logger = LoggerFactory.getLogger(PayKakaoController.class);

	// 카카오페이결제 요청
	@RequestMapping(value = "/order/pay", method = RequestMethod.GET)
	public @ResponseBody ReadyResponse payReady(Model model, PayKakaoOrderVO payKakaoOrderVO, HttpSession session) {
		
		System.out.println("ajax 페이지 넘어감");
		System.out.println(payKakaoOrderVO);
		List<PayKakaoVO> list = kakaoPayService.productToOrder(payKakaoOrderVO, session);
		
		// 카카오 결제 준비하기 - 결제요청 service 실행.
		ReadyResponse readyResponse = kakaoPayService.payReady(list, session);
		System.out.println("처리됨?");
		// 요청처리후 받아온 결재고유 번호(tid)를 모델에 저장
		model.addAttribute("tid", readyResponse.getTid());
		logger.info("결재고유 번호: " + readyResponse.getTid());
		// Order정보를 모델에 저장

		return readyResponse; // 클라이언트에 보냄.(tid,next_redirect_pc_url이 담겨있음.)
	}

	// 결제승인요청
	@RequestMapping(value = "/order/pay/completed", method = RequestMethod.GET)
	public String payCompleted(String pg_token, Model model, HttpSession session) {

		PayKakaoVO payKakaoVO = kakaoPayService.selectTid(session);


		// 카카오 결재 요청하기
		ApproveResponse approveResponse = kakaoPayService.payApprove(payKakaoVO, pg_token);

		// 5. payment 저장
		// orderNo, payMathod, 주문명.
		// - 카카오 페이로 넘겨받은 결재정보값을 저장.
		System.out.println(approveResponse);

		return "pay/payApproval";
	}

	// 결제 취소시 실행 url
	@RequestMapping("/order/pay/cancel")
	public String payCancel(HttpSession session) {
		kakaoPayService.payCancel(session);
		
		
		return "pay/payCancel";
	}
	
	

	// 결제 실패시 실행 url
	@RequestMapping("/order/pay/fail")
	public String payFail() {
		return "redirect:/carts";
	}
}
