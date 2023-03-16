package kr.co.mirak.cart;

import java.sql.Date;
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


   

	@Override
	public int cartInsert(CartVO vo, HttpSession session) {
		String mem_id = (String)session.getAttribute("mem_id");
	      int cart_cnt = vo.getCart_cnt();
	      Date cart_start = vo.getCart_start();
	      String cart_day = vo.getCart_day();
	      	      
	      CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
	      vo = mapper.productToCart(vo);
	      vo.setMem_id(mem_id);
	      vo.setCart_cnt(cart_cnt);
	      vo.setCart_start(cart_start);
	      vo.setCart_day(cart_day);
	      int result = mapper.cartInsert(vo);

	      return result;
	}
	
	@Override
	public void cartUpdate(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		mapper.cartUpdate(vo);
	}
	
	@Override
	public void cartDelete(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		mapper.cartDelete(vo);
	}

}