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

	public List<ProductVO> productList1(Criteria cri) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productList1(cri);

		return productList;

	}

	public List<ProductVO> productList2(Criteria cri) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productList2(cri);

		return productList;

	}

	public List<ProductVO> productList3(Criteria cri) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productList3(cri);

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

	public List<ProductVO> getListPaging(Criteria cri) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.getListPaging(cri);
	}

	public int getTotal() {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.getTotal();
	}

	public int getTotalP() {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.getTotalP();
	}

	public int getTotalT() {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.getTotalT();
	}

	public int getTotalO() {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.getTotalO();
	}

}
