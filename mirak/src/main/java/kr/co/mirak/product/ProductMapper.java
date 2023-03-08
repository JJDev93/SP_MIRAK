package kr.co.mirak.product;

import java.util.List;


public interface ProductMapper {
	List<ProductVO> productList(ProductVO vo);
	
	List<ProductVO> productList1(ProductVO vo);

	List<ProductVO> productList2(ProductVO vo);
	
	List<ProductVO> productList3(ProductVO vo);
	
	void insertProduct(ProductVO vo);

	ProductVO productDetail(ProductVO vo);

	void updateProduct(ProductVO vo);

	void deleteProduct(ProductVO vo);
	
	

	
	

}
