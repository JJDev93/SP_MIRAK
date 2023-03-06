package kr.co.mirak.admin.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.mirak.product.ProductService;
import kr.co.mirak.product.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	public void insertProduct(ProductVO vo) {

		productDAO.insertProduct(vo);
	}

	public List<ProductVO> productList(ProductVO vo) {
		
		return productDAO.productList(vo);

	}
	
	public List<ProductVO> optionList(ProductVO vo) {
		
		return productDAO.optionList(vo);

	}
	
	public ProductVO productDetail(ProductVO vo) {
		return productDAO.productDetail(vo);
	}

}
