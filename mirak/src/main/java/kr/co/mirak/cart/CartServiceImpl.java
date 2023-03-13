package kr.co.mirak.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

public class CartServiceImpl implements CartService {

	private SqlSessionTemplate sqlSessionTemplate;

	public CartServiceImpl() {}

	public CartServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}   

	public List<CartVO> cartClientList(CartVO vo) {
		
	    CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		List<CartVO> list = mapper.cartClientList(vo);

		return list;
	}

	public List<CartVO> cartAdminList() {

		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		List<CartVO> list = mapper.cartAdminList();

		return list;
	}

	public CartVO info(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insert(CartVO vo, HttpSession session) {
		String mem_id = (String)session.getAttribute("mem_id");
		int cart_cnt = vo.getCart_cnt();
		
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		vo = mapper.productToCart(vo);
		vo.setMem_id(mem_id);
		vo.setCart_cnt(cart_cnt);
		int result = mapper.insert(vo);

		return result;
	}

	public int update(CartVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}