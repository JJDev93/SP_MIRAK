package kr.co.mirak.pay;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.mirak.cart.CartVO;
import kr.co.mirak.product.ProductMapper;
import kr.co.mirak.product.ProductVO;

public class PayServiceImpl implements PayService {

	private SqlSessionTemplate sqlSessionTemplate;

	public PayServiceImpl() {}
	
	public PayServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	

	public List<PayVO> list() {

		PayMapper dao = sqlSessionTemplate.getMapper(PayMapper.class);
		List<PayVO> list = dao.list();

		return list;
	}

	public PayVO info(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insert(PayVO vo) {
		PayMapper dao = sqlSessionTemplate.getMapper(PayMapper.class);
		int a = dao.insert(vo);
		return a;
	}

	public int update(PayVO vo) {
		// TODO Auto-generated method stub
		return 0;
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
		String myid = (String)session.getAttribute("mem_id");
		PayMapper mapper = sqlSessionTemplate.getMapper(PayMapper.class);
		List<CartVO> list  = mapper.cartCheckList(myid);
		return list;
	}
	
	public List<PayVO> adaptPayVO(PayStringVO payStringVO, HttpSession session) {
		String myid = (String)session.getAttribute("mem_id");
		//pro_code, cart_cnt, pay_req 
				
		String[] proCode = payStringVO.getPro_code().split(",");
		String[] cartCnt = payStringVO.getCart_cnt().split(",");
		String[] payReq = payStringVO.getPay_req().split(",");
		
		
		

		
		return null;		
	}
	

}
