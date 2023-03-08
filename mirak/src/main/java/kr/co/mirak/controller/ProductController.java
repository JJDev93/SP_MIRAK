package kr.co.mirak.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mirak.product.ProductService;
import kr.co.mirak.product.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	// 상품 Admin 리스트
	@RequestMapping("/ProductAdminList")
	public String productList(ProductVO vo, Model model) {

		model.addAttribute("productList", productService.productList(vo));

		return "/product/ProductAdminList";

	}

//	 상품 Client 리스트
	@RequestMapping("/ProductClientList")
	public String productclientList(ProductVO vo, Model model)  {

		model.addAttribute("productList", productService.productList(vo));	

		
		
		return "/product/ProductClientList";

	}

//	 상품 Client 프리미엄 리스트
	@RequestMapping("/ProductClientListP")
	public String productclientList1(ProductVO vo, Model model) {

		model.addAttribute("productList", productService.productList1(vo));

		return "/product/ProductClientList";
	}

//	 상품 Client 2,3인 리스트
	@RequestMapping("/ProductClientListT")
	public String productclientList2(ProductVO vo, Model model) {

		model.addAttribute("productList", productService.productList2(vo));

		return "/product/ProductClientList";
	}

//	 상품 Client 1인 리스트
	@RequestMapping("/ProductClientListO")
	public String productclientList3(ProductVO vo, Model model) {

		model.addAttribute("productList", productService.productList3(vo));

		return "/product/ProductClientList";
	}

	// 상품 등록 페이지 이동
	@RequestMapping(value = "/ProductAdminRegister")
	public String productregisterList() {

		return "/product/ProductAdminRegister";
	}

	// 상품 등록
	@RequestMapping(value = "/productregister")
	public String productregister(ProductVO vo) throws IOException {

		// 파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(
					new File("C:/Users/hi/git/mirak/mirak/src/main/webapp/resources/images/product/" + fileName));
		}

		productService.insertProduct(vo);
		System.out.println(vo);

		return "redirect:/ProductAdminList";
	}

	// 상품 Client 상세 페이지
	@RequestMapping(value = "/ProductClientDetail")
	public String productclientDetail(ProductVO vo, Model model) {

		model.addAttribute("product", productService.productDetail(vo));

		productService.productDetail(vo);

		return "/product/ProductClientDetail";
	}

	// 상품 Admin 상세 페이지
	@RequestMapping(value = "/ProductAdminDetail")
	public String productDetail(ProductVO vo, Model model) {
		model.addAttribute("product", productService.productDetail(vo));

		productService.productDetail(vo);

		return "/product/ProductAdminDetail";

	}

	// 상품 수정
	@RequestMapping("/productupdate")
	public String updateProduct(ProductVO vo) {
		productService.updateProduct(vo);

		return "redirect:/ProductAdminList";
	}

	// 상품 삭제
	@RequestMapping("/deleteproduct")
	public String deleteProduct(ProductVO vo) {
		productService.deleteProduct(vo);

		return "redirect:/ProductAdminList";
	}

	// 장바구니 화면으로 이동
//	@RequestMapping(value = "/ProductAdminRegister")
//	public String productcartList() {
//
//		return "/product/ProductAdminRegister";
//	}
	
	@RequestMapping(value = "/pay")
	public String productPay() {
		
	
		return "/pay/pay";
	}
	
	
	

}
