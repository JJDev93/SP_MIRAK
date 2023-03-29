package kr.co.mirak.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.mirak.product.Criteria;
import kr.co.mirak.product.PageMakerDTO;
import kr.co.mirak.product.ProductService;
import kr.co.mirak.product.ProductVO;

import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpSession;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	// 상품 Client 리스트
	@RequestMapping("/ProductClientList")
	public String productList(ProductVO vo, Model model, Criteria cri) {

//      model.addAttribute("productList", productService.productList(vo));
		model.addAttribute("productList", productService.getListPaging(cri));
		int total = productService.getTotal();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);
		return "/product/ProductClientList";

	}

	// 상품 Client 전체메뉴 페이징
	@RequestMapping("/ProductClientList/{num}")
	public String productList(ProductVO vo, Model model, Criteria cri, @PathVariable("num") int num) {

		cri.setPageNum(num);
		model.addAttribute("productList", productService.getListPaging(cri));
		int total = productService.getTotal();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);
		return "/product/ProductClientList";

	}

//    상품 Client 프리미엄 리스트
	@RequestMapping("/ProductClientListP")
	public String productclientList1(ProductVO vo, Model model, Criteria cri) {

		model.addAttribute("productList", productService.productList1(cri));
//      model.addAttribute("productList", productService.getListPaging(cri));
		int total = productService.getTotalP();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/product/ProductClientListP";
	}
	
	// 상품 Client 프리미엄 페이징
	@RequestMapping("/ProductClientListP/{num}")
	public String productclientList1(ProductVO vo, Model model, Criteria cri, @PathVariable("num") int num) {

		cri.setPageNum(num);
		model.addAttribute("productList", productService.productList1(cri));
		int total = productService.getTotalP();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/product/ProductClientListP";
	}

	//상품 Client 2,3인 리스트
	@RequestMapping("/ProductClientListT")
	public String productclientList2(ProductVO vo, Model model, Criteria cri) {

		model.addAttribute("productList", productService.productList2(cri));
		int total = productService.getTotalT();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/product/ProductClientListT";
	}
	
	// 상품 Client 2,3인 페이징
	@RequestMapping("/ProductClientListT/{num}")
	public String productclientList2(ProductVO vo, Model model, Criteria cri, @PathVariable("num") int num) {

		cri.setPageNum(num);
		model.addAttribute("productList", productService.productList2(cri));
		int total = productService.getTotalT();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/product/ProductClientListT";
	}

	//상품 Client 1인 리스트
	@RequestMapping("/ProductClientListO")
	public String productclientList3(ProductVO vo, Model model, Criteria cri) {

		model.addAttribute("productList", productService.productList3(cri));
		int total = productService.getTotalO();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/product/ProductClientListO";
	}
	// 상품 Client 1인 페이징
	@RequestMapping("/ProductClientListO/{num}")
	public String productclientList3(ProductVO vo, Model model, Criteria cri, @PathVariable("num") int num) {

		cri.setPageNum(num);
		model.addAttribute("productList", productService.productList3(cri));
		int total = productService.getTotalO();

		PageMakerDTO pageMake = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMake);

		return "/product/ProductClientListO";
	}

	// 상품 Client 상세 페이지
	@RequestMapping(value = "/ProductClientDetail/{pro_code}")
	public String productclientDetail(ProductVO vo, Model model) {

		model.addAttribute("product", productService.productDetail(vo));

		productService.productDetail(vo);

		return "/product/ProductClientDetail";
	}

	// 상품 Admin 리스트
	@RequestMapping("/admin/products/{page}")
	public String productadminList(ProductVO vo, Model model, Criteria cri, @PathVariable("page") int page) {
		cri.setPageNum(page);
		model.addAttribute("productList", productService.getListPaging(cri));
		model.addAttribute("curPage", page);
		int total = productService.getTotal();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		return "/product/ProductAdminList";
	}

	// 상품 등록 페이지 이동
	@RequestMapping(value = "/admin/productRegister", method = RequestMethod.GET)
	public String productregisterList() {
		return "/product/ProductAdminRegister";
	}

	// 상품 등록
	@RequestMapping(value = "/admin/productRegister", method = RequestMethod.POST)
	public String productregister(ProductVO vo, MultipartHttpServletRequest request) throws IOException {
		// 파일 업로드 처리
		
//		String url = "C:/Users/hi/git/mirak/mirak/src/main/webapp/resources/images/product/";
		String url = "/home/tomcat/apache-tomcat-9.0.73/webapps/mirak/resources/images/product/";
		
		MultipartFile uploadFile = vo.getUploadFile();
			if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(
					new File( url + fileName));
			
		}
		productService.insertProduct(vo);
		System.out.println(vo);
		return "redirect:/admin/products/1";
	}

	// 상품 Admin 상세 페이지
	@RequestMapping(value = "/admin/product/{curPage}/{pro_code}")
	public String productDetail(ProductVO vo, Model model, Criteria cri, @PathVariable("curPage") int curPage) {
		model.addAttribute("product", productService.productDetail(vo));
		model.addAttribute("curPage", curPage);
		productService.productDetail(vo);

		int total = productService.getTotal();
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);

		return "/product/ProductAdminDetail";
	}

	// 상품 수정
	@RequestMapping(value = "/admin/productUpdate")
	public String updateProduct(ProductVO vo, Model model, Criteria cri, @RequestParam("curPage") int curPage) {
		productService.updateProduct(vo);
		model.addAttribute("curPage", curPage);
		return "redirect:/admin/products/{curPage}";
	}

	// 상품 삭제
	@RequestMapping("/admin/productDelete")
	public String deleteProduct(ProductVO vo) {
		productService.deleteProduct(vo);
		return "redirect:/admin/products/1";
	}

//	// 인덱스 페이지
//	@RequestMapping("/")
//	public String productListindex(ProductVO vo, Model model) {
//		model.addAttribute("productList2", productService.productListIndex1(vo));
//		model.addAttribute("productList1", productService.productListIndex2(vo));
//		return "/index";
//	}

	// 인덱스 페이지
	@RequestMapping("/")
	public String productListindex(ProductVO vo, Model model, HttpSession session) {
		model.addAttribute("productList2", productService.productListIndex1(vo));
		model.addAttribute("productList1", productService.productListIndex2(vo));
		session.removeAttribute("pre_url");
		String preUrl = (String) session.getAttribute("pre_url");
		System.out.println("pre_url 만료 완료." + preUrl);
		return "/index";
	}
}