package kr.co.mirak.product.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mirak.product.ProductService;
import kr.co.mirak.product.ProductVO;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	// 상품 리스트
	@RequestMapping("/ProductAdminList")
	public String productList(ProductVO vo, Model model) {

		model.addAttribute("productList", productService.productList(vo));
		model.addAttribute("optionList", productService.optionList(vo));

		return "/product/ProductAdminList";

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
//		MultipartFile uploadFile = ivo.getUploadFile();
//		if(!uploadFile.isEmpty()){
//			String fileName = uploadFile.getOriginalFilename();
//			uploadFile.transferTo(new File("C:/up/" + fileName));
//		}

		productService.insertProduct(vo);
		System.out.println(vo);

		return "redirect:/ProductAdminList";
	}

	// 상품 상세 조회
	@RequestMapping(value = "/ProductAdminDetail")
	public String productDetail(ProductVO vo, Model model) {
		model.addAttribute("product", productService.productDetail(vo));

		return "/product/ProductAdminDetail";

	}

}
