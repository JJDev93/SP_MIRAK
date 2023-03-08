package kr.co.mirak.product;

import java.util.List;

public interface ProductService {
	
	// 상품 등록
	void insertProduct(ProductVO vo);
	
	//상품 목록 조회
	List<ProductVO> productList(ProductVO vo);
	
	//상품 목록 조회
	List<ProductVO> optionList(ProductVO vo);
	
	// 상품 상세 조회
	ProductVO productDetail(ProductVO vo);

}
