package kr.co.mirak.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class LoginServiceImpl implements LoginService{
	
	private SqlSessionTemplate sqlSessionTemplate;

	public LoginServiceImpl() {}
	
	public LoginServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	

	public List<MemberVO> list() {

		MemberMapper dao = sqlSessionTemplate.getMapper(MemberMapper.class);
		List<MemberVO> list = dao.list();

		return list;
	}

	public MemberVO info(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insert(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}