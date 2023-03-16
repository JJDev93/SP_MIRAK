package kr.co.mirak.pay.paymethod;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import kr.co.mirak.pay.PayVO;

@Service
public class KakaoPayService {

	private static final String HOST = "https://kapi.kakao.com";

	private static ReadyResponse readyResponse;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ReadyResponse payReady(List<PayKakaoVO> list, HttpSession session) {
		long currentTimeMillis = System.currentTimeMillis();
		Random random = new Random();
		int randomInt = random.nextInt(1000);
		String groupId = Long.toString(currentTimeMillis) + Long.toString(randomInt);

		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println("mem_id : " + mem_id);
		String item_name = "";

		if (list.size() - 1 == 0) {
			item_name = list.get(0).getPro_name();
		} else {
			item_name = list.get(0).getPro_name() + " 외 " + (list.size() - 1) + "개 품목";
		}

		int quantity = 0;

		// 총액(결제액)
		int total_amount = 0;

		for (int i = 0; i < list.size(); i++) {
			quantity += list.get(i).getCart_cnt();
			total_amount += list.get(i).getTotalPrice();
		}

		// 카카오가 요구한 결제요청request값을 담아줍니다.
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", groupId);
		parameters.add("partner_user_id", mem_id);
		parameters.add("item_name", item_name);
		parameters.add("quantity", Integer.toString(quantity));
		parameters.add("total_amount", Integer.toString(total_amount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost:8080/order/pay/completed"); // 결제승인시 넘어갈 url
		parameters.add("cancel_url", "http://localhost:8080/order/pay/cancel"); // 결제취소시 넘어갈 url
		parameters.add("fail_url", "http://localhost:8080/order/pay/fail"); // 결제 실패시 넘어갈 url

		System.out.println("파트너주문아이디:" + parameters.get("partner_order_id"));
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(parameters,
				this.getHeaders());

		// 외부url요청 통로 열기.

		// template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
//		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);

		// 외부에 보낼 url
		RestTemplate restTemplate = new RestTemplate();

		String url = "https://kapi.kakao.com/v1/payment/ready";

		readyResponse = restTemplate.postForObject(url, body, ReadyResponse.class);

		// order table에 추가
		KakaoMapper kakaoMapper = sqlSessionTemplate.getMapper(KakaoMapper.class);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setMem_id(mem_id);
			list.get(i).setGroup_id(groupId);
			list.get(i).setTid(readyResponse.getTid());
			list.get(i).setPay_type("kakaoPay");

			kakaoMapper.insertOrder(list.get(i));
		}

		return readyResponse;
	}

	// tid 불러오기
	public PayKakaoVO selectTid(HttpSession session) {
		String mem_id = (String) session.getAttribute("mem_id");

		KakaoMapper kakaoMapper = sqlSessionTemplate.getMapper(KakaoMapper.class);
		PayKakaoVO payKakaoVO = kakaoMapper.selectTid(mem_id);

		return payKakaoVO;
	}

	// 결제 승인요청 메서드
	public ApproveResponse payApprove(PayKakaoVO payKakaoVO, String pg_token) {

		String tid = payKakaoVO.getTid();
		String partner_order_id = payKakaoVO.getGroup_id();
		String mem_id = payKakaoVO.getMem_id();
		// request값 담기.
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", partner_order_id); // 주문명
		parameters.add("partner_user_id", mem_id);
		parameters.add("pg_token", pg_token);

		System.out.println("tid : " + tid + ", pg_token " + pg_token);

		// 하나의 map안에 header와 parameter값을 담아줌.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(
				parameters, this.getHeaders());

		// 외부url 통신

		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
		// 보낼 외부 url, 요청 메시지(header,parameter), 처리후 값을 받아올 클래스.
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		System.out.println("결재승인 응답객체: " + approveResponse);

		return approveResponse;
	}

