package kr.co.mirak.admin.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mirak.product.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public void insertProduct(ProductVO vo) {
		
		mybatis.insert("ProductDAO.insertProduct",vo);

	}
	
	public List<ProductVO> productList(ProductVO vo){
		
		return mybatis.selectList("ProductDAO.productList",vo);
	}
	
	public List<ProductVO> optionList(ProductVO vo){
		
		return mybatis.selectList("ProductDAO.optionList",vo);
	}
	
	public ProductVO productDetail(ProductVO vo) {
		
		return (ProductVO) mybatis.selectOne("ProductDAO.productDetail",vo);
		
	}
	

}
