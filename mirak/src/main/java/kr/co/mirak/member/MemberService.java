package kr.co.mirak.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

public interface MemberService {
	MemberVO login(MemberVO vo);

	MemberVO idfind(MemberVO vo);

	MemberVO idfind_pw(MemberVO vo);

	int pwreset(MemberVO vo);

	int createUser(MemberVO vo);

	int naverinsert(MemberVO vo);

	MemberVO getMemberInfo(HttpSession session);

	int memupdate(MemberVO vo);

	MemberVO getMemberDetail(String memId);

	int idCheck(String id) throws Exception;

	String getAccessToken(String code);

	HashMap<String, Object> getUserInfo(String access_Token);

	void kakaoLogout(String access_Token);
	
	void unlink(String attribute);
	
	int memdelete(MemberVO vo);
	
	/* 게시판 총 갯수 */
	public int getTotal(CriteriaM cri);
	List<MemberVO> getListPaging(CriteriaM cri);
	MemberVO adminMemberDetail(MemberVO vo);
	int adminMemberUpdate(MemberVO vo);
	int adminMemberDel(MemberVO vo);
	// 여기까지

	
}