	// header() 셋팅
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK e67362eef59249c3dc3f4f2d26d99971");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		return headers;
	}

	public List<PayKakaoVO> productToOrder(PayKakaoOrderVO payKakaoOrderVO, HttpSession session) {

		String myid = (String) session.getAttribute("mem_id");

		String[] proCode = payKakaoOrderVO.getPro_code().split(",");
		String[] cartCode = payKakaoOrderVO.getCart_code().split(",");
		String[] cartCnt = payKakaoOrderVO.getCart_cnt().split(",");
		String[] proPrice = payKakaoOrderVO.getPro_price().split(",");
		String[] proName = payKakaoOrderVO.getPro_name().split(",");
		String[] totalPrice = payKakaoOrderVO.getTotalPrice().split(",");
		String[] pro_desc = payKakaoOrderVO.getPro_desc().split(",");
		String[] pro_image = payKakaoOrderVO.getPro_image().split(",");
		String[] cart_day = payKakaoOrderVO.getCart_day().split(",");
		String[] cart_start = payKakaoOrderVO.getCart_start().split(",");

		String pay_req = payKakaoOrderVO.getPay_req();

		System.out.println("갯수 : " + proCode.length);
		List<PayKakaoVO> list = new ArrayList<PayKakaoVO>();

		for (int i = 0; i < proCode.length; i++) {
			PayKakaoVO payKakaoVO = new PayKakaoVO();
			payKakaoVO.setPro_code(proCode[i]);
			payKakaoVO.setCart_code(Integer.parseInt(cartCode[i]));
			payKakaoVO.setCart_cnt(Integer.parseInt(cartCnt[i]));
			payKakaoVO.setPro_price(Integer.parseInt(proPrice[i]));
			payKakaoVO.setPro_name(proName[i]);
			payKakaoVO.setTotalPrice(Integer.parseInt(totalPrice[i]));
			payKakaoVO.setPro_desc(pro_desc[i]);
			payKakaoVO.setPro_image(pro_image[i]);
			payKakaoVO.setCart_day(cart_day[i]);
			payKakaoVO.setCart_start(Date.valueOf(cart_start[i]));
			payKakaoVO.setPay_req(pay_req);

			list.add(payKakaoVO);
		}

		return list;
	}

	@Transactional
	public void updateAndInsertPay(HttpSession session) {
		String mem_id = (String) session.getAttribute("mem_id");
		KakaoMapper kakaoMapper = sqlSessionTemplate.getMapper(KakaoMapper.class);

		List<PayVO> orderList = kakaoMapper.selectOrderList(mem_id);
		List<PayVO> payList = new ArrayList<>();
		for (PayVO kakaoOrder : orderList) {
			PayVO order = new PayVO();
			order.setMem_id(kakaoOrder.getMem_id());
			order.setPro_code(kakaoOrder.getPro_code());
			order.setPro_name(kakaoOrder.getPro_name());
			order.setPro_price(kakaoOrder.getPro_price());
			order.setPro_desc(kakaoOrder.getPro_desc());
			order.setPro_image(kakaoOrder.getPro_image());
			order.setCart_cnt(kakaoOrder.getCart_cnt());
			order.setTotalPrice(kakaoOrder.getTotalPrice());
			order.setMem_name(kakaoOrder.getMem_name());
			order.setMem_phone(kakaoOrder.getMem_phone());
			order.setMem_gender(kakaoOrder.getMem_gender());
			order.setMem_age(kakaoOrder.getMem_age());
			order.setMem_add1(kakaoOrder.getMem_add1());
			order.setMem_add2(kakaoOrder.getMem_add2());
			order.setMem_zipcode(kakaoOrder.getMem_zipcode());
			order.setCart_day(kakaoOrder.getCart_day());
			order.setCart_start((Date) kakaoOrder.getCart_start());
			order.setPay_req(kakaoOrder.getPay_req());
			order.setStatus("결제 완료");
			order.setGroup_id(kakaoOrder.getGroup_id());
			payList.add(order);
		}
		System.out.println("payList는 ~~~~~~~~~~~~~~:::::" + payList);
		kakaoMapper.updateOrderList(mem_id);
		kakaoMapper.insertPayList(payList);
	}

	public void payCancel(HttpSession session) {

	}
}
