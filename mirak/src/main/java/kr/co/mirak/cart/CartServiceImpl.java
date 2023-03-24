package kr.co.mirak.cart;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import kr.co.mirak.member.MemberMapper;
import kr.co.mirak.member.MemberVO;

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
	
//	@Override
//	public int cartUpdate(CartVO vo, HttpSession session) {
//		String mem_id = (String)session.getAttribute("mem_id");
//	      int cart_cnt = vo.getCart_cnt();
//	      Date cart_start = vo.getCart_start();
//	      String cart_day = vo.getCart_day();
//	      	      
//	      CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
//	      vo = mapper.productToCart(vo);
//	      vo.setMem_id(mem_id);
//	      vo.setCart_cnt(cart_cnt);
//	      vo.setCart_start(cart_start);
//	      vo.setCart_day(cart_day);
//	      int result = mapper.cartUpdate(vo);
//
//	      return result;
//	}
	
	@Override
	public void cartUpdate(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		mapper.cartUpdate(vo);
	}
	@Override
	public void cartUpdateCheck(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		mapper.cartUpdateCheck(vo);
	}
	@Override
	public void cartUpdateCheckAll(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		mapper.cartUpdateCheckAll(vo);
	}
	
	@Override
	public void cartDelete(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		mapper.cartDelete(vo);
	}
	
	public int getTotal() {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		return mapper.getTotal();
	}
	
	public List<CartVO> getListPaging(CriteriaC cri) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		return mapper.getListPaging(cri);
	}
	
	public CartVO cartDetail(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		return mapper.cartDetail(vo);
	}
	
	@Override
	public void cartAdminDelete(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		mapper.cartAdminDelete(vo);
	}
	
	@Override
	public void cartAdminUpdate(CartVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		mapper.cartAdminUpdate(vo);
	}
	
	public MemberVO adminMemberDetail2(MemberVO vo) {
		CartMapper mapper = sqlSessionTemplate.getMapper(CartMapper.class);
		MemberVO memVO = mapper.adminMemberDetail2(vo);
		memVO.toString();
		return memVO;
	}
}