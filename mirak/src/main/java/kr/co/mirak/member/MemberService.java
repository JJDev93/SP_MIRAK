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
	int memdelete(MemberVO vo);

//	List<MemberVO> getMemberList(Optional<Integer> pageStart);
	MemberVO getMemberDetail(String memId);
	int idCheck(String id) throws Exception;

	
	// 카카오 로그인
//	String getAccessToken(String code);
//	MemberVO getUserInfo(String access_Token);
	
	String getAccessToken(String code);
	
	HashMap<String, Object> getUserInfo(String access_Token);
	
	void kakaoLogout(String access_Token);
	
//	void unlink(String access_Token);
	
	

	// 김원중이 건드린 부분

	/* 게시판 총 갯수 */
	public int getTotal();

	List<MemberVO> getListPaging(CriteriaM cri);

	MemberVO getMemberDetail(MemberVO mvo);
	
	


	// 여기까지

}
