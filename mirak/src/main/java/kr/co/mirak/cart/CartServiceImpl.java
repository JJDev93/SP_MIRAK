package kr.co.mirak.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

   public int cartInsert(CartVO vo, HttpSession session) {
	      
	      String mem_id = (String)session.getAttribute("mem_id");
	      int cart_cnt = vo.getCart_cnt();
	      System.out.println(mem_id + cart_cnt);
	      CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
	      vo = mapper.productToCart(vo);      
	      vo.setMem_id(mem_id);
	      vo.setCart_cnt(cart_cnt);
	      int result = mapper.cartInsert(vo);      
	      
	      return result;
	   }

   // ?
   public int cartUpdate(CartVO vo, HttpSession session) {
	   
	   String mem_id = (String)session.getAttribute("mem_id");
	      int cart_cnt = vo.getCart_cnt();
	      System.out.println(mem_id + cart_cnt);
	      CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
	      vo = mapper.productToCart(vo);      
	      vo.setMem_id(mem_id);
	      vo.setCart_cnt(cart_cnt);
	      int result = mapper.cartUpdate(vo);      
	      
	      return result;
   }

   // ?
   public int cartDelete(CartVO vo, HttpSession session) {
	   
	   String mem_id = (String)session.getAttribute("mem_id");
	      int cart_cnt = vo.getCart_cnt();
	      System.out.println(mem_id + cart_cnt);
	      CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
	      vo = mapper.productToCart(vo);      
	      vo.setMem_id(mem_id);
	      vo.setCart_cnt(cart_cnt);
	      int result = mapper.cartDelete(vo);      
	      
	      return result;
   }
   
}