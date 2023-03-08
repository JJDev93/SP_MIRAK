package kr.co.mirak.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CartServiceImpl implements CartService {
   
   private SqlSessionTemplate sqlSessionTemplate;
   
   public CartServiceImpl() {}
   
   public CartServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
      this.sqlSessionTemplate = sqlSessionTemplate;
   }   

   public List<CartVO> list() {

      CartMapper dao = sqlSessionTemplate.getMapper(CartMapper.class);
      List<CartVO> list = dao.list();

      return list;
   }

   public CartVO info(int id) {
      // TODO Auto-generated method stub
      return null;
   }

   public int insert(CartVO vo) {
      // TODO Auto-generated method stub
      return 0;
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