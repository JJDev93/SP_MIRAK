package kr.co.mirak.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public Map<String, List<ProductVO>> productList(List<String> cateList) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		Map<String, List<ProductVO>> productList = new HashMap<>();

	    for (String cate : cateList) {
	        List<ProductVO> byCateProduct = mapper.productList(cate);
	        String category = "";
	        if(cate.equals("O")) {
	        	category = "1인세트";
	        } else if(cate.equals("T")) {
	        	category = "2·3인세트";
	        } else {
	        	category = "프리미엄";
	        }
	        productList.put(category, byCateProduct);
	    }

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
	
	
	public List<ProductVO> productListIndex1(ProductVO vo) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productListIndex1(vo);

		return productList;

	}
	
	public List<ProductVO> productListIndex2(ProductVO vo) {

		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		List<ProductVO> productList = mapper.productListIndex2(vo);

		return productList;

	}

}
