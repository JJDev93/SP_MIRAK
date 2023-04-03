package kr.co.mirak.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	MemberVO login(MemberVO memberVO);

	List<MemberVO> idfind(MemberVO vo); //

	int idfind_pw(MemberVO vo);

	int pwreset(MemberVO vo);

	int createUser(MemberVO vo);

	int naverinsert(MemberVO vo);

	int memupdate(MemberVO vo);

	int memdelete(MemberVO vo);

	MemberVO getMemberInfo(@Param("mem_id") String mem_id, @Param("mem_isapi") String mem_isapi);

	int idCheck(String id);

	int existIdAndIsApi(@Param("mem_id") String mem_id, @Param("mem_isapi")String mem_isapi);

	// 카카오 로그인
	// MemberVO findkakao(HashMap<String, Object> userInfo);
	// void kakaoinsert(HashMap<String, Object> userInfo);

	// 김원중이 건드린 부분

	/* 게시판 총 갯수 */
	public int getTotal(CriteriaM cri);

	/* 게시판 목록(페이징 적용) */
	public List<MemberVO> getListPaging(CriteriaM cri);

	MemberVO adminMemberDetail(MemberVO vo);

	int adminMemberDel(MemberVO vo);

	int adminMemberUpdate(MemberVO vo);


}
