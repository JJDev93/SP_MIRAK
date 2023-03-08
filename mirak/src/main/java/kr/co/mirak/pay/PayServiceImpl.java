package kr.co.mirak.pay;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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

}
