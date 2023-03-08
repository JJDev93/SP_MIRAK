package kr.co.mirak.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ProductVO> productList(ProductVO vo) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productList(vo);

		return productList;

	}

	public List<ProductVO> productList1(ProductVO vo) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productList1(vo);

		return productList;

	}
	public List<ProductVO> productList2(ProductVO vo) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productList2(vo);

		return productList;

	}
	public List<ProductVO> productList3(ProductVO vo) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productList3(vo);

		return productList;

	}

	public void insertProduct(ProductVO vo) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		mapper.insertProduct(vo);
	}

	public ProductVO productDetail(ProductVO vo) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.productDetail(vo);
	}

	public void updateProduct(ProductVO vo) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		mapper.updateProduct(vo);
	}

	public void deleteProduct(ProductVO vo) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		mapper.deleteProduct(vo);

	}
	
	
	
	

}
