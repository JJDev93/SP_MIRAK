<<<<<<< HEAD


package kr.co.mirak.member;

import java.util.List;

public interface LoginService {
	List<MemberVO> list();
	MemberVO info(int id);
	int insert(MemberVO vo);
	int update(MemberVO vo);
	int delete(int id);
=======
package kr.co.mirak.member;

import java.util.List;

public interface LoginService {
	List<MemberVO> list();
	MemberVO info(int id);
	int insert(MemberVO vo);
	int update(MemberVO vo);
	int delete(int id);
>>>>>>> branch 'Member' of https://github.com/ywshin0112/mirak.git
}