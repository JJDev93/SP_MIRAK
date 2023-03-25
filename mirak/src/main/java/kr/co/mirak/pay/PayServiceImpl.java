package kr.co.mirak.pay;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.mirak.cart.CartVO;
import kr.co.mirak.product.ProductMapper;
import kr.co.mirak.product.ProductVO;

public class PayServiceImpl implements PayService {

	private SqlSessionTemplate sqlSessionTemplate;

	public PayServiceImpl() {
	}

	public PayServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<PayVO> getAdminPayList(CriteriaP criP) {

		PayMapper payMapper = sqlSessionTemplate.getMapper(PayMapper.class);
		List<PayVO> adminPayList = payMapper.getAdminPayList(criP);

		return adminPayList;

	}

	@Override
	public List<PayVO> getPayListDetail(String group_id) {

		PayMapper payMapper = sqlSessionTemplate.getMapper(PayMapper.class);
		List<PayVO> payListDetail = payMapper.getPayListDetail(group_id);

		return payListDetail;
	}
	

	@Override
	public int updatePayments(PayVO payVO) {
		PayMapper payMapper = sqlSessionTemplate.getMapper(PayMapper.class);
		int result = payMapper.updatePayments(payVO);
		if(result == 1) {
			return result;
		}
		return 0;
	}

	public int getTotal() {
		PayMapper mapper = sqlSessionTemplate.getMapper(PayMapper.class);
		return mapper.getTotal();
	}
	
	public List<PayVO> getClientPayList(HttpSession session) {

		String mem_id = (String) session.getAttribute("mem_id");
		
		PayMapper payMapper = sqlSessionTemplate.getMapper(PayMapper.class);
		List<PayVO> list = payMapper.getClientPayList(mem_id);
		System.out.println(list.size());
		return list;
	}
	
	public List<PayVO> getProductInfo(String group_id) {

		PayMapper payMapper = sqlSessionTemplate.getMapper(PayMapper.class);
		List<PayVO> list = payMapper.getProductInfo(group_id);
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.indexOf(i));
		}
		return list;
	}

	public PayVO info(int id) {
		// TODO Auto-generated method stub
		return null;
	}


	public int updateStateConfirm(String group_id) {
		PayMapper mapper = sqlSessionTemplate.getMapper(PayMapper.class);
		int result = mapper.updateStatusConfirm(group_id);
		
		
		return result;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ProductVO productDetail(ProductVO vo) {
		ProductMapper mapper = sqlSessionTemplate.getMapper(ProductMapper.class);
		return mapper.productDetail(vo);
	}

	public List<CartVO> cartCheckList(HttpSession session) {
		String mem_id = (String) session.getAttribute("mem_id");
		PayMapper mapper = sqlSessionTemplate.getMapper(PayMapper.class);
		List<CartVO> list = mapper.cartCheckList(mem_id);
		return list;
	}
	
	public List<ProductVO> payFromProduct(ProductVO productVO, String cart_cnt, Date cart_start, String cart_day) {
		
		productVO.setCart_cnt(Integer.parseInt(cart_cnt));
		productVO.setCart_day(cart_day);
		productVO.setCart_start(cart_start);
		
		List<ProductVO> list = new ArrayList<ProductVO>();
		list.add(productVO);

		
		return list;
	}

	@Override
	public List<PayVO> adaptPayVO(PayStringVO payStringVO, HttpSession session) {
		return null;
	}


}